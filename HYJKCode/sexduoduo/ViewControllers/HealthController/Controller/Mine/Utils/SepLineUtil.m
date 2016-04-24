//
//  SepLineUtil.m
//  XingJiaBi
//
//  Created by HuangYikai on 14-6-27.
//  Copyright (c) 2014年 Xiamen Haibao Info. All rights reserved.
//

#import "SepLineUtil.h"
#import "ImageUtil.h"

@implementation SepLineUtil

+ (void)addSepLineOnTopAndBottom:(UIView *)superView {
    [SepLineUtil addSepLineOnTop:superView];
    [SepLineUtil addSepLineOnBottom:superView];
}

//top
+ (UIImageView *)addSepLineOnTop:(UIView *)superView {
    UIImage *topImg = isRetina ? [UIImage imageNamed:@"sepLineHorizontal_640.png"] : [UIImage imageNamed:@"sepLineHorizontal_640_all.png"];
    UIImageView *topImgView = [SepLineUtil addSepLineOnTop:superView forImage:topImg];
    return topImgView;
   
}

+ (UIImageView *)addSepLineOnRight:(UIView *)superView{
    UIImage *lineImg = isRetina ? [UIImage imageNamed:@"sepLineVerticalOnePRight"] : [UIImage imageNamed:@"sepLineVerticalOnePFull"];
    CGFloat height = superView.height;
    lineImg = [ImageUtil scaleToSize:lineImg size:CGSizeMake(1, height)];
    UIImageView *rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(superView.width - 1, 0, 1, height)];
    rightImgView.image = lineImg;
    [superView addSubview:rightImgView];
    return rightImgView;
}

+ (UIImageView *)addSepLineOnLeft:(UIView *)superView{
    UIImage *lineImg = isRetina ? [UIImage imageNamed:@"sepLineVerticalOnePLeft"] : [UIImage imageNamed:@"sepLineVerticalOnePFull"];
    CGFloat height = superView.height;
    lineImg = [ImageUtil scaleToSize:lineImg size:CGSizeMake(1, height)];
    UIImageView *leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1, height)];
    leftImgView.image = lineImg;
    [superView addSubview:leftImgView];
    return leftImgView;
}

+ (UIImageView *)addSepLineOnTop:(UIView *)superView forImage:(UIImage *)image {
    UIImage *topImg = image;
    CGFloat x = superView.width - GTFixWidthFlaot(image.size.width);
    CGFloat width = GTFixWidthFlaot(image.size.width);
    UIImageView *topImgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, width, HBOnePixelLineHeight)];
    topImgView.image = topImg;
    topImgView.backgroundColor = [UIColor clearColor];
    [superView addSubview:topImgView];
    return topImgView;
}

//bottom
+ (UIImageView *)addSepLineOnBottom:(UIView *)superView {
    UIImage *bottomImg = isRetina ? [UIImage imageNamed:@"sepLineHorizontal_640_down.png"] : [UIImage imageNamed:@"sepLineHorizontal_640_all.png"];
    UIImageView *bottomImgView = [SepLineUtil addSepLineOnBottom:superView forImage:bottomImg];
    return bottomImgView;
}

//rightAlignment
+ (UIImageView *)addSepLineOnBottom:(UIView *)superView forImage:(UIImage *)image {
    
    
    UIImage *bottomImg = image;
    CGFloat x = superView.width - GTFixWidthFlaot(image.size.width);
    CGFloat width = GTFixWidthFlaot(image.size.width);
    UIImageView *bottomImgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, superView.frame.size.height - HBOnePixelLineHeight, width, HBOnePixelLineHeight)];
    bottomImgView.image = bottomImg;
    bottomImgView.backgroundColor = [UIColor clearColor];
    [superView addSubview:bottomImgView];
    return bottomImgView;
}

//20%透明黑色分割线 又被称为“第一种线”
+ (void)addSepLineOnTopAndBottomThinLine:(UIView *)superView {
    [SepLineUtil addSepLineOnTopThinLine:superView];
    [SepLineUtil addSepLineOnBottomThinLine:superView];
}

+ (UIImageView *)addSepLineOnTopThinLine:(UIView *)superView {
    UIImage *lineImg = isRetina ? [UIImage imageNamed:@"sepLineHorizontalOnePTop"] : [UIImage imageNamed:@"sepLineVerticalOnePFull"];
    CGFloat width = superView.width;
    lineImg = [ImageUtil scaleToSize:lineImg size:CGSizeMake(width, HBOnePixelLineHeight)];
    UIImageView *topImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, HBOnePixelLineHeight)];
    topImgView.image = lineImg;
    [superView addSubview:topImgView];
    
    return topImgView;
}

+ (UIImageView *)addSepLineOnBottomThinLine:(UIView *)superView {
    UIImage *lineImg = isRetina ? [UIImage imageNamed:@"sepLineHorizontalOnePBottom"] : [UIImage imageNamed:@"sepLineVerticalOnePFull"];
    CGFloat width = superView.width;
    lineImg = [ImageUtil scaleToSize:lineImg size:CGSizeMake(width, HBOnePixelLineHeight)];
    UIImageView *bottomImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, superView.height - HBOnePixelLineHeight, width, HBOnePixelLineHeight)];
    bottomImgView.image = lineImg;
    [superView addSubview:bottomImgView];
    
    return bottomImgView;
}

+ (UIView *)addSepLineOnBottomForSuperView:(UIView *)superView andLineWidth:(CGRect)frame{
    UIView *lineView = [[UIView alloc] initWithFrame:frame];
    lineView.backgroundColor = RGBCOLOR(241, 241, 241);
    [superView addSubview:lineView];
    return lineView;
}


+ (void)addSepLine:(UIView *)superView
           forType:(CellLocation)cellLocation
      hasLeftImage:(BOOL)has{
    
    CGFloat left = has ? GTFixWidthFlaot(40) : GTFixWidthFlaot(10);
    
    if (superView && [superView isKindOfClass:[UIView class]]) {
        switch (cellLocation) {
            case CellLocation_Top:
            {
                [self addSepLineOnBottomForSuperView:superView andLineWidth:CGRectMake(left, superView.height - HBOnePixelLineHeight, k_screenWidth - left, HBOnePixelLineHeight)];
            }
                break;
                
            case CellLocation_Middle:
            {
                [self addSepLineOnBottomForSuperView:superView andLineWidth:CGRectMake(left, superView.height - HBOnePixelLineHeight, k_screenWidth - left, HBOnePixelLineHeight)];
            }
                break;
            default:
                break;
        }
    }
    
    
}


+ (void)addSepLine:(UIView *)superView
           forType:(CellLocation)cellLocation
        middleLine:(UIImage *)middleLine{
    
    if (superView && [superView isKindOfClass:[UIView class]]) {
        switch (cellLocation) {
            case CellLocation_Top:
            {
                [self addSepLineOnBottomForSuperView:superView andLineWidth:CGRectMake(GTFixWidthFlaot(10), superView.height - HBOnePixelLineHeight, k_screenWidth - GTFixWidthFlaot(10), HBOnePixelLineHeight)];
            }
                break;
            
            case CellLocation_Middle:
            {
//                [self addSepLineOnBottom:superView forImage:middleLine];
                [self addSepLineOnBottomForSuperView:superView andLineWidth:CGRectMake(GTFixWidthFlaot(10), superView.height - HBOnePixelLineHeight, k_screenWidth - GTFixWidthFlaot(10), HBOnePixelLineHeight)];
            }
                break;
        
            case CellLocation_Bottom:
            {
//                [self addSepLineOnBottom:superView];
            }
                break;
                
            case CellLocation_TopAndBottom:
            {
//                [self addSepLineOnTop:superView];
//                [self addSepLineOnBottom:superView];
            }
                break;
                
            default:
                break;
        }
    }
}

@end
