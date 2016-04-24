//
//  UIFont+Extend.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/13.
//  Copyright (c) 2015年 dsz. All rights reserved.
//

#import "UIFont+Extend.h"

@implementation UIFont (Extend)

+(CGFloat)getFontSizeByWidth:(CGFloat)width withText:(NSString*)text
{
    if (text.length <= 0) {
        text = @" ";
    }
    CGFloat turewidth = 0;
    CGFloat fontsize = [UIFont systemFontSize];
    do {
        UIFont* font = [UIFont systemFontOfSize:fontsize];
        CGSize size = [text sizeWithFont:font];
        //
        turewidth = size.width;
        fontsize -= 1;
    } while (turewidth > width);
    
    return fontsize;
}

+(UIFont*)getFontByWidth:(CGFloat)width withText:(NSString*)text
{
    CGFloat fontsize = [self getFontSizeByWidth:width withText:text];
    return [UIFont systemFontOfSize:fontsize];
}

/**
 根据高度得到字体大小,以确保文字能全部显示出来
 **/
+(CGFloat)getFontSizeByHeight:(CGFloat)Height withText:(NSString*)text
{
    if (text.length <= 0) {
        text = @"汉";
    }
    CGFloat tureHeight = 0;
    CGFloat fontsize = 10;
    do {
        UIFont* font = [UIFont systemFontOfSize:fontsize];
        CGSize size = [text sizeWithFont:font];
        tureHeight = size.height;
        fontsize += 1;
    } while (tureHeight < Height);
    
    return fontsize;
}

/**
 根据高度得到字体大小,以确保文字能全部显示出来
 **/
+(UIFont*)getFontByHeight:(CGFloat)Height withText:(NSString*)text
{
    CGFloat fontsize = [self getFontSizeByHeight:Height withText:text];
    return [UIFont systemFontOfSize:fontsize];
}
@end
