//
//  NCFrame.h
//  NodeChat
//
//  Created by wangjian on 14-11-17.
//  Copyright (c) 2014年 jiayu. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIViewAdditions.h"


#define FNavi           (44.f)
#define FStatus         [JFrame statusBarHeight]
#define FTab            (50.f)



#define k320Stretch(x)      [JFrame get320Persent:x]
#define k568Stretch(x)     [JFrame get568persent:x]

#define kComFrontDis    k320Stretch(15)


@interface JFrame : NSObject


CGFloat f320Stretch(CGFloat width);

+(CGFloat)screen_width;
+(CGFloat)screen_height;



+(CGRect)bound_full;
+(CGRect)bound_status;
+(CGRect)bound_status_navi;
+(CGRect)bound_status_navi_tab;
+(CGRect)bound_status_tab;
+(CGRect)bound_tab;
+(CGFloat)statusBarHeight;
+(CGFloat)get320Persent:(CGFloat)width;
+(CGFloat)get568persent:(CGFloat)height;
+(CGRect)get320StretchOfRect:(CGRect)rect;

+(CGRect)getStringFrame:(NSString*)string font:(UIFont*)font width:(CGFloat)width;

@end
