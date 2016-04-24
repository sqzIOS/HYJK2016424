//
//  PrintscreenController.h
//  demo
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 paopao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PrintscreenController;

@protocol PrintscreenControllerDelegate <NSObject>

/**
 * 成功截图通知代理
 */
- (void)printscreenController:(PrintscreenController *)controller cutImage:(UIImage *)image;

@end

@interface PrintscreenController : UIViewController

/**
 * 代理
 */
@property (nonatomic,weak) id<PrintscreenControllerDelegate> delegate;

/**
 * 创建控制器
 */
+ (instancetype)controllerWithImage:(UIImage *)image;

@end
