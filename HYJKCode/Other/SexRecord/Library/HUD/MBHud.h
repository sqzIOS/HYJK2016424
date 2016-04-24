//
//  MBHud.h
//  Sexduoduo
//
//  Created by ly1992 on 15/6/2.
//  Copyright (c) 2015年 ly. All rights reserved.
/*
 加载状态 外部同一调用
 */

#import <UIKit/UIKit.h>

@interface MBHud : UIView
/**
 *
 *
 *  @param aView 视图
 *  @param title title
 *
 *  @return HUD
 */
+ (id)showInView:(UIView *)aView withTitle:(NSString *)title;
/**
 *  加载结束 移除HUD
 */
+ (BOOL)removeFromView:(UIView *)aView;
@end
