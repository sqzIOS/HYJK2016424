//
//  shotScreenModel.h
//  截屏
//
//  Created by PYC/Mr.ma on 14-7-7.
//  Copyright (c) 2014年 PYC\MFW. All rights reserved.
//  截屏功能

#import <Foundation/Foundation.h>

@protocol passImageDelegate <NSObject>

-(void)passImage:(UIImage *)image;

@end
@interface ShotScreenModel : NSObject

@property (weak,nonatomic)id<passImageDelegate>delegate;
/**
 *  获取整个屏幕的截图
 */
-(UIImage*)imageFromView:(UIView*)theView andDelegate:(id<passImageDelegate>)delegate;
/**
 *  获取屏幕某一块的截图
 */
-(UIImage*)imageFromView:(UIView *)theView atFrame:(CGRect)r andDelegate:(id<passImageDelegate>)delegate;
@end
