//
//  AppDelegate.h
//  sexduoduo
//
//  Created by showm on 14-5-14.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeveyTabBarController.h"




//#import "BeginView.h"


#import "WXApi.h"//微信支付


#import "MedicalServicesVC.h"
#import "MyCenterController.h"
#import "IntelligenceDiagnosisController.h"
#import "StarAppController.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate,UIAlertViewDelegate,WXApiDelegate>
//,BMKGeneralDelegate>
{
  
    
    
    MyCenterController *myCenterVC;
    
    MedicalServicesVC *mServicesVC;


    IntelligenceDiagnosisController *intelligenceVc;
    
    
    UINavigationController *firNc ;
    UINavigationController *secNc;
    UINavigationController *thirdNc;

    
    
 
    
}
@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) BMKMapView *mapView;//2地图view


@property (strong, nonatomic) LeveyTabBarController *tabController;
@property (nonatomic,strong)NSTimer *pingLunTimer;//去评论的定时器
@property (nonatomic,strong)UIAlertView *alertPingLun;//去评论的弹框

@property (nonatomic,strong)UIImageView *homeImg;


- (void)starApp;

- (void)setUpCustomTab;

- (void)checkMessageNum;


- (void)sendPay;//微信支付
- (void)sendPayWithOrderId:(NSString *)orderId;//微信支付




@end
