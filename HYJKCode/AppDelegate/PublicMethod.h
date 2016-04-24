//
//  PublicMethod.h
//  sexduoduo
//
//  Created by Showm on 14-7-21.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicMethod : NSObject

//论坛相关
//清除html标签
+ (NSString *)clearHtmlTag:(NSString *)text;

//
+(NSMutableDictionary *)formartDic:(NSDictionary *)tempDic;



// 根据登陆非登录 男女 获得用户显示的头像
+(UIImage *)getHeaderImage;
//保存图片到本地
+ (void)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName;


//下载图片
+(UIImage *)downloadImageWithURL:(NSString *)urlStr;


// 化简时间 几分钟前  几小时前  几天前    参数格式 yyyy-MM-dd HH:mm:ss
+ (NSString*)intervalSinceNow: (NSString*) theDate;

// 倒计时时间
+(int )timeDistance24;


+(int)getAttributedStringHeightWidthValue:(int)width  andAttributedString:(NSMutableAttributedString *)attributedString;


// 跳转登录
+(void)gotoLoginWithVC:(UIViewController *)vc;


+(void)themeGotoSubViewWithThisVC:(UIViewController *)vc andDic:(NSDictionary *)dic;
@end
