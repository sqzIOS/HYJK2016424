//
//  ShareData.h
//  PreferentialLife
//
//  Created by 窗外` on 12-8-21.
//  Copyright (c) 2012年 Neptune. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "MBProgressHUD.h"
//全局变量
extern AppDelegate *m_appDelegate;
extern UINavigationController *m_nav;
extern UIAlertView *m_alert;
extern BOOL isPassStoreCheck;
extern BOOL isShowFenLei;
extern BOOL isShowLunTan;
extern BOOL isHiddenSexhealth;

extern MBProgressHUD * HUD ;
extern BOOL IS_ShowBigHead; //是否可以点击放大头像
extern BOOL IS_OFFBBSSecond;//是否关闭二级回复
extern BOOL IS_ShowMessageIcon;//是否显示消息提示的数目icon
extern BOOL useEmojiAble;//是否显示使用emoji表情

extern BOOL useShopIp;//商城是否使用ip访问
extern BOOL useLunTanIp;//论坛是否使用ip访问
extern BOOL shopPicUseIp;//商城图片是否使用ip访问
extern BOOL lunTanPicUseIp;//论坛图片是否使用ip访问

extern BOOL IS_Doctor;//性健康是否是医师端


#ifndef xdd_Header_h
#define xdd_Header_h

typedef enum _APPOpenURLType
{
    NONE                = 0,
    SINA_WEIBO_RET,
    TENCENT_WEIBO_RET,
    QQ_QZONE_RET,        //腾讯qq
    WECHAT_RET,         //微信分享
    ALIXPAY_RET,        //性多多 支付宝
    WEXin_AliPay,      //性多多 微信支付
    WEXin_AliPay2,      //性多多 微信支付
    
    ALIXPay_SH_RET,  //性健康 支付宝支付
    
}APPOpenURLType;

APPOpenURLType appType;

#endif

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//@"112.124.58.43:8080"
//@"http://192.168.16.99:9090"
//@"192.168.16.170:8080"
//@"192.168.16.45:8080"


#pragma mark - IP
//mk 请求的 商城的ip地址
#define SHOPIP @"www.xingduoduo.com"
#define SHOPIP1 @"www.xingduoduo.com"




// 商品图片的路径
#define HeadImageIP  @"http://www.xingduoduo.com/shopxx/"



//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#pragma mark - 快速宏
//快捷宏
#define NSArrayWithArray(ary) [[NSArray alloc] initWithArray:ary]
#define UIImageByName(str) [UIImage imageNamed:str]
// 快速方式
// 2.0 快速创建UIlabel
#define FastCreatLabel(frame,textColor,font,bgcolor,textAlignment) [ShareFunction creatlabel:frame andTextColor:textColor andTextfount:font andBackgoundColor:bgcolor andTextAlignment:textAlignment]
// 2.1 快速创建UIImageView
#define FastCreatImageView(frame,image) [ShareFunction creatImageView:frame andImage:image]
// 2.1 快速创建UIButton
#define FastCreatButton(frame,name,bgColor,titleColor,imageNor,imageHightLight) [ShareFunction creatButton:frame andBtnName:name andBtnBGColor:bgColor andBtnTitlColor:titleColor andBGImageNor:imageNor andBGImageHightLight:imageHightLight]


#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)sharedInstance { \
    static className *shared##className = nil; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        shared##className = [[self alloc] init]; \
    }); \
    return shared##className; \
}

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#pragma mark - 字体

//字体
//#define FONT_BOLD_WITH_SIZE(SIZE) [UIFont boldSystemFontOfSize:SIZE]
#define FONT_WITH_SIZE(SIZE) [UIFont fontWithName:k_Font size:SIZE]
#define FONT_BOLD_WITH_SIZE(SIZE) [UIFont fontWithName:k_FontFold size:SIZE]
// 字体
#define k_Font  @"Helvetica"
#define k_FontFold  @"Helvetica-Bold"


//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#pragma mark -  屏幕 系统 尺寸

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define SYSTEM_VERSION [[UIDevice currentDevice].systemVersion floatValue]
#define INTERFACE_ORIENTATION (interfaceOrientation == UIInterfaceOrientationPortrait)


#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IOS7_OR_LATER ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define STAR_Y ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] == NSOrderedAscending ? 44 : 64)
#define OFFSET_Y ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] == NSOrderedAscending ? 20 : 0)


/**
 *  系统型号 *****************************************************************************************
 */

//iOS7
#define IOS7 ([UIDevice currentDevice].systemVersion.floatValue>=7.0)
//iOS8
#define IOS8 ([UIDevice currentDevice].systemVersion.floatValue>=8.0)
//iOSV
#define IOSV(v) ([UIDevice currentDevice].systemVersion.floatValue>=v)



// APP TabBar高度
#define TABBARHEIGHT 49.f
// APP 广告栏的高度
#define AdScrollViewHeight  QZMake(160)
//#define AdScrollViewHeight 140



/**
 *
 * 屏幕间距
 */

#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size

// 屏幕宽度
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
// 屏幕高度
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
// APP区域
#define APP_FRAME ([[UIScreen mainScreen]applicationFrame])
// 屏幕区域
#define SCREEN_BOUNDS ([[UIScreen mainScreen]bounds])
//去掉状态栏的高度
#define VIEW_HEIGHT (SCREEN_HEIGHT - 20)
// APP View高度
#define APP_HEIGHT  IOS7 ? (SCREEN_HEIGHT-64) : (SCREEN_HEIGHT-44)
//状态栏
#define APP_STATUS  20

// uuid
#define  DEVICEUUID    [ShareFunction currentDeviceUUID]


//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#pragma mark -  颜色
//颜色
#define UICOLOR_RGB(a, b, c) [UIColor colorWithRed:a/255.0f green:b/255.0f blue:c/255.0f alpha:1]
#define UICOLOR_RGB_A(a, b, c, alp) [UIColor colorWithRed:a/255.0f green:b/255.0f blue:c/255.0f alpha:alp]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRCGA(rgbValue,alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alpha]

#define CLEAR_COLOR [UIColor clearColor]
#define DARK_GRAY_COLOR [UIColor darkGrayColor]
#define BLACK_COLOR [UIColor blackColor]
#define WHITE_COLOR [UIColor whiteColor]
#define BLUE_COLOR [UIColor blueColor]
#define LIGHT_GRAY_COLOR [UIColor lightGrayColor]
#define GRAY_COLOR [UIColor grayColor]
#define RED_COLOR [UIColor redColor]
#define ORANGE_COLOR [UIColor orangeColor]
#define GRAY_COLOR_BG UICOLOR_RGB(244, 244, 244)

#define GRAY_COLOR_TABLEVIEWLINE UICOLOR_RGB(200, 200, 200)

//app导航背景颜色
#define NAV_COLOR [UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:1.0]
//#define NAV_RED_COLOR  UIColorFromRGB(0xe996d9)
#define NAV_RED_COLOR  UIColorFromRGB(0x9c46e5) //小面积深紫色
#define NAV_MoreBg_COLOR UIColorFromRGB(0xe1a9ff) //e1a9ff 大面积 浅紫色

#define MAINCOLOR [UIColor colorWithRed:82/255.f green:198/255.f blue:117/255.f alpha:1.0]//二级回复的颜色
#define ColorSecondName NAV_RED_COLOR //app主色调

//治政主色调
//#define AppColor RGBCOLOR16(0x32ed9b)
#define AppColor RGBCOLOR16(0x2dbb7c)


// 首页 及 分类 按钮边框颜色
#define btnBorderColor [UIColor colorWithRed:220/255.f green:220/255.f blue:220/255.f alpha:1.0].CGColor



//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#pragma mark - 应用快速name

#define LUNTANUSERID [[NSUserDefaults standardUserDefaults] objectForKey:@"BBSId"]

#define ISLOGIN  [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"]
#define USERID  [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]
#define USERNAME  [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"]
#define DOCTORNAME  [[NSUserDefaults standardUserDefaults] objectForKey:@"doctorName"]
#define PASSWORD  [[NSUserDefaults standardUserDefaults] objectForKey:@"password"]
#define NICKNAME  [[NSUserDefaults standardUserDefaults] objectForKey:@"nickname"]
#define USERSEX  [[NSUserDefaults standardUserDefaults] objectForKey:@"userSex"]
#define RANKNAME  [[NSUserDefaults standardUserDefaults] objectForKey:@"rankNmae"]
#define USER_HEADIMAGE_URL [[NSUserDefaults standardUserDefaults] objectForKey:@"userHeadImageURL"]

#define CLOSEVOICE  [[NSUserDefaults standardUserDefaults] objectForKey:@"CLOSEVOICE"]
#define CLOSESHAKE  [[NSUserDefaults standardUserDefaults] objectForKey:@"CLOSESHAKE"]

//#define DOCTORID @"402890194f77f348014f78c8709e003f"
#define ISDOCTOR  [[NSUserDefaults standardUserDefaults] objectForKey:@"isDoctor"]
#define DOCTORID  [[NSUserDefaults standardUserDefaults] objectForKey:@"doctorId"]

//论坛等级
#define BBSUSERLEVEL  [[NSUserDefaults standardUserDefaults] objectForKey:@"BBSUserLevel"]
#define BBSUSERLEVELNUMBER  [[NSUserDefaults standardUserDefaults] objectForKey:@"BBSUserLevelNumber"]

//
#define UserDefaults  [NSUserDefaults standardUserDefaults]
// 用户头像
#define  UserHeadImageFileName [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:USERID]

//医师头像
#define  DoctorHeadImageFileName [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:DOCTORID]


//通知
#define NOTIFICATION_AlertOVER       @"alertCancel"//弹框 结束
#define NOTIFICATION_AlertBGCanCanCel       @"alertViewBgCanCancel"//弹框 结束
#define NOTIFICATION_ISLOGIN         @"isLogin"
#define NOTIFICATION_BBSMESSAGE      @"NOTIFICATION_BBSMESSAGE"
#define NOTIFICATION_SHOPCARMESSAGE      @"NOTIFICATION_ShopCarMESSAGE"

#define NOTIFICATION_THUMPNUM @"ThumpNum"   //点赞通知
#define NOTIFICATION_REPLAYNUM @"ReplayNum"   //回复通知
#define NOTIFICATION_REPLAYNUMWITHVIP @"ReplayNumWithVIP"   //免费咨询回复通知

//接口返回的几个常用字段
#define MESSAGE @"message"
#define SUCCESS @"success"
#define DATASOURCE @"datasource"

//判断json数据 的datasoucre 字段不为空 有数组数据
#define JudgeDatasourceHaveArrayData(dict)  (dict[DATASOURCE] && ![dict[DATASOURCE] isKindOfClass:[NSNull class]] && [dict[DATASOURCE] count] > 0)
//判断json数据 的success 字段为真
#define JudgeSuccess(dict)  (dict[SUCCESS] && ![dict[SUCCESS] isKindOfClass:[NSNull class]] && [dict[SUCCESS] intValue]==1)
#define JudgeHavaKey(dict,key)  (dict[key] && ![dict[key] isKindOfClass:[NSNull class]])


//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#pragma mark - 其他


#define TIME_OUT 30

//uitextfield输入限制
#define kLimitLetterNum @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
#define kLimitLetter @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define kLimitNum @"0123456789"


//联网方式
typedef enum
{
    JoinNetworkType_NONE = 0,
    JoinNetworkType_WIFI,
    JoinNetworkType_MOBILE,
}JoinNetworkType;

#define ONE_DAY_TIMEINTERVAL    86400

// 全局通知
#define UserRelogin @"UserRelogin"
#define NoNet @"NoNet"

//QQ空间授权token
#define FILENAME_QZONE_TOKEN    [NSHomeDirectory() stringByAppendingString:@"/Documents/QToken"]

//---文件路径
//分类缓存路径
#define FILE_Classify_path   [NSHomeDirectory() stringByAppendingString:@"/Documents/classifyData.txt"]
//首页缓存路径
#define FILE_HomeView_path   [NSHomeDirectory() stringByAppendingString:@"/Documents/homeData.txt"]
//首页广告
#define FILE_HomeADView_path   [NSHomeDirectory() stringByAppendingString:@"/Documents/homeADData.txt"]
//今天纪录爱记录的 时间和用户id
#define FILE_SexRecordDateAndUsers_path   [NSHomeDirectory() stringByAppendingString:@"/Documents/sexRecordDateUsers.txt"]
/**
 论坛的推广活动数据缓存路径
 */
#define FILE_BBSExtendArray_path [NSHomeDirectory() stringByAppendingString:@"/Documents/SDBBSExtendArray.txt"]
//论坛所有板块数据的缓存 （不含分类）
#define FILE_ALLBBSDataArray_path [NSHomeDirectory() stringByAppendingString:@"/Documents/SDAllBBSDataArray.txt"]

//论坛所有板块数据的缓存 （含分类）
#define FILE_ALLBBSDataArrayClassify_path [NSHomeDirectory() stringByAppendingString:@"/Documents/SDAllBBSDataArrayClassify.txt"]


//判断是否有某个路径 用于准备后台换7牛服务器的全拼图片路径 使用  之前使用的是一半的路径需要自己拼接服务器地址
#define judgeUrlIsHave(dic,str)  [PublicMethod judgeDic:dic withImageUrlStr:str]


#define  QZMake(h)    [ShareFunction formatSpaceFromIphone6:h]

#define  RECTMAKE(x,y,w,h)    [ShareFunction formatCGRectFromIphone5:CGRectMake(x,y,w,h)]
#define  SIZEMAKE(w,h)    [ShareFunction formatCGSizeFromIphone5:CGSizeMake(w,h)]
#define  MAKEOF5(h)    [ShareFunction formatHEIGHTFromIphone5:h]



//==================== 医师端 添加 =========
// from 王思鹏
typedef enum {
    CellLocation_Top = 0,
    CellLocation_Middle = 1,
    CellLocation_Bottom = 2,
    CellLocation_TopAndBottom = 3,
} CellLocation;

typedef enum {
    AccessoryType_RightGray = 0,
    AccessoryType_Yes = 1,
    
}AccessoryType;


#define Isipad() (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isRetina ([[UIScreen mainScreen] scale] >=2 ? YES : NO)
#define HBOnePixelLineHeight  (1.0/[[UIScreen mainScreen] scale])


#define COLOR_HIGHTLIGHT1 RGBACOLOR(0, 0, 0, 0.07)
#define COLOR_TEXT_1 UICOLOR_RGB(53, 53, 53)  //主文


#define SHIsSelectDoctorVC  @"isSelectDoctorVC"


// ===============================爱记录=============================


#ifndef LY_LYDefine_h
#define LY_LYDefine_h



// 参数适配值
#define SCREEN_SPACE(float) [LYGlobalDefine getScreenSize:float]
//手机型号
#define iPhoneModel [LYGlobalDefine getIphoneModel]

#define APP_SPACE(float) [LYGlobalDefine getScreenSize:float]
//#define APP_SPACE(float) float

/**
 *
 * 颜色相关  *****************************************************************************************
 */
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGBCOLOR16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBACOLOR16(rgbValue) [UIColor colorWithRed:((float)(((rgbValue & 0xFF000000) >> 16) >>8))/255.0 green:((float)((rgbValue & 0xFF0000) >> 16))/255.0 blue:((float)((rgbValue & 0xFF00)>>8))/255.0 alpha:(float)(rgbValue & 0xFF)/255.0]
#define colorFrom16RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//灰色 用来显示加载中图片的色值
#define colorWithSDImage_bg  RGBCOLOR(220,220,220)
//清除颜色
#define colorWithClear [UIColor clearColor]
//白色
#define colorWithLYWhite [UIColor whiteColor]
//颜色1   主调色
#define colorWithBK01  colorFrom16RGB(0x2fcc87)
//颜色3   黑色
#define colorWithBK03  colorFrom16RGB(0x4a4a4a)
//颜色4  灰黑色
#define colorWithBK04  colorFrom16RGB(0x717171)
// 性健康
//颜色1   朝涛主调色
//#define colorWith01  RGBCOLOR16(0x32ed9b)
#define colorWith01  RGBCOLOR16(0x2dbb7c)

//颜色2   标题 (黑色)
#define colorWith02  RGBCOLOR16(0x333333)
//颜色3   内容 (黑灰色)
#define colorWith03  RGBCOLOR16(0x666666)
//颜色4   内容 (灰色)
#define colorWith04 RGBCOLOR16(0x999999)
//颜色5   背景色  (浅灰色)
#define colorWith05 RGBCOLOR16(0xebebeb)
//颜色6   主色调 三原色值
#define colorWith06 [UIColor colorWithRed:92/255.0f green:214/255.0f blue:186/255.0f alpha:1]
//颜色7   蓝色 （浅蓝色）
#define colorWith07 [UIColor colorWithRed:57/255.0f green:145/255.0f blue:195/255.0f alpha:1]

/**
 *  字体   *****************************************************************************************
 */
#define fontWithSize(size) [UIFont systemFontOfSize:size]
#define blodFontWithSize(size) [UIFont boldSystemFontOfSize:size]
// font size
//超大号(对应UI设计的0号字体)
#define Font_SuperLarge_Size [LYGlobalDefine getFontSize:1]
#define Font_SuperLarge fontWithSize(Font_SuperLarge_Size)
//较大号(对应UI设计的1号字体)
#define Font_ExtraLarge_Size [LYGlobalDefine getFontSize:2]
#define Font_ExtraLarge fontWithSize(Font_ExtraLarge_Size)
//大号(对应UI设计的2号字体)
#define Font_Large_Size [LYGlobalDefine getFontSize:3]
#define Font_Large fontWithSize(Font_Large_Size)
//中号(对应UI设计的3号字体)
#define Font_Middle_Size [LYGlobalDefine getFontSize:4]
#define Font_Middle fontWithSize(Font_Middle_Size)
//小号(对应UI设计的4号字体)
#define Font_Small_Size [LYGlobalDefine getFontSize:5]
#define Font_Small fontWithSize(Font_Small_Size)

/**
 *  字体加粗   *****************************************************************************************
 */
//超大号(对应UI设计的0号字体)
#define Font_SuperLarge_Size_bold [LYGlobalDefine getFontSize:1]
#define Font_SuperLarge_bold blodFontWithSize(Font_SuperLarge_Size)
//较大号(对应UI设计的1号字体)
#define Font_ExtraLarge_Size_bold [LYGlobalDefine getFontSize:2]
#define Font_ExtraLarge_bold blodFontWithSize(Font_ExtraLarge_Size)
//大号(对应UI设计的2号字体)
#define Font_Large_Size_bold [LYGlobalDefine getFontSize:3]
#define Font_Large_bold blodFontWithSize(Font_Large_Size)
//中号(对应UI设计的3号字体)
#define Font_Middle_Size_bold [LYGlobalDefine getFontSize:4]
#define Font_Middle_bold blodFontWithSize(Font_Middle_Size)
//小号(对应UI设计的4号字体)
#define Font_Small_Size_bold [LYGlobalDefine getFontSize:5]
#define Font_Small_bold blodFontWithSize(Font_Small_Size)

/**
 *  Network  *****************************************************************************************
 */

/**
 *  通知相关  *****************************************************************************************
 */
#define POST_NOTIFICATION(name) [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil]
//监听主题
#define kThemeDidChangeNofication @"kThemeDidChangeNofication"

/**
 *  第三方 SDK 总开关 =================
 *  首先可以写一个宏定义来表示是否按调试模式编译
 * 测试语句
 */
#define _VERSION_FOR_APPSTORE_
#ifdef _VERSION_FOR_APPSTORE_

/**
 *  百度地图 key
 */
//#define SDKBAIDUKEY @"pYdnYWGABRDd8Qrw1CB123ul"
#define SDKBAIDUKEY @"4z42QbuGQekVRtMiwRGi17Tm"



//百度SKD导航
#define  _SUPPORT_BAIDU_NAVIGA_
#define _SUPPORT_BAIDU_MAP_
#endif

//默认头像
#define DEFAULT_AVATAR [UIImage imageNamed:@"ic_health"]

//默认加载
#define DEFAULT_LODAING [UIImage imageNamed:@"loading"]
#define DEFAULT_LODAING_CELL [UIImage imageNamed:@"loading_cell"]


#define NOTIFICATION_ADDRESS @"hospitalName"
#define ServiceNumber @"400-9655-525"
#define NOTIFICATION_BINGLI @"bingli"
#define NOTIFICATION_PAY_SUCCESS @"paySuccess"
#define NOTIFICATION_PAY_SUCCESS2 @"paySuccess2"


#define NOTIFICATION_SEARCH @"search"


#endif


