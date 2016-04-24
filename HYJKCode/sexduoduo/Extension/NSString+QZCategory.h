//
//  NSString+QZCategory.h
//  sexduoduo
//
//  Created by showm on 15/9/1.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QZCategory)

#pragma mark - 实例方法


//清除html标签
- (NSString *)clearHtmlTag;


#pragma mark - 类方法
//
+(NSAttributedString *)attributedStringWithHtml:(NSString *)html;
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



// 清除前后空格
+ (NSString *)clearWhiteSpace:(NSString *)text;

//清除前后空格 和 换行字符
+ (NSString *)clearWhiteSpaceAndNewLine:(NSString *)text;

@end
