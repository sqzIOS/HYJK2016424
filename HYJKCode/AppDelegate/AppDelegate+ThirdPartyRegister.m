//
//  AppDelegate+ThirdPartyRegister.m
//  sexduoduo
//
//  Created by showm on 15/11/19.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "AppDelegate+ThirdPartyRegister.h"
#import "MobClick.h"
#import "UMFeedback.h"
@implementation AppDelegate (ThirdPartyRegister)
//友盟
- (void)umengTrackAndWeiXinAlipay {
    //umeng 统计 以及在线参数 及 自动更新
    
    [MobClick setAppVersion:XcodeAppVersion]; //参数为NSString * 类型,自定义app版本信息，如果不设置，默认从CFBundleVersion里取
    //
    [MobClick startWithAppkey:UMENG_APPKEY reportPolicy:(ReportPolicy) REALTIME channelId:Flag];
    
    [MobClick checkUpdate:@"有可用的新版本" cancelButtonTitle:@"暂时忽略" otherButtonTitles:@"去下载"];
    
    [MobClick updateOnlineConfig];  //在线参数配置
    
    
    //umeng分享的设置
    [UMSocialData setAppKey:UMENG_APPKEY];
    
    
    //!!!:  性健康版本要注释掉 微信相关 因为没有微信key 并且删除掉 urlScheme的 微信相关
    if(IS_SexDuoDuo)
    {
        //设置微信AppId、appSecret，分享url
        [UMSocialWechatHandler setWXAppId:@"wx67be04fb4b0592b5" appSecret:@"f3eca49c31734349e975308981d8c122" url:@"http://www.umeng.com/social"];
        //--微信支付用的
        //向微信注册
        [WXApi registerApp:@"wx67be04fb4b0592b5" withDescription:@"demo 2.0"];
    }
    
    
    
    //umeng反馈
    [UMFeedback setAppkey:UMENG_APPKEY];
    
    
}


@end
