//
//  HBButton.h
//  TaQu
//
//  Created by haibaoIos on 15/2/9.
//  Copyright (c) 2015年 厦门海豹信息技术. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+WebCache.h"
#import "ImageUtil.h"
#import "HBButton.h"

@interface HBButton : UIButton

@property(nonatomic, strong)id userInfo;
@property(nonatomic, strong)UIColor *hlColor;
@property(nonatomic, strong)UIColor *slColor;
@property(nonatomic, strong)UIImage *hlImage;
@property(nonatomic, assign) ImageRoundCorner imageRoundCorner;
@property(nonatomic, assign) CGFloat cornerRadius;
@property(nonatomic, retain) UIColor *fillColor;
@property(nonatomic, strong) UIImageView *coverView; //用来显示高亮，设置隐藏可用来关闭高亮
@property(nonatomic, assign) BOOL showRealImg;//是否将ImageView显示成整个button的范围

/*
 * imageURL 可以为NSURL，也可以为NSString
 * placeholderImage 默认图片
 * by hyk
 */
- (void)hb_setImageURL:(id)imageURL placeholderImage:(UIImage *)placeholderImage;

/*
 * imageURL 可以为NSURL，也可以为NSString
 * placeholderColor 根据颜色设置的默认图片
 * by hyk
 */
- (void)hb_setImageURL:(id)imageURL placeholderColor:(UIColor *)placeholderColor;


/*
 * 使用setImageView来加载图片而不是setBackgroundImageView
 * imageURL 可以为NSURL，也可以为NSString
 * placeholderColor 根据颜色设置的默认图片
 * by hyk
 */
- (void)hb_setRealImageURL:(id)imageURL placeholderImage:(UIImage *)placeholderImage;


/*
 * 使用setImageView来加载图片而不是setBackgroundImageView
 * imageURL 可以为NSURL，也可以为NSString
 * placeholderColor 根据颜色设置的默认图片
 * by hyk
 */
- (void)hb_setRealImageURL:(id)imageURL placeholderColor:(UIColor *)placeholderColor;

/*
 * imageURL 可以为NSURL，也可以为NSString
 * 自带默认图片 灰色背景
 * by lxq
 */
- (void)hb_setImageURL:(id)imageURL;

/*
 * 使用setImageView来加载图片而不是setBackgroundImageView
 * imageURL 可以为NSURL，也可以为NSString
 * 自带默认图片 灰色背景
 * by lxq
 */
- (void)hb_setRealImageURL:(id)imageURL;



- (void)setAvatarButton:(id)imageURL;

- (void)setRoundButton;

@end