//
//  UIView+QZCategory.h
//  sexduoduo
//
//  Created by showm on 15/9/25.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QZCategory)

//设置圆角
-(void)qzSetCornerRadius:(float)radius;

//设置边宽
-(void)qzSetBorderWidth:(float)width;

//设置边色
-(void)qzSetBorderColor:(UIColor *)color;

#pragma mark 加载nibView
+ (id)loadFromXIB;
+ (id)loadFromXIBName:(NSString *)xibName;


#pragma mark 画线

/*
 //化虚线
 //参数：x，y 为起始坐标   ； toX,toY 为终点坐标
 //参数： dashArr 传入的数组表示实线 和 空格 分别占用的像素个数
   eg:[NSArray arrayWithObjects:[NSNumber numberWithInt:2.0],[NSNumber numberWithInt:2]
 */
-(void)addLine:(int)x tox:(int)toX y:(int)y toY:(int)toY  withDashPattern:(NSArray*)dashArr  andLineColor:(UIColor *)lineColor;

#pragma mark - 添加子View
/*
 * UIView上下居中
 * return:  一行的高度
 * by hyk
 */
+ (void)setSubviewCenterOnVertical:(UIView *)subView AtX:(CGFloat)xStart superView:(UIView *)superView;

/*
 * UIView左右居中
 * return:  一行的高度
 * by hyk
 */
+ (void)setSubviewCenterOnHorizontal:(UIView *)subView AtY:(CGFloat)yStart superView:(UIView *)superView;

/*
 * UIView上下左右居中
 * return:  一行的高度
 * by hyk
 */
+ (void)setSubviewOnCenter:(UIView *)subView superView:(UIView *)superView;

/**
 *  设置圆角矩形
 */
-(void)setViewCornerRadius:(CGFloat)cornerRadius;


@end
