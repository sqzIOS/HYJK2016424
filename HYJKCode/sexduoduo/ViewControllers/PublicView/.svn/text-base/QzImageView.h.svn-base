//
//  QzImageView.h
//  sexduoduo
//
//  Created by showm on 15/6/16.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  自定义下载图片的ImageView  使用SDWebImage的第三方

#import <UIKit/UIKit.h>

@interface QzImageView : UIImageView
{
    UIActivityIndicatorView* _waittingView;
}

- (void)qzSetImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
- (void)qzSetImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;


-(void)stopWaitting;
- (void)qzCancelCurrentImageLoad;//取消下载
@end
