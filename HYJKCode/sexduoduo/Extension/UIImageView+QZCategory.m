//
//  UIImageView+QZCategory.m
//  sexduoduo
//
//  Created by showm on 15/10/21.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "UIImageView+QZCategory.h"

@implementation UIImageView (QZCategory)
+(UIImageView*)qzImageViewLineWithX:(NSInteger)left withY:(NSInteger)top withWidth:(NSInteger)width withHeight:(NSInteger)height
{
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(left, top, width, height)];
    img.backgroundColor = RGBCOLOR(229,229,229);
    return img;
}
@end
