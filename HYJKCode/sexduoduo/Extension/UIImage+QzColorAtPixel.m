//
//  UIImage+QzColorAtPixel.m
//  sexduoduo
//
//  Created by showm on 15/7/8.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "UIImage+QzColorAtPixel.h"

@implementation UIImage (QzColorAtPixel)

- (UIColor *)colorAtPixel:(CGPoint)point {
    // Cancel if point is outside image coordinates
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point)) {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = self.CGImage;
    NSUInteger width = self.size.width;
    NSUInteger height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    // Draw the pixel we are interested in onto the bitmap context
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    // Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


//设置图片可拉伸
- (UIImage *)setImageCanStretch
{
    CGFloat top = 15; // 顶端盖高度
    CGFloat bottom = 15 ; // 底端盖高度
    CGFloat left = 10; // 左端盖宽度
    CGFloat right = 10; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
    UIImage * image = [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    
    return image;
}

//设置图片可拉伸
- (UIImage *)setImageCanStretchwithTop:(CGFloat)tempTop bottom:(CGFloat)tempBottom left:(CGFloat)tempLeft right:(CGFloat)tempRight
{
    CGFloat top = tempTop; // 顶端盖高度
    CGFloat bottom = tempBottom ; // 底端盖高度
    CGFloat left = tempLeft; // 左端盖宽度
    CGFloat right = tempRight; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
    UIImage * image = [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    
    return image;
}
+ (UIImage *)resizableImage:(NSString *)name top:(CGFloat)top andLeft:(CGFloat)left
{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat w = normal.size.width * left;
    CGFloat h = normal.size.height * top;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}
@end
