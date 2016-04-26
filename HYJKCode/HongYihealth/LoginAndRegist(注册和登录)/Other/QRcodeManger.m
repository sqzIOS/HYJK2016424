//
//  QRcodeManger.m
//  demo(二维码)
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 paopao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import <AVFoundation/AVFoundation.h>

#import "QRcodeManger.h"

@interface QRcodeManger () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic,weak) AVCaptureSession *session;
@property (nonatomic,weak) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic,copy) void(^didCaptureMessage)(NSString *message);


@end

@implementation QRcodeManger

#pragma mark - 创建二维码管理单例

+ (instancetype)defaultManger
{
    static QRcodeManger *defaultManger;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultManger = [[QRcodeManger alloc] init];
    });
    return defaultManger;
}

#pragma mark - 识别图片中的二维码
- (NSString *)captureMessageFromeImage:(UIImage *)image
{
    NSString *message = nil;
    
    // 识别器
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode
                                              context:[CIContext contextWithOptions:nil]
                                              options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    
    
    // 识别图片特征
    CIImage *ciimage = [CIImage imageWithCGImage:image.CGImage];
    NSArray *features = [detector featuresInImage:ciimage];
    
    
    if (features.count > 0) {
        for (CIFeature *feature in features) {
            if ([feature isKindOfClass:[CIQRCodeFeature class]]) {
                message = ((CIQRCodeFeature *)feature).messageString;
                break;
            }
        }
    }
    
    return message;
}

#pragma mark - 创建二维码扫描图层
- (void)starCaptureInSubperView:(UIView *)superView didCaptureMessage:(void(^)(NSString *message))didCaptureMessage;
{
    self.didCaptureMessage = didCaptureMessage;
    
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    self.session = session;
    
    // 输入设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    [session addInput:input];
    
    // 输出
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [session addOutput:output];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    // 扫描层
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    self.previewLayer = previewLayer;
    previewLayer.frame = superView.bounds;
    [superView.layer insertSublayer:previewLayer atIndex:0];
    
    
    [session startRunning];

}

#pragma mark - 扫描到数据
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *message = nil;
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *object = [metadataObjects lastObject];
        message = object.stringValue;
    }
    self.didCaptureMessage(message);
    [self.session stopRunning];
    [self.previewLayer removeFromSuperlayer];
}

#pragma mark - 生成二维码
- (UIImage *)createQRcodeWithMessage:(NSString *)message centerIcon:(UIImage *)centerIcon size:(CGFloat)size
{
    if (message == nil) {
        return nil;
    }
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *image = [filter outputImage];
    UIImage *outputImage = [self imageFromeCIImage:image withSize:size];
    
    if (centerIcon) {
        outputImage = [self synthesisQRcode:outputImage AndCenterIcon:centerIcon];
    }
    
    return outputImage;
}

#pragma mark - 将二维码和图标合成
- (UIImage *)synthesisQRcode:(UIImage *)qrcode AndCenterIcon:(UIImage *)centerIcon
{
    UIGraphicsBeginImageContext(qrcode.size);
    [qrcode drawAsPatternInRect:CGRectMake(0, 0, qrcode.size.width, qrcode.size.height)];
    CGFloat width = qrcode.size.width / 5;
    CGFloat height = qrcode.size.height / 5;
    CGRect centerIconRect = CGRectMake((qrcode.size.width - width) / 2, (qrcode.size.height - height) / 2, width, height);
    
    CGFloat cornerRadius = width / 3;
    centerIcon = [self setImage:centerIcon cornerRadius:cornerRadius];
    [centerIcon drawInRect:centerIconRect];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

#pragma mark - 图片设置圆角
- (UIImage *)setImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.clipsToBounds = YES;
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    imageView.layer.cornerRadius = cornerRadius;
    
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size, YES, [UIScreen mainScreen].scale);
    [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}


#pragma mark - CIImage 装换 UIImage
- (UIImage *)imageFromeCIImage:(CIImage *)image withSize:(CGFloat)size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 创建bitmap
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) *scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return  [UIImage imageWithCGImage:scaledImage];
}



@end
