//
//  QRcodeManger.h
//  demo(二维码)
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 paopao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QRcodeManger : NSObject


/**
 *  创建二维码管理单例
 */
+ (instancetype)defaultManger;


/**
 *  生成二维码
 *
 *  @param message    二维码包含的信息 
 *  @param centerIcon 二维码中间的小图标 (可以为空)
 *  @param size 二维码的尺寸
 */
- (UIImage *)createQRcodeWithMessage:(NSString *)message centerIcon:(UIImage *)centerIcon size:(CGFloat)size;


/**
 *  创建二维码扫描视图
 *
 *  @param superView 父视图
 */
- (void)starCaptureInSubperView:(UIView *)superView didCaptureMessage:(void(^)(NSString *message))didCaptureMessage;



/**
 *  识别图片中的二维码 仅支持5s以上的设备
 *
 *  @param image 二维码图片
 *
 *  @return 识别出的信息
 */
- (NSString *)captureMessageFromeImage:(UIImage *)image;

@end
