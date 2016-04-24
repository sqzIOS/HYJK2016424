//
//  ShareData.m
//  PreferentialLife
//
//  Created by 窗外` on 12-8-21.
//  Copyright (c) 2012年 Neptune. All rights reserved.
//

#import "ShareData.h"

AppDelegate *m_appDelegate = nil;
UINavigationController *m_nav = nil;
UIAlertView *m_alert = nil;

BOOL isPassStoreCheck = YES;
BOOL isShowFenLei = YES;
BOOL isShowLunTan = YES;
BOOL isHiddenSexhealth = NO;

MBProgressHUD * HUD = nil ;
BOOL IS_ShowBigHead =NO;
BOOL IS_OFFBBSSecond=NO;
BOOL IS_ShowMessageIcon=NO;
BOOL useEmojiAble=NO;//是否显示使用emoji表情

BOOL useShopIp=YES;//商城是否使用ip访问
BOOL useLunTanIp=YES;//论坛是否使用ip访问

BOOL shopPicUseIp=NO;//商城图片是否使用ip访问
BOOL lunTanPicUseIp=NO;//论坛图片是否使用ip访问

BOOL IS_Doctor =NO;//性健康是否是医师端


