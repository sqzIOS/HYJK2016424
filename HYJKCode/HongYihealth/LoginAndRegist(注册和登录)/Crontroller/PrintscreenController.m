//
//  PrintscreenController.m
//  demo
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 paopao. All rights reserved.
//

#import "PrintscreenController.h"
#import <QuartzCore/QuartzCore.h>

@interface PrintscreenController ()

@property (nonatomic,strong) UIImage *image;
@property (nonatomic,weak) UIView *cutView;
@property (nonatomic,weak) UIImageView *imageView;

@property (nonatomic) BOOL isMaxWidth;


@end

@implementation PrintscreenController


+ (instancetype)controllerWithImage:(UIImage *)image;
{
    PrintscreenController *vc = [[PrintscreenController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    vc.image = image;
    
    CGFloat width = vc.view.bounds.size.width;
    // 黑色背景
    UIView *bgView = [[UIView alloc] init];
    bgView.clipsToBounds = YES;
    bgView.backgroundColor = [UIColor blackColor];
    bgView.frame = CGRectMake(0, 0, width, width);
    bgView.center = vc.view.center;
    [vc.view addSubview:bgView];
    
    
    // 图片
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    vc.imageView = imageView;
    CGSize size = image.size;
    
    if (size.width > size.height) {
        vc.isMaxWidth = YES;
        imageView.frame = CGRectMake(0, 0, width, (width / size.width) * size.height);
    } else {
        imageView.frame = CGRectMake(0, 0,  (width / size.height) * size.width, width);
    }
    [bgView addSubview:imageView];
    
    // 截图区域
    UIView *cutView = [[UIView alloc] init];
    cutView.layer.cornerRadius = width / 6;
    vc.cutView = cutView;
    cutView.frame = CGRectMake(width / 3, width / 3, width / 3, width / 3);
    cutView.layer.borderColor = [UIColor whiteColor].CGColor;
    cutView.layer.borderWidth = 1;
    [bgView addSubview:cutView];
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:vc action:@selector(pan:)];
    [bgView addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:vc action:@selector(pinch:)];
    [bgView addGestureRecognizer:pinch];
    
    
    // 确定按钮
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(10 , bgView.frame.size.height + bgView.frame.origin . y + 10, width - 20, 30);
    [btn setBackgroundColor:[UIColor colorWithRed:0.7 green:1 blue:1 alpha:1]];
    btn.layer.cornerRadius = 5;
    btn.clipsToBounds = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [vc.view addSubview:btn];
    [btn addTarget:vc action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    return vc;
}

#pragma mark - 截图
- (void)btnClick
{
    self.imageView.frame = CGRectOffset(self.imageView.frame, -self.cutView.frame.origin.x, -self.cutView.frame.origin.y);
    self.cutView.clipsToBounds = YES;
    self.imageView.alpha = 1;
    self.cutView.layer.borderWidth = 0;
    [self.cutView addSubview:self.imageView];
    
    UIGraphicsBeginImageContextWithOptions(self.cutView.frame.size, YES, [UIScreen mainScreen].scale);
    [self.cutView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    if ([self.delegate respondsToSelector:@selector(printscreenController:cutImage:)]) {
        [self.delegate printscreenController:self cutImage:image];
    }
}

#pragma mark - 手势
- (void)pan:(UIPanGestureRecognizer *)pan
{
    [self adjustFrame];
    CGPoint translation = [pan translationInView:pan.view];
    self.imageView.center = CGPointMake(self.imageView.center.x + translation.x,
                                         self.imageView.center.y + translation.y);
    [pan setTranslation:CGPointZero inView:pan.view];
    
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch
{
    [self adjustFrame];
    if ([self canScaleWithScale:pinch.scale]) {
        return;
    }
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
    
}

#pragma mark - 图片缩放和调整位置处理
- (BOOL)canScaleWithScale:(CGFloat)scale
{
    if (self.isMaxWidth) {
        if (self.imageView.frame.size.width * scale < self.view.frame.size.width / 3 + 20) {
            return YES;
        }
    } else {
        if (self.imageView.frame.size.height * scale < self.view.frame.size.width / 3 + 20) {
            return YES;
        }
    }
    return NO;
}

- (void)adjustFrame
{
    if (self.imageView.frame.size.width > self.cutView.frame.size.width) {
        if (self.imageView.frame.origin.x > self.cutView.frame.origin.x ) {
            CGFloat x = self.imageView.frame.origin.x - self.cutView.frame.origin.x + 1;
            [UIView animateWithDuration:0.3 animations:^{
                self.imageView.frame = CGRectOffset(self.imageView.frame, -x, 0);
            }];
        }
        if (self.imageView.frame.origin.x + self.imageView.frame.size.width < self.cutView.frame.origin.x + self.cutView.frame.size.width ) {
            CGFloat x = self.cutView.frame.origin.x + self.cutView.frame.size.width - self.imageView.frame.origin.x - self.imageView.frame.size.width + 1;
            [UIView animateWithDuration:0.3 animations:^{
                self.imageView.frame = CGRectOffset(self.imageView.frame, x, 0);
            }];
        }
    }
    
    if (self.imageView.frame.size.height > self.cutView.frame.size.height) {
        if (self.imageView.frame.origin.y > self.cutView.frame.origin.y ) {
            CGFloat y = self.imageView.frame.origin.y - self.cutView.frame.origin.y + 1;
            [UIView animateWithDuration:0.3 animations:^{
                self.imageView.frame = CGRectOffset(self.imageView.frame, 0, -y);
            }];
        }
        if (self.imageView.frame.origin.y + self.imageView.frame.size.height < self.cutView.frame.origin.y + self.cutView.frame.size.height ) {
            CGFloat y = self.cutView.frame.origin.y + self.cutView.frame.size.height - self.imageView.frame.origin.y - self.imageView.frame.size.height + 1;
            [UIView animateWithDuration:0.3 animations:^{
                self.imageView.frame = CGRectOffset(self.imageView.frame, 0, y);
            }];
        }
    }
}

@end
