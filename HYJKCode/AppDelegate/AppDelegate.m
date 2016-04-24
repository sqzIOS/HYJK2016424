//
//  AppDelegate.m
//  sexduoduo
//
//  Created by showm on 14-5-14.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//

//
//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | /  |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖保佑                  永无BUG




#import "AppDelegate.h"

#import "MobClick.h"
//#import "AlixPayResult.h"
#import <AlipaySDK/AlipaySDK.h>
//#import "DataVerifier.h"



#import <TencentOpenAPI/TencentOAuth.h>

//for mac
#include<sys/socket.h>
#include<sys/sysctl.h>
#include<net/if.h>
#include<net/if_dl.h>

//for idfa
#import<AdSupport/AdSupport.h>
//#import "APService.h"
#import "UMFeedback.h"

#import "IPDetector.h"


#import "AppDelegate+ThirdPartyRegister.h"
#import "AppDelegate+GeTuiPush.h"

#import "UserOperation.h"
#import "IQKeyboardManager.h"

@implementation AppDelegate
@synthesize tabController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [IQKeyboardManager sharedManager].enable = YES;
    
    application.statusBarStyle = UIStatusBarStyleDefault;
    
    // 监听账号过期或密码错误
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userRegoin) name:UserRelogin object:nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    m_appDelegate=self;//全局变量
    
//    [UserOperation getVerificationCodeWithPhoneNumber:@""];
    
    // 向微信注册app
    [UMSocialWechatHandler setWXAppId:@"2015092500328191" appSecret:@"cgr02buylsnweefpu1be6znf9ogh3msx" url:@""];
    
    [self umengTrackAndWeiXinAlipay];
    
    
    [self starApp];
    
    return YES;
}

#pragma mark - starApp
- (void)starApp
{
    StarAppController *starVC = [[StarAppController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] init];
    [nav pushViewController:starVC animated:YES];

    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    nav.navigationBar.hidden=YES;
}


#pragma mark - tabbar
- (void)setUpCustomTab {
    
    mServicesVC =[[MedicalServicesVC alloc] init];    
    
    myCenterVC = [[MyCenterController alloc] init];
    
    intelligenceVc = [[IntelligenceDiagnosisController alloc] init];
    
    firNc = [[UINavigationController alloc]initWithRootViewController:intelligenceVc];
    firNc.delegate = self;
    
    secNc = [[UINavigationController alloc] initWithRootViewController:mServicesVC];
    secNc.delegate = self;
    
    thirdNc = [[UINavigationController alloc]initWithRootViewController:myCenterVC];
    thirdNc.delegate = self;
    
    
    firNc.navigationBar.hidden=YES;
    secNc.navigationBar.hidden=YES;
    thirdNc.navigationBar.hidden=YES;

    // BBS是否显示
    
    NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic setObject:[UIImage imageNamed:@"tabBar_1_nor"] forKey:@"Default"];
    [imgDic setObject:[UIImage imageNamed:@"tabBar_1_nor"] forKey:@"Highlighted"];
    [imgDic setObject:[UIImage imageNamed:@"tabBar_1_pre"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic2 setObject:[UIImage imageNamed:@"tabBar_2_nor"] forKey:@"Default"];
    [imgDic2 setObject:[UIImage imageNamed:@"tabBar_2_nor"] forKey:@"Highlighted"];
    [imgDic2 setObject:[UIImage imageNamed:@"tabBar_2_pre"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic3 setObject:[UIImage imageNamed:@"tabBar_3_nor"] forKey:@"Default"];
    [imgDic3 setObject:[UIImage imageNamed:@"tabBar_3_nor"] forKey:@"Highlighted"];
    [imgDic3 setObject:[UIImage imageNamed:@"tabBar_3_pre"] forKey:@"Seleted"];
    
    
    NSArray *ctrlArr=nil;
    NSArray *imgArr=nil;
    
    ctrlArr = [NSArray arrayWithObjects:firNc,secNc,thirdNc ,nil];
    imgArr = [NSArray arrayWithObjects:imgDic,imgDic2,imgDic3,nil];
    
    tabController = [[LeveyTabBarController alloc] initWithViewControllers:ctrlArr imageArray:imgArr];
    [tabController.tabBar setBackgroundImage:[UIImage imageNamed:@"healthTabBarBg"]];
    [tabController setTabBarTransparent:YES];
//    tabController.selectedIndex = 2;

    
    [self.window setRootViewController:tabController];
    
    [tabController setSelectedIndex:1];

}

#pragma mark - 微信支付代理
-(void)onResp:(BaseResp*)resp
{
    NSString *strTitle;
    
    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        strTitle = [NSString stringWithFormat:@"支付结果"];
        
        switch (resp.errCode) {
            case WXSuccess:
            {
                if (appType == WEXin_AliPay) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_PAY_SUCCESS object:nil];
                } else if (appType == WEXin_AliPay2) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_PAY_SUCCESS2 object:nil];
                }
            }
                break;
                
            default:
            {
                [ShareFunction showToast:@"支付失败"];
            }
                
                break;
        }
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)userRegoin
{
    [ShareFunction showMessageMiddle:@"请检查网络，并重新登入"];
//    [m_appDelegate starApp];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    if (appType == WECHAT_RET) {
            return  [UMSocialSnsService handleOpenURL:url];
    }
    return  [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    if (appType == WECHAT_RET) {
        return  [UMSocialSnsService handleOpenURL:url];
    }
    
    //支付宝支付
    if (appType == ALIXPAY_RET) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
        
        return YES;
    }
    //微信支付
    return  [WXApi handleOpenURL:url delegate:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
