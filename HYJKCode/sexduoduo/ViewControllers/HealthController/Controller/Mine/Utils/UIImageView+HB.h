//
//  UIImageView+HB.h
//  XingJiaBi
//
//  Created by Soldier on 15-1-29.
//  Copyright (c) 2015年 Xiamen Haibao Info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HB)

/*
 * 图片加载：带进度条，加载失败图
 */
- (void)hb_setImageURLWithProgress:(id)imageURL;

/*
 * 图片加载：带placeholderImage 和灰色背景
 */
- (void)hb_setImageURL:(id)imageURL;

- (void)hb_setImageURL:(id)imageURL placeholderColor:(UIColor *)placeholderColor;


- (void)hb_setImageURL:(id)imageURL placeholderImage:(UIImage *)placeholderImage;

/*
 * 图片加载：圆形头像，带默认头像
 */
- (void)setAvatarImageView:(id)imageURL;

/*
 * 设置圆形imageView
 */
- (void)setRoundImageView;

/**
 *  设置圆角矩形
 */
-(void)setCornerRadius:(CGFloat) cornerRadius;

/*
 * 设置带边环的圆形视图
 * by hyk
 */
- (void)setBorderRoundImageView:(UIColor *)borderColor;

/*
 * 设置带边环的圆形头像
 * GrayBorder
 */
- (void)setAvatarImageViewWithGrayBorder:(id)imageURL;

/*
 * 设置带边环的圆形头像
 * WhiteBorder
 */
- (void)setAvatarImageViewWithWhiteBorder:(id)imageURL;

/*
 * 设置UIImageView的image，并根据image的大小进行适配调整
 * by hyk
 */
- (void)autoLayoutForImage:(UIImage *)image;

/*
 * 设置UIImageView的image，并根据image的大小设置size
 */
- (void)layoutForImageForIpad:(UIImage *)image;
/*
 * 设置UIImageView的image，并根据image的大小设置size
 * by hyk
 */
- (void)layoutForImage:(UIImage *)image;

/*
 * 居中截取图片
 * by Soldier
 */
+ (void)handleImageSize:(UIImageView *)imageView;



@end
