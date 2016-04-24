//
//  UIImageView+NetWorking.h
//  Sexduoduo
//
//  Created by ly1992 on 15/5/30.
//  Copyright (c) 2015年 ly. All rights reserved.
//  网络加载图片

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LYImageViewStatus){
    LYImageViewStatusNone =     0,        //默认
    LYImageViewStatusLoaded =   1,        //完成加载
    LYImageViewStatusLoading =  2,        //加载中...
    LYImageViewStatusFail =     3         //加载失败
};
@interface UIImageView (NetWorking)
/**
 *  imageURL 远程图片地址
 */
@property(copy, nonatomic) id imageURL_SD;
/**
 *  imageModel 远程图片对象
 */
@property(nonatomic) id imageModel;

@property (nonatomic) LYImageViewStatus status;
@property (nonatomic) NSInteger loadedContentModel;

- (void)setImageURLFromCache:(id)imageURL;
- (void)reloadImageURL;
/**
 *  点击未加载完成图片
 */
@property(copy, nonatomic) void(^onTouchTapBlock)(UIImageView *imageView);
/**
 *  点击加载完成图片
 */
@property(copy, nonatomic) void(^onImageLoadedBlock)(UIImageView *imageView);
@end
