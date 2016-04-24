//
//  UINavigationBar+CustomNavBar.m
//  MobileStore
//
//  Created by sai on 13-1-23.
//  Copyright (c) 2013年 yunpos. All rights reserved.
//

#import "UINavigationBar+CustomNavBar.h"

@implementation UINavigationBar (CustomNavBar)

-(UIImage*)barBackground
{
    if (IOS7_OR_LATER) {
        return [UIImage imageNamed:@"navBg_64.png"];
    }
    return [UIImage imageNamed:@"navBg_64.png"];
}


-(void)didMoveToSuperview
{
    //iOS5 only
    //iOS5 only
//    if([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
//    {
//        [self setBackgroundImage:[self barBackground] forBarMetrics:UIBarMetricsDefault];
//    }
//    
//    
//    self.hidden = YES;
//    if (self.barStyle == UIBarStyleBlackTranslucent) {
//        self.hidden = NO;  //选择图片时候  显示 tabtar
//    }
    
//    int imgY = -20;
//    if (IOS7_OR_LATER) {
//        imgY = 0;
//    }
//    
//    UIView *imgv = [[UIView alloc]init];
//    imgv.frame = CGRectMake(0, imgY,SCREEN_WIDTH, 64);
//    imgv.backgroundColor = NAV_COLOR;
//    [self.superview addSubview:imgv];
    
//    [self drawShadow];
}

//this doesn't work on iOS5 but is needed for iOS4 and earlier
-(void)drawRect:(CGRect)rect
{
    //draw image
    [[self barBackground] drawInRect:rect];
}

- (void)drawShadow
{
    // draw shadow
    //阴影效果
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(0, 4);
    self.layer.shadowOpacity = 0.45;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
}

@end


