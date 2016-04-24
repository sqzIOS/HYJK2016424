//
//  UIView+QZCategory.m
//  sexduoduo
//
//  Created by showm on 15/9/25.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "UIView+QZCategory.h"

@implementation UIView (QZCategory)

//设置圆角
-(void)qzSetCornerRadius:(float)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;//切
}

//设置边宽
-(void)qzSetBorderWidth:(float)width
{
    self.layer.borderWidth = width;
}

//设置边色
-(void)qzSetBorderColor:(UIColor *)color
{
    self.layer.borderColor = color.CGColor;
}

/**
 *  设置圆角矩形
 */
-(void)setViewCornerRadius:(CGFloat)cornerRadius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.contentMode = UIViewContentModeScaleAspectFill;
}

#pragma mark 加载nibView
+ (id)loadFromXIB
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

+ (id)loadFromXIBName:(NSString *)xibName
{
    return [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
}




#pragma mark 画线

/*
 //化虚线
 //参数：x，y 为起始坐标   ； toX,toY 为终点坐标
 //参数： dashArr 传入的数组表示实线 和 空格 分别占用的像素个数
 eg:[NSArray arrayWithObjects:[NSNumber numberWithInt:2.0],[NSNumber numberWithInt:2]]
 */
-(void)addLine:(int)x tox:(int)toX y:(int)y toY:(int)toY  withDashPattern:(NSArray*)dashArr  andLineColor:(UIColor *)lineColor
{
    CAShapeLayer *lineShape = nil;
    CGMutablePathRef linePath = nil;
    linePath = CGPathCreateMutable();
    lineShape = [CAShapeLayer layer];
    lineShape.lineWidth = 0.5f;
    lineShape.lineCap = kCALineCapRound;;
    //    lineShape.strokeColor = [UIColor darkGrayColor].CGColor;
    lineShape.strokeColor = lineColor.CGColor;
    
    CGPathMoveToPoint(linePath, NULL, x, y);
    CGPathAddLineToPoint(linePath, NULL, toX, toY);
    lineShape.path = linePath;
    CGPathRelease(linePath);
    
    //画虚线
    //    [lineShape setLineDashPattern:
    //     [NSArray arrayWithObjects:[NSNumber numberWithInt:50], [NSNumber numberWithInt:2],
    //      nil]];
    [lineShape setLineDashPattern:dashArr];
    [self.layer addSublayer:lineShape];
}

#pragma mark - 添加子View

/*
 * Label上下居中
 * return:  一行的高度
 * by hyk
 */
+ (void)setSubviewCenterOnVertical:(UIView *)subView AtX:(CGFloat)xStart superView:(UIView *)superView{
    if (![superView isKindOfClass:[UIView class]]) {
        return;
    }
    
    subView.origin = CGPointMake(xStart, floorf((superView.height - subView.height)/2));
}


/*
 * UIView左右居中
 * return:  一行的高度
 * by hyk
 */
+ (void)setSubviewCenterOnHorizontal:(UIView *)subView AtY:(CGFloat)yStart superView:(UIView *)superView{
    if (![superView isKindOfClass:[UIView class]]) {
        return;
    }
    
    subView.origin = CGPointMake(floorf((superView.width - subView.width)/2), yStart);
}

/*
 * UIView上下左右居中
 * return:  一行的高度
 * by hyk
 */
+ (void)setSubviewOnCenter:(UIView *)subView superView:(UIView *)superView{
    if (![superView isKindOfClass:[UIView class]]) {
        return;
    }
    
    subView.origin = CGPointMake(floorf((superView.width - subView.width)/2), floorf((superView.height - subView.height)/2));
}


@end
