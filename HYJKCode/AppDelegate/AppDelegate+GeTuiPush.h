//
//  AppDelegate+GeTuiPush.h
//  sexduoduo
//
//  Created by showm on 15/12/1.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "AppDelegate.h"
#import "GeTuiSdk.h"
//!!!: 换应用需要修改 个推key
#define kGtAppId           @"P7cV5MKXaR8fClU3YCJsw3"//xingduoduo
#define kGtAppKey          @"k3hxgSQRJy7pdfZoMR3AX7"
#define kGtAppSecret       @"tmCoA5fIqw5mqNvAfu7Ut6"

@interface AppDelegate (GeTuiPush)
#pragma mark - 用户通知(推送) _自定义方法

/** 注册用户通知 */
- (void)registerUserNotification;

/** 自定义：APP被“推送”启动时处理推送消息处理（APP 未启动--》启动）*/
- (void)receiveNotificationByLaunchingOptions:(NSDictionary *)launchOptions;


@end
