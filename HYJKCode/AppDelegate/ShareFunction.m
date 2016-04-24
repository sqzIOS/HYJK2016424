//
//  ShareFunction.m
//  XM_12580
//
//  Created by mac on 12-7-9.
//  Copyright (c) 2012年 Neptune. All rights reserved.
//

#import "ShareFunction.h"
#import "sys/utsname.h"
#import "Reachability.h"
#import "RegexKitLite.h"
//#import "KeychainItemWrapper.h"
#import "CHKeychain.h"

#include <sys/socket.h> //MAC
#include <sys/sysctl.h>
#include <sys/stat.h>
#include <net/if.h>
#include <net/if_dl.h>

//ip
#include <arpa/inet.h>
#include <netdb.h>
#include <net/if.h>
#include <ifaddrs.h>
#import <dlfcn.h>

#import <AdSupport/AdSupport.h>

#import "GiFHUD.h"
@implementation ShareFunction

//+ (JoinNetworkType)getJoinNetworkType
//{
//    return JoinNetworkType_WIFI;
//	Reachability *reach = [Reachability reachabilityWithHostname:@"www.baidu.com"];
//    
//	if (reach.currentReachabilityStatus == ReachableViaWWAN){
//		NSLog(@"3G/GPRS");
//		return JoinNetworkType_MOBILE;
//	}else if (reach.currentReachabilityStatus == ReachableViaWiFi){
//		NSLog(@"WIFI");
//		return JoinNetworkType_WIFI;
//	}else{
//		NSLog(@"当前无网络");
//		return JoinNetworkType_NONE;
//	}
//}

//钥匙串 保存和获得uuid
+(NSString *)GetKeychainUUID
{
    //从keychain里取出帐号密码
    NSString *xddUUID=(NSString *)[CHKeychain load:@"xddUUID"];
    NSLog(@"keychain保存的uuid=%@",xddUUID);
    if (xddUUID && xddUUID.length>0) {
        return xddUUID;
    }else {
        
        NSString *nowUUID=[ShareFunction uuid];
        
        [CHKeychain save:@"xddUUID" data:nowUUID];
        
        NSLog(@"新保存至keychain的uuid=%@",nowUUID);
        return nowUUID;
    }
    
}

// 获得当前设备的uuid
+(NSString *)currentDeviceUUID
{
    NSString *uuidStr=[UserDefaults objectForKey:@"currentDeviceUUID"];
    
    if (uuidStr && uuidStr.length>0) {
        return uuidStr;
    }else{
        uuidStr=[ShareFunction GetKeychainUUID];
        [UserDefaults setObject:uuidStr forKey:@"currentDeviceUUID"];
        [UserDefaults synchronize];
        
        return uuidStr;
    }
}
//app 名称
+(NSString *)getApplicationName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}
//app 版本
+ (NSString *)getApplicationVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

//app build版本
+ (NSString *)getApplicationBuildVersion
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)getMACAddress//获取MAC地址
{
    int                    mib[6];
    size_t                len;
    char                *buf;
    unsigned char        *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl    *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    
    //带冒号
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    //不带冒号
    //NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return [outstring uppercaseString];
}

+ (NSString *) whatismyipdotcom
{
    NSError *error;
    NSURL *ipURL = [NSURL URLWithString:@"http://www.whatismyip.com/automation/n09230945.asp"];
    NSString *ip = [NSString stringWithContentsOfURL:ipURL encoding:1 error:&error];
    return ip ? ip : [error localizedDescription];
}
+ (NSString *)getIPAddress

{
    
    NSString *address = @"error";
    
    struct ifaddrs *interfaces = NULL;
    
    struct ifaddrs *temp_addr = NULL;
    
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) {
        
        // Loop through linked list of interfaces
        
        temp_addr = interfaces;
        
        while(temp_addr != NULL) {
            
            if(temp_addr->ifa_addr->sa_family == AF_INET)
                
            {
                
                // Check if interface is en0 which is the wifi connection on the iPhone
                
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    
                    // Get NSString from C String
                    
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                    NSLog(@"address:%@",address);
                    
                    // ifa_addr ifa_dstaddr
                    
                }
                
                
                
            }
            
            
            
            temp_addr = temp_addr->ifa_next;
            
        }
        
    }
    
    // Free memory
    
    freeifaddrs(interfaces);
    
    return address;
    
}





+ (NSString *) localWiFiIPAddress
{
    BOOL success;
    struct ifaddrs * addrs;
    const struct ifaddrs * cursor;
    
    success = getifaddrs(&addrs) == 0;
    if (success) {
        cursor = addrs;
        while (cursor != NULL) {
            // the second test keeps from picking up the loopback address
            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
            {
                NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                if ([name isEqualToString:@"en0"])  // Wi-Fi adapter
                    return [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return nil;
}


+ (NSString *)getADFA//获取广告标示符
{
    
    if ([[UIDevice currentDevice].systemVersion floatValue] < 6.0) {
        
        return @"";
        
    }else{
        NSString *adId =[[[ASIdentifierManager sharedManager] advertisingIdentifier]UUIDString];
        return adId;
    }
    
//    
//    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//    return adId;
}

+ (UIImage*)resizedImage:(UIImage*)inImage withWidth:(float)t_width withHeight:(float)t_height
{
	CGRect t_rec=CGRectMake(0, 0, t_width, t_height);
    UIGraphicsBeginImageContext(t_rec.size);
    [inImage drawInRect:t_rec];
	UIImage *t_image=UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    return t_image;
}

////获得字符串长度
//+ (CGSize)getLabelSize:(NSString *)str width:(NSInteger)width font:(UIFont *)font
//{
//    NSArray *arry = [str componentsSeparatedByString:@"\n"];
//    
//    float height = 0;
//    float sx = 0;
//    for (NSString *str in arry) {
//        NSString *t = str;
//        if ([t isEqualToString:@""]) {
//            t = @" ";
//        }
//        CGSize detailSize;
//        if (SYSTEM_VERSION < 7) {
//            detailSize = [t sizeWithFont:font constrainedToSize:CGSizeMake(width, 10000.0f)];
//        }
//        else {
//            NSDictionary *attrDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
//            detailSize = [t boundingRectWithSize:CGSizeMake(width, 10000.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil].size;
//        }
//        height += detailSize.height;
//        sx = detailSize.width;
//    }
//    
//    return CGSizeMake(sx, height);
//}

//处理数据 如是null则返回空串
+ (NSString *)getStringWithData:(id)data
{
    NSString *text = data;
    if ([data isKindOfClass:[NSNull class]]) 
        text = @"";
    return text;
}


//手机号码验证
+ (BOOL)checkPhoneNumInput:(NSString *)_text
{
//    NSString *Regex =@"(13[0-9]|14[57]|15[012356789]|17[0-9]|18[02356789])\\d{8}";//手机号
    NSString *Regex =@"(0\\d{2,3}\\d{7,8})|(1[34578]\\d{9})";//判断不全面的手机号和 固话
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [mobileTest evaluateWithObject:_text];
}

//判断邮箱
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


#pragma mark    - 时间处理

+ (NSDate *)getDateWithTimeStr:(NSString *)timeStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];

    NSDate* date = [formatter dateFromString:timeStr];

    return date;
}
//获得当前时间
+ (NSDate *)getCurrentTime
{
    NSDate *datenow = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:datenow];
    NSDate *localeDate = [datenow dateByAddingTimeInterval:interval];
    return localeDate;
}

//获得当前时间戳
+ (NSString *)getCurrentTimeIntervalStr
{
    NSDate *now = [ShareFunction getCurrentTime];
    long interval = [now timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld", interval];
}

// 1988-01-01 或 19880101
+ (NSInteger)getAgeWithTimeStr:(NSString *)timeStr
{
    NSString *formatStr = @"YYYY-MM-dd";
    if ([timeStr rangeOfString:@"-"].length == 0)
        formatStr = @"YYYYMMdd";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatStr];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];

    NSDate* date = [formatter dateFromString:timeStr];
    NSInteger sec = [date timeIntervalSinceNow];
    int age = trunc(sec/(60*60*24))/365 * -1;

    return age;
}


#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor

+ (UIColor *)colorWithHexString:(NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    if ([cString length] < 6) {
        return [UIColor clearColor];
    }

    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];

    NSRange range;
    range.location = 0;
    range.length = 2;

    NSString *rString = [cString substringWithRange:range];

    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


#pragma mark    - 文件操作

//删除文件
+ (void)removeFile:(NSString *)filePath
{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    BOOL bRet = [fileMgr fileExistsAtPath:filePath];
    if (bRet) {
        NSError *err;
        [fileMgr removeItemAtPath:filePath error:&err];
    }
}

//文件是否存在
+ (BOOL)fileExistsAtPath:(NSString *)filePath
{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    BOOL bRet = [fileMgr fileExistsAtPath:filePath];
    return bRet;
}

+ (void)createDir:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL existed = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
    if (!(isDir == YES && existed == YES))
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
}

//+ (NSString *)getFilePathWith:(UIImage *)img andKey:(NSString *)key
//{
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"image"];
//
//    CGSize size = img.size;
//    CGSize newSize = size;
//    if (size.width > size.height) {
//        newSize.width = 88.5;
//        newSize.height = 88.5 * size.height / size.width;
//    }
//    else {
//        newSize.height = 88.5;
//        newSize.width = 88.5 * size.width / size.height;
//    }
//    UIImage *image = [img transformToSize:newSize];
//    NSData *data = UIImagePNGRepresentation(image);
//    NSString *file = nil;
//    if (!data) {
//        data = UIImageJPEGRepresentation(image, 1);
//        file = [filePath stringByAppendingString:[NSString stringWithFormat:@"%@.jpg", key]];
//    }
//    else {
//        file = [filePath stringByAppendingString:[NSString stringWithFormat:@"%@.png", key]];
//    }
//    [fileManager createFileAtPath:file contents:data attributes:nil];
//
//    return file;
//}

+ (NSString*)uuid
{
    //每次获得都不一样
//    CFUUIDRef puuid = CFUUIDCreate(nil);
//    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
//    NSString * result = CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
//    CFRelease(puuid);
//    CFRelease(uuidString);
//    result = [result stringByReplacingOccurrencesOfString:@"-" withString:@""];
//    result = [result lowercaseString];
//    return result;
    
    NSUUID *idenId = [[UIDevice currentDevice]identifierForVendor];
    
    return [idenId UUIDString];
}

//文件大小
+ (long long)fileSizeAtPath:(NSString*)filePath
{
    struct stat st;
    if(lstat([filePath cStringUsingEncoding:NSUTF8StringEncoding], &st) == 0){
        return st.st_size;
    }

    return 0;
}


#pragma mark    - toast

//显示Toast提示
+ (MBProgressHUD *)showToast:(NSString *)text inSuperview:(UIView *)view
{
    MBProgressHUD *hUD= [MBProgressHUD showHUDAddedTo:view animated:YES];
    hUD.mode = MBProgressHUDModeText;
    hUD.labelText = text;
    hUD.labelFont=[UIFont boldSystemFontOfSize:13];
    hUD.margin = 10.f;//边缘
//    hUD.yOffset = 150.f;
    hUD.yOffset = -SCREEN_HEIGHT/3.;// 中间点 向上偏屏幕1/3的 距离
    hUD.cornerRadius=5.f;
    hUD.color = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0.80];
    hUD.removeFromSuperViewOnHide = YES;
    hUD.userInteractionEnabled = NO;
    [hUD hide:YES afterDelay:2];

    return hUD;
}

+ (MBProgressHUD *)showToast:(NSString *)text
{
    return [ShareFunction showToast:text inSuperview:m_appDelegate.window];
}

+ (MBProgressHUD *)showMessageMiddle:(NSString *)text
{
    MBProgressHUD *hUD= [MBProgressHUD showHUDAddedTo:m_appDelegate.window animated:YES];
    hUD.mode = MBProgressHUDModeText;
    hUD.labelText = text;
    hUD.labelFont=[UIFont boldSystemFontOfSize:13];
    hUD.margin = 10.f;//边缘
    hUD.yOffset = 0;// 中间点 向上偏屏幕1/3的 距离
    hUD.cornerRadius=5.f;
    hUD.color = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0.80];
    hUD.removeFromSuperViewOnHide = YES;
    hUD.userInteractionEnabled = NO;
    [hUD hide:YES afterDelay:2];
    
    return hUD;
}
+ (MBProgressHUD *)showMessageSuper:(NSString *)text
{
    MBProgressHUD *hUD= [MBProgressHUD showHUDAddedTo:m_appDelegate.window animated:YES];
    hUD.mode = MBProgressHUDModeText;
    hUD.labelText = text;
    hUD.labelFont=[UIFont boldSystemFontOfSize:13];
    hUD.margin = 10.f;//边缘
    hUD.yOffset = -SCREEN_HEIGHT/3.;// 中间点 向上偏屏幕1/3的 距离
    hUD.cornerRadius=5.f;
    hUD.color = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0.80];
    hUD.removeFromSuperViewOnHide = YES;
    hUD.userInteractionEnabled = NO;
    [hUD hide:YES afterDelay:2];
    
    return hUD;
}
+ (MBProgressHUD *)showMessageBelow:(NSString *)text
{
    MBProgressHUD *hUD= [MBProgressHUD showHUDAddedTo:m_appDelegate.window animated:YES];
    hUD.mode = MBProgressHUDModeText;
    hUD.labelText = text;
    hUD.labelFont=[UIFont boldSystemFontOfSize:13];
    hUD.margin = 10.f;//边缘
    hUD.yOffset = SCREEN_HEIGHT/3.;// 中间点 向上偏屏幕1/3的 距离
    hUD.cornerRadius=5.f;
    hUD.color = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0.80];
    hUD.removeFromSuperViewOnHide = YES;
    hUD.userInteractionEnabled = NO;
    [hUD hide:YES afterDelay:2];
    
    return hUD;
}


+ (MBProgressHUD *)showHUD
{
    HUD = [MBProgressHUD showHUDAddedTo:m_appDelegate.window animated:YES];
//	HUD.delegate = self;
	HUD.labelText = @"正在加载";
    HUD.labelFont=[UIFont boldSystemFontOfSize:15];
    
//    [ShareFunction showCustomLoadingImageView];
    
    
    return HUD;
}
+ (MBProgressHUD *)showHUDInSuperView:(UIView *)view
{
    HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //	HUD.delegate = self;
    HUD.labelText = @"正在加载";
    HUD.labelFont=[UIFont boldSystemFontOfSize:15];
//    HUD.yOffset = 88.f;
    
//    [ShareFunction showCustomLoadingImageView];

    
    return HUD;
}

+ (MBProgressHUD *)showHUDWithText:(NSString *)text
{
    HUD = [MBProgressHUD showHUDAddedTo:m_appDelegate.window animated:YES];
    //	HUD.delegate = self;
	HUD.labelText = text;
    HUD.labelFont=[UIFont boldSystemFontOfSize:15];
    
//    [ShareFunction showCustomLoadingImageView];

    
    return HUD;
}
+ (void)hiddenHUD
{
    [HUD hide:YES afterDelay:0];
    
//    [GiFHUD dismiss];
    HUD=nil;
}


// 显示增加的经验值 和 积分值
+ (MBProgressHUD *)showToastWithText1:(NSString *)text1 andText2:(NSString *)text2 andText3:(NSString *)text3 inSuperview:(UIView *)view
{
    HUD = [[MBProgressHUD alloc] initWithView:view];
	[view addSubview:HUD];
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 45)] ;
    lab.font=[UIFont systemFontOfSize:18];
    lab.numberOfLines=0;
	lab.textColor=[UIColor whiteColor];
	lab.backgroundColor=[UIColor clearColor];
	lab.textAlignment=NSTextAlignmentCenter;
	lab.text=text1;
	
	HUD.customView = lab;
	
	// Set custom view mode
	HUD.mode = MBProgressHUDModeCustomView;
	HUD.color = [UIColor colorWithRed:253/255.f green:113/255.f blue:163/255.f alpha:0.90];
//	HUD.delegate = self;
	HUD.labelText = text2;
    if (text3) {
        HUD.detailsLabelText=text3;
    }
	
	HUD.labelFont=[UIFont boldSystemFontOfSize:17];
	HUD.detailsLabelFont=[UIFont boldSystemFontOfSize:17];
	[HUD show:YES];
	[HUD hide:YES afterDelay:3];
    
    return HUD;
}

//

/*
 
 //Setup GiFHUD image
 [GiFHUD setGifWithImageName:@"爱心.gif"];
 
 //显示
 [GiFHUD show];

 //显示 带有灰色背景的
 - (IBAction)showWithOverlayPressed:(id)sender {
 [GiFHUD showWithOverlay];
 }
 
//取消
 [GiFHUD dismiss];
 
 */

+ (MBProgressHUD *)showCustomLoadingImageView
{
    //不能在viewDidLoad 里面直接用 要在view加载之后使用 viewdidAppear可以
    [GiFHUD setGifWithImageName:@"logoLove0.gif"];
    //    [GiFHUD show];

    [GiFHUD showWithOverlay];
    
    return nil;
}

#pragma mark    - 提示框

+ (void)showAlertWithText:(NSString *)text
{
    if (m_alert != nil) {
        if ([m_alert.message isEqualToString:text]) {
            return;
        }
        [m_alert dismissWithClickedButtonIndex:10 animated:NO];
        m_alert = nil;
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:text delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
    alertView.tag = 1000;
    m_alert = alertView;
}

+ (void)showAlertWithTitle:(NSString *)title andText:(NSString *)text andDelegate:(id)delegate andTag:(NSInteger)tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:text delegate:delegate cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    alertView.tag = tag;
    [alertView show];
}

+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1000) {
        if (buttonIndex == 0) {
            m_alert = 0;
        }
    }
}


// 快速创建label
+(UILabel*)creatlabel:(CGRect)frame andTextColor:(UIColor*)textColor andTextfount:(UIFont*)font andBackgoundColor:(UIColor*)bgColor andTextAlignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.frame = frame;
    label.textColor = textColor;
    label.font = font;
    label.backgroundColor = bgColor;
    label.textAlignment = alignment;
    
    return label;
}

// 快速创建ImageView
+(UIImageView*)creatImageView:(CGRect)frame andImage:(UIImage*)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    return imageView;
}
//快速创建 btn 一 使用背景图片
+(UIButton*)creatButton:(CGRect)frame andBtnName:(NSString*)name andBtnBGColor:(UIColor*)bgColor andBtnTitlColor:(UIColor*)titleColor andBGImageNor:(UIImage*)imageNor andBGImageHightLight:(UIImage*)imageHightLight
{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:name forState:UIControlStateNormal];
    btn.backgroundColor = bgColor;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setBackgroundImage:imageNor forState:UIControlStateNormal];
    [btn setBackgroundImage:imageHightLight forState:UIControlStateNormal];
    
    return btn;
}


// 返回图片路径
+(NSURL *)getImageURLWithImageName:(NSString *)imageName
{
    NSURL*url;
    
    NSString *str=[NSString stringWithFormat:@"http://file.3dg.cn/readimg.php?exec=%@",imageName];
    url=[NSURL URLWithString:str];
    NSLog(@"图片路径=%@",url);
    return url;
}

//清除html标签
+ (NSString *)clearHtmlTag:(NSString *)text
{
    NSString *str = [NSString stringWithFormat:@"%@", text];
    NSString *regEx = @"<([^>]*)>";
    str = [str stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    str = [str stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
    str = [str stringByReplacingOccurrencesOfRegex:regEx withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];//网页的空格占位符
    return str;
}

// 找出IMG标签
+ (NSString *)getIMGFromHtml:(NSString *)text
{
    NSString *regxpForImgTag = @"<\\s*img\\s+([^>]*)\\s*>"; // 找出IMG标签
    
    NSString *str = [NSString stringWithFormat:@"%@", text];
    str = [str stringByMatching:regxpForImgTag];
    return str;
}
// 找出IMG标签的SRC属性
+ (NSString *)getIMGTagSrcFromHtml:(NSString *)text
{
    NSString *regxpForImaTagSrcAttrib = @"src=\"([^\"]+)\""; // 找出IMG标签的SRC属性
    
    NSString *str = [NSString stringWithFormat:@"%@", text];
    str = [str stringByMatching:regxpForImaTagSrcAttrib];
    return str;
}


// 清除前后空格
+ (NSString *)clearWhiteSpace:(NSString *)text
{
    NSString *str=[text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return str;
}


+(int)sinaCountWord:(NSString *)s

{
    
    int i,n=[s length],l=0,a=0,b=0;
    
    unichar c;
    
    for(i=0;i<n;i++){
        
        c=[s characterAtIndex:i];
        
        if(isblank(c)){
            
            b++;
            
        }else if(isascii(c)){
            
            a++;
            
        }else{
            
            l++;
            
        }
        
    }
    
    if(a==0 && l==0) return 0;
    
    return l+(int)ceilf((float)(a+b)/2.0);
    
}


#pragma mark - Grayscale

+ (UIImage *)grayscaleImageForImage:(UIImage *)image {
    // Adapted from this thread: http://stackoverflow.com/questions/1298867/convert-image-to-grayscale
    const int RED = 1;
    const int GREEN = 2;
    const int BLUE = 3;
    
    // Create image rectangle with current image width/height
    CGRect imageRect = CGRectMake(0, 0, image.size.width * image.scale, image.size.height * image.scale);
    
    int width = imageRect.size.width;
    int height = imageRect.size.height;
    
    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [image CGImage]);
    
    for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            // convert to grayscale using recommended method: http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
            uint32_t gray = 0.3 * rgbaPixel[RED] + 0.59 * rgbaPixel[GREEN] + 0.11 * rgbaPixel[BLUE];
            
            // set the pixels to gray
            rgbaPixel[RED] = gray;
            rgbaPixel[GREEN] = gray;
            rgbaPixel[BLUE] = gray;
        }
    }
    
    // create a new CGImageRef from our context with the modified pixels
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:imageRef
                                                 scale:image.scale
                                           orientation:UIImageOrientationUp];
    
    // we're done with image now too
    CGImageRelease(imageRef);
    
    return resultUIImage;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

//image 转base64字符串
+ (NSString *) image2String:(UIImage *)image;
{
    NSData *pictureData = UIImageJPEGRepresentation(image, 0.5);
    NSString *pictureDataString = [pictureData base64Encoding];
    return pictureDataString;
}

//+ (UIImage *) string2Image:(NSString *)string {
//    UIImage *image = [UIImage imageWithData:[NSData dataWithBase64EncodedString:string]];
//    return image;
//}


// 根据iphone6 适配iphone5 和iphone6plus

+(CGFloat )formatSpaceFromIphone6:(CGFloat )space
{
    if ([[UIScreen mainScreen] bounds].size.width==375) {// iphone6
        return space;
        
    }else{//iphone 5 和 6+
        
        //按照 320*568 的原始比例来 适配出 375*667（750*1334）  和  414*736    621*1104（1242*2208）的点位置
        /*
         因为：x1=x*w1/w2; y1=y*h1/h2;
         */
        CGFloat w1=[[UIScreen mainScreen] bounds].size.width;
        CGFloat w2=375;
        
//        CGFloat h1=[[UIScreen mainScreen] bounds].size.height;
//        CGFloat h2=667;
        
//        CGRect iphone6Rect=CGRectMake(rect.origin.x*w1/w2, rect.origin.y*h1/h2, rect.size.width*w1/w2, rect.size.height*h1/h2);
        return space * w1/w2;
    }
}



// 根据iphone5 适配iphone6 和iphone6plus
+(CGRect )formatCGRectFromIphone5:(CGRect )rect
{
    if ([[UIScreen mainScreen] bounds].size.width==320) {// iphone4 和iphone5
        return rect;
        
    }else{//iphone 6 和 6+
        
        //按照 320*568 的原始比例来 适配出 375*667（750*1334）  和414*736    621*1104（1242*2208）的点位置
        /*
         因为：x1=x*w1/w2; y1=y*h1/h2;
         */
        CGFloat w1=[[UIScreen mainScreen] bounds].size.width;
        CGFloat w2=320.;
        
        CGFloat h1=[[UIScreen mainScreen] bounds].size.height;
        CGFloat h2=568.;
        
        CGRect iphone6Rect=CGRectMake(rect.origin.x*w1/w2, rect.origin.y*h1/h2, rect.size.width*w1/w2, rect.size.height*h1/h2);
        return iphone6Rect;
    }
    
}
+(CGSize )formatCGSizeFromIphone5:(CGSize)size
{
    if ([[UIScreen mainScreen] bounds].size.width==320) {// iphone4 和iphone5
        return size;
        
    }else{//iphone 6 和 6+
        
        //按照 320*568 的原始比例来 适配出 375*667（750*1334）  和 414*736   621*1104（1242*2208）的点位置
        /*
         因为：x1=x*w1/w2; y1=y*h1/h2;
         */
        CGFloat w1=[[UIScreen mainScreen] bounds].size.width;
        CGFloat w2=320.;
        
        CGFloat h1=[[UIScreen mainScreen] bounds].size.height;
        CGFloat h2=568.;
        
        CGSize iphone6Size=CGSizeMake(size.width*w1/w2,size.height*h1/h2);
        return iphone6Size;
    }
    
}
+(CGFloat )formatHEIGHTFromIphone5:(CGFloat )space
{
    if ([[UIScreen mainScreen] bounds].size.width==320) {// iphone4 和iphone5
        return space;
        
    }else{//iphone 6 和 6+
        
        //按照 320*568 的原始比例来 适配出 375*667（750*1334）  和414*736   621*1104（1242*2208）的点位置
        /*
         因为：x1=x*w1/w2; y1=y*h1/h2;
         */
        //        CGFloat w1=[[UIScreen mainScreen] bounds].size.width;
        //        CGFloat w2=320.;
        
        CGFloat w1=[[UIScreen mainScreen] bounds].size.width;
        CGFloat w2=320.;
        
        return space*w1/w2;
    }
}




@end
