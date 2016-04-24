//
//  UIImageView+QZCategory.h
//  sexduoduo
//
//  Created by showm on 15/10/21.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (QZCategory)

/**
 *   画横线
 *   x  y w h
 */
+(UIImageView*)qzImageViewLineWithX:(NSInteger)left withY:(NSInteger)top withWidth:(NSInteger)width withHeight:(NSInteger)height;

/*
 // 属性会导致图片变形。
 UIViewContentModeScaleToFill

 // 会保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。
 UIViewContentModeScaleAspectFit
 
 //== (如果图片大 显示图片的一部分 不压缩) 也会证图片比例不变，但是是填充整个ImageView的，可能只有部分图片显示出来。
 UIViewContentModeScaleAspectFill
 */

@end
