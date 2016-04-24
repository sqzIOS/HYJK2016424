//
//  Tools.h
//  
//
//  Created by apple on 16/1/7.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum {
    currentTimeTypeHour = 0,
    currentTimeTypeMinute,
    currentTimeTypeSecond
} currentTimeType;


@interface Tools : NSObject

/**
 * 注册本地推送
 */
+ (void)registerUserNotification:(UIApplication *)application;

/**
 * 返回当前时间的 时、分、秒 数值
 */
+ (int)currentTimeType:(currentTimeType)type;


/**
 * 计算当前时间到所传时间值之间的秒数
 */
+ (int)timeIntervalWithHour:(int)hour andMinute:(int)minute andSecond:(int)second;


/**
 * 设定本地推送
 * @delayTime 推送在delayTime秒之后发出
 */
+ (void)setLocalNotificationWithAlertBody:(NSString *)alertBody andHour:(int)hour minute:(int)minute second:(int)second;


/**
 * 删除已经定时的本地推送
 */
+ (void)cancelLocalNotificationWithNotiTimeHour:(int)hour minute:(int)minute second:(int)second;

/**
 * 返回图片的base64字符串编码
 * @compress 压缩质量
 */
+ (NSString *)stringWithImageBybase64Encoding:(UIImage *)image andCompress:(float)compress;

/**
 * 根据base64编码的字符串生成图片
 */
+ (UIImage *)imageWithBase64String:(NSString *)string;

/**
 * 根据font和maxSize 计算文字占据的真实尺寸
 */
+ (CGSize)sizeOfString:(NSString *)string withFont:(UIFont *)font andMaxSize:(CGSize)maxSize;

@end
