//
//  ShareFunction.h
//  XM_12580
//
//  Created by mac on 12-7-9.
//  Copyright (c) 2012年 Neptune. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "GiFHUD.h"

@interface ShareFunction : NSObject <UIAlertViewDelegate>

+ (NSString *)currentDeviceUUID;// 对外使用   3->2->1
+ (NSString *)GetKeychainUUID;  // 2获取 和 保存 keychain的uuid
+ (NSString*)uuid;              // 3 获取UUID

//+ (JoinNetworkType)getJoinNetworkType;
+(NSString *)getApplicationName;//app名称
+(NSString *)getApplicationVersion;//app版本
+ (NSString *)getApplicationBuildVersion;//app build版本
+(NSString *)getMACAddress;//获取MAC地址
+ (NSString *) whatismyipdotcom ; // 外网ip
+ (NSString *)getIPAddress; // ip地址


+ (NSString *)getADFA;//获取广告标示符



+ (NSString *) localWiFiIPAddress; // 获取本地wifi的ip地址
//改变图片尺寸
+ (UIImage*)resizedImage:(UIImage*)inImage withWidth:(float)t_width withHeight:(float)t_height;


+ (void)showAlertWithText:(NSString *)text;
+ (void)showAlertWithTitle:(NSString *)title andText:(NSString *)text andDelegate:(id)delegate andTag:(NSInteger)tag;

//获得字符串长度
+ (CGSize)getLabelSize:(NSString *)str width:(NSInteger)width font:(UIFont *)font;
//处理数据 如是null则返回空串
+ (NSString *)getStringWithData:(id)data;


+ (NSDate *)getDateWithTimeStr:(NSString *)timeStr;
+ (NSDictionary *)getDateDicWithTime:(NSDate *)date;
+ (NSString *)getTimeStrWithTimeInterval:(double)interval;
+ (NSDate *)getCurrentTime;
+ (NSString *)getCurrentTimeIntervalStr;
+ (NSInteger)getAgeWithTimeStr:(NSString *)timeStr;

+ (BOOL)checkPhoneNumInput:(NSString *)_text;
+ (BOOL)validateEmail:(NSString *)email;

+ (UIColor *)colorWithHexString:(NSString *)color;

//获得文件字节数
+ (long long)fileSizeAtPath:(NSString*)filePath;
//删除文件
+ (void)removeFile:(NSString *)filePath;
//创建文件夹
+ (void)createDir:(NSString *)filePath;
//文件是否存在
+ (BOOL)fileExistsAtPath:(NSString *)filePath;
//用key作文件名保存图片后返回文件路径
+ (NSString *)getFilePathWith:(UIImage *)image andKey:(NSString *)key;

// 加载提示
+ (MBProgressHUD *)showHUD;
+ (MBProgressHUD *)showHUDInSuperView:(UIView *)view;
+ (MBProgressHUD *)showHUDWithText:(NSString *)text;
+ (void)hiddenHUD;

//显示Toast提示
+ (MBProgressHUD *)showToast:(NSString *)text;
+ (MBProgressHUD *)showToast:(NSString *)text inSuperview:(UIView *)view;
+ (MBProgressHUD *)showMessageSuper:(NSString *)text;
+ (MBProgressHUD *)showMessageMiddle:(NSString *)text;
+ (MBProgressHUD *)showMessageBelow:(NSString *)text;


// 显示增加的经验值 和 积分值
+ (MBProgressHUD *)showToastWithText1:(NSString *)text1 andText2:(NSString *)text2 andText3:(NSString *)text3 inSuperview:(UIView *)view;
// 显示一个动画
+ (MBProgressHUD *)showCustomLoadingImageView;

// 快速创建label
+(UILabel*)creatlabel:(CGRect)frame andTextColor:(UIColor*)textColor andTextfount:(UIFont*)font andBackgoundColor:(UIColor*)bgColor andTextAlignment:(NSTextAlignment)alignment;
// 快速创建ImageView
+(UIImageView*)creatImageView:(CGRect)frame andImage:(UIImage*)image;
//快速创建 btn 一 使用背景图片
+(UIButton*)creatButton:(CGRect)frame andBtnName:(NSString*)name andBtnBGColor:(UIColor*)bgColor andBtnTitlColor:(UIColor*)titleColor andBGImageNor:(UIImage*)imageNor andBGImageHightLight:(UIImage*)imageHightLight;

// 返回图片路径
+ (NSURL *)getImageURLWithImageName:(NSString *)imageName;
//清除html标签
+ (NSString *)clearHtmlTag:(NSString *)text;
// 找出IMG标签
+ (NSString *)getIMGFromHtml:(NSString *)text;
// 找出IMG标签的SRC属性
+ (NSString *)getIMGTagSrcFromHtml:(NSString *)text;
// 清除前后空格
+ (NSString *)clearWhiteSpace:(NSString *)text;


// 中文算一个字符  数字和字母两个算一个字符
+(int)sinaCountWord:(NSString *)s;

#pragma mark - Grayscale
//图片变灰色
+ (UIImage *)grayscaleImageForImage:(UIImage *)image;


// 格式化json字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString ;

//image 转base64字符串
+ (NSString *) image2String:(UIImage *)image;



// 根据iphone6 适配iphone5 和iphone6plus

+(CGFloat )formatSpaceFromIphone6:(CGFloat )space;


// 根据iphone5 适配iphone6 和iphone6plus
+(CGRect )formatCGRectFromIphone5:(CGRect )rect;
+(CGSize )formatCGSizeFromIphone5:(CGSize)size;
+(CGFloat )formatHEIGHTFromIphone5:(CGFloat )height;


@end
