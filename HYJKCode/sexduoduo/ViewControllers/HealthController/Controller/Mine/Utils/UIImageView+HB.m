//
//  UIImageView+HB.m
//  XingJiaBi
//
//  Created by Soldier on 15-1-29.
//  Copyright (c) 2015年 Xiamen Haibao Info. All rights reserved.
//

#import "UIImageView+HB.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+LK.h"
#import "StringUtil.h"
#import "ImageUtil.h"

@implementation UIImageView (HB)

- (void)hb_setImageURLWithProgress:(id)imageURL{
    if (!imageURL) {
        return;
    }
    
    if ([imageURL isKindOfClass:[NSString class]]) {
        if (![StringUtil isEmpty:imageURL]){
            imageURL = [NSURL URLWithString:imageURL];
        } else {
            self.image = [UIImage imageNamed:@"remind_noimage.png"];
            return;
        }
    }
    
    if (![imageURL isKindOfClass:[NSURL class]]){
        return;
    }
    
    [self setImageURL:imageURL];
}

- (void)hb_setImageURL:(id)imageURL {
//    [self hb_setImageURL:imageURL placeholderImage:DefaultGrayImage];
//    [self hb_setImageURL:imageURL placeholderImage:[ImageUtil defaultImageWithView:self]];
//    self.backgroundColor = COLOR_IMAGE_GAY_BG;
    UIImage *img = [ImageUtil defaultPlaceholderImageWithView:self];
    [self hb_setImageURL:imageURL placeholderImage:img];
}

- (void)hb_setImageURL:(id)imageURL placeholderColor:(UIColor *)placeholderColor{
    UIImage *img = [UIImage imageWithColor:placeholderColor];
    [self hb_setImageURL:imageURL placeholderImage:img];
}

- (void)hb_setImageURL:(id)imageURL placeholderImage:(UIImage *)placeholderImage {
    if (!imageURL && !placeholderImage) {
        return;
    }
    
    if ([imageURL isKindOfClass:[NSString class]]) {
        if (![StringUtil isEmpty:imageURL]){
            imageURL = [NSURL URLWithString:imageURL];
        } else {
            if (placeholderImage) {
                self.image = placeholderImage;
//                if ([ImageUtil isDefaultPlaceholderImage:placeholderImage]) {
//                    self.contentMode = UIViewContentModeCenter;
//                }
            }
            return;
        }
    }
    
    if (![imageURL isKindOfClass:[NSURL class]] && !placeholderImage){
        return;
    }
    
    [self sd_setImageWithURL:imageURL placeholderImage:placeholderImage];
}

/*
 * 图片加载：圆形头像，带默认头像
 */
- (void)setAvatarImageView:(id)imageURL {
    [self setRoundImageView];
    [self hb_setImageURL:imageURL placeholderImage:[ImageUtil createImageWithColor:GRAY_COLOR_BG]];
}

/*
 * 设置带边环的圆形头像
 * GrayBorder
 */
- (void)setAvatarImageViewWithGrayBorder:(id)imageURL {
    [self setBorderRoundImageView:RGBCOLOR(201, 201, 201)];
    [self hb_setImageURL:imageURL placeholderImage:[ImageUtil createImageWithColor:GRAY_COLOR_BG]];
}

/*
 * 设置带边环的圆形头像
 * WhiteBorder
 */
- (void)setAvatarImageViewWithWhiteBorder:(id)imageURL {
    [self setBorderRoundImageView:[UIColor whiteColor]];
    [self hb_setImageURL:imageURL placeholderImage:[ImageUtil createImageWithColor:GRAY_COLOR_BG]];
}

- (void)setRoundImageView {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.width);
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width / 2.0;
    self.contentMode = UIViewContentModeScaleAspectFill;
}

/**
 *  设置圆角矩形
 */
-(void)setCornerRadius:(CGFloat) cornerRadius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.contentMode = UIViewContentModeScaleAspectFill;
}

/*
 * 设置带边环的圆形视图
 * by hyk
 */
- (void)setBorderRoundImageView:(UIColor *)borderColor {
    [self setRoundImageView];
    self.layer.borderWidth = 1.2;
    self.layer.borderColor = [borderColor CGColor];
}


/*
 * 设置UIImageView的image，并根据image的大小进行适配调整
 * by hyk
 */
- (void)autoLayoutForImage:(UIImage *)image{
    self.image = image;
    self.size = HBSizeMake(image.size.width, image.size.height);
}
/*
 * 设置UIImageView的image，并根据image的大小设置size
 */
- (void)layoutForImageForIpad:(UIImage *)image{
    self.image = image;
    self.size = CGSizeMake(GTFixWidthFlaotIpad(image.size.width), GTFixHeightFlaotIpad(image.size.height) );
}
/*
 * 设置UIImageView的image，并根据image的大小设置size
 * by hyk
 */
- (void)layoutForImage:(UIImage *)image{
    self.image = image;
    //HBSizeMake   zxwo0o
    self.size = CGSizeMake(image.size.width, image.size.height);
}

/*
 * 居中截取图片
 * by Soldier
 */
+ (void)handleImageSize:(UIImageView *)imageView {
    [imageView setContentScaleFactor:[[UIScreen mainScreen] scale]];//适应retina
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
}

@end
