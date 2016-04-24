//
//  Tools.m
//  
//
//  Created by apple on 16/1/7.
//
//

#import "Tools.h"
#import <UIKit/UIKit.h>


@implementation Tools

#pragma mark - 注册本地推送
+ (void)registerUserNotification:(UIApplication *)application
{
    UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];

    if (IOS8) {
        [application registerUserNotificationSettings:settings];
    } else {
        [application registerForRemoteNotificationTypes:type];
    }
    
}

#pragma mark - 获取当前时间 时 分 秒
+ (int)currentTimeType:(currentTimeType)type
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatterHour = [[NSDateFormatter alloc] init];
    
    NSString *format = [NSString string];
    switch (type) {
        case currentTimeTypeHour:
            format = @"HH";
            break;
        case currentTimeTypeMinute:
            format = @"mm";
            break;
        case currentTimeTypeSecond:
            format = @"ss";
            break;
    }
    formatterHour.dateFormat = format;
    
    return  [formatterHour stringFromDate:date].intValue;
}

#pragma mark - 计算某个时间到当前时间相差的秒数
+ (int)timeIntervalWithHour:(int)hour andMinute:(int)minute andSecond:(int)second
{
    int currentHour = [self currentTimeType:currentTimeTypeHour];
    int currentMinute = [self currentTimeType:currentTimeTypeMinute];
    int currentSecond = [self currentTimeType:currentTimeTypeSecond];
    
    int currentTimeInterval = currentHour * 3600 + currentMinute * 60 + currentSecond;
    int setTimeInterval = hour * 3600 + minute * 60 + second;
    
    return setTimeInterval - currentTimeInterval;
}

#pragma mark - 定时推送一个通知
+ (void)setLocalNotificationWithAlertBody:(NSString *)alertBody andHour:(int)hour minute:(int)minute second:(int)second
{
    NSTimeInterval timeInterval = [Tools timeIntervalWithHour:hour andMinute:minute andSecond:second];
    UILocalNotification *noti = [[UILocalNotification alloc] init];
    noti.fireDate = [NSDate dateWithTimeIntervalSinceNow:timeInterval];
    noti.alertBody = alertBody;
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setValue:[NSString stringWithFormat:@"%d:%d:%d",hour,minute,second] forKey:@"notiTime"];
    noti.userInfo = userInfo;
    noti.timeZone = [NSTimeZone defaultTimeZone];
    noti.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:noti];
}

#pragma mark - 删除已经定时的本地推送
+ (void)cancelLocalNotificationWithNotiTimeHour:(int)hour minute:(int)minute second:(int)second
{
    NSArray *notiArry = [UIApplication sharedApplication].scheduledLocalNotifications;
    for (UILocalNotification *noti in notiArry) {
        NSString *timeIntervalStr = noti.userInfo[@"notiTime"];
        if ([timeIntervalStr isEqualToString:[NSString stringWithFormat:@"%d:%d:%d",hour,minute,second]]) {
            [[UIApplication sharedApplication] cancelLocalNotification:noti];
            return;
        }
    }
}

#pragma mark - 返回图片的base64字符串编码
+ (NSString *)stringWithImageBybase64Encoding:(UIImage *)image andCompress:(float)compress
{
    NSData *imageData = UIImageJPEGRepresentation(image, compress);
    NSString *str = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return str;
}

#pragma mark - 通过base64字符串生成图片
+ (UIImage *)imageWithBase64String:(NSString *)string
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

#pragma mark - 根据font和maxSize 计算文字占据的真实尺寸
+ (CGSize)sizeOfString:(NSString *)string withFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size;
}

@end
