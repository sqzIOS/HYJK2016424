//
//  UIButton+Extend.h
//  Sexduoduo
//
//  Created by ly1992 on 15/5/27.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extend)
//图片+文字 == 按钮
-(void)lkCustomTitleStr:(NSString*)title imageStr:(UIImage*)image;
//文字
-(void)lkTitle:(NSString*)title;
//文字 + 文字颜色
-(void)lkTitleColor:(UIColor *)color;
//文字 + 文字颜色 + 高亮文字颜色
-(void)lkTitleColor:(UIColor *)color1 highl:(UIColor*)color2;
//图片
-(void)lkImage:(id)image;
//图片 + 高亮
-(void)lkImage:(id)img1 highl:(id)img2;
//图片 + 高亮 + 比例拉伸
-(void)lkImage:(id)img1 highl:(id)img2 stretch:(BOOL)stretch;
//背景图片
-(void)lkBackgroupImage:(id)image;
//背景图片 + 高亮
-(void)lkBackgroupImage:(id)img1 highl:(id)img2;
//背景图片 + 高亮 + 比例拉伸
-(void)lkBackgroupImage:(id)img1 highl:(id)img2 stretch:(BOOL)stretch;


/*
 //调整图片和 titleLab 的位置
 [_buyBtn setImageEdgeInsets:UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)];
 [_buyBtn setTitleEdgeInsets:UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)];
 */

@end
