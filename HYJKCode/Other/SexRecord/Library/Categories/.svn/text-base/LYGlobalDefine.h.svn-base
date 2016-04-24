//
//  LYGlobalDefine.h
//  Sexduoduo
//
//  Created by ly1992 on 15/5/11.
//  Copyright (c) 2015年 dsz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYGlobalDefine : NSObject

/*
 *获取iphone手机型号
 *返回 4，5，6，61....
 */
+(NSInteger)getIphoneModel;
/**
 获取字号
 type:1表示Font_SuperLarge_Size,2表示Font_ExtraLarge_Size,3表示Font_Large_Size,4表示Font_Middle_Size,5表示Font_Small_Size
 其它值无效
 **/
+(CGFloat)getFontSize:(NSInteger)type;
/*
 **以6为基类， 适配 其他屏幕
 */
+(CGFloat)getScreenSize:(NSInteger)size;
/**
 *  获取字体的大小范围
 */
+(CGSize)getTextContent:(NSString*)text withFont:(UIFont*)font;
/**
 *  获取字体的大小范围
 *  多行显示
 */
+(CGSize)getTextMultilineContent:(NSString*)text withFont:(UIFont*)font withSize:(CGSize)size;

/**
 * 文字局部变色
 **/
+(void)setLableText:(UILabel*)label attribute:(NSString*)attribute instr:(NSString*)str withColor:(UIColor*)color;

@end
