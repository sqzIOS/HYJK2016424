//
//  KWPopoverView.m
//  KWPopoverViewDemo
//
//  Created by zzl on 14-4-10.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "KWPopoverView.h"

@interface KWPopoverView()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) CGRect boxFrame;

@end
@implementation KWPopoverView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (void)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withContentView:(UIView *)cView andRejectTouchBackOrNO:(BOOL)rejectBack
{
    KWPopoverView *popView = [[KWPopoverView alloc] initWithFrame:CGRectZero];
    [popView showPopoverAtPoint:point inView:view withContentView:cView];
    popView.isRejectTouchBack=rejectBack;
    
    //注册通知 用于关闭alertView 此为类方法 Observer要使用对象popView
    [[NSNotificationCenter defaultCenter]addObserver:popView selector:@selector(dismiss) name:NOTIFICATION_AlertOVER object:nil];
}

- (void)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withContentView:(UIView *)cView
{
    self.boxFrame = cView.frame;
    self.contentView = cView;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    UIView *topView = [[window subviews] objectAtIndex:0];
    
    CGPoint topPoint = [topView convertPoint:point fromView:view];
    CGRect topViewBounds = topView.bounds;
    _contentView.frame = _boxFrame;
    _contentView.hidden = NO;
    [self addSubview:_contentView];
    
    self.layer.anchorPoint = CGPointMake(topPoint.x / topViewBounds.size.width, topPoint.y / topViewBounds.size.height);
    self.frame = topViewBounds;
    [self setNeedsDisplay];
    
    [topView addSubview:self];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
    
    self.alpha = 0.f;
    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1.f;
        self.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}
#define kGradientTopColor [UIColor colorWithWhite:1.f alpha:0.95]
#define kGradientBottomColor [UIColor colorWithWhite:0.98f alpha:0.95]
- (void)drawRect:(CGRect)rect
{
        
}

- (void)tapped:(UITapGestureRecognizer *)tap
{
    //某点包含在某个范围
    if ( !CGRectContainsPoint(_contentView.frame, [tap locationInView:self])  && !self.isRejectTouchBack ) {
        NSLog(@"不包含在_contentView");
        [self dismiss];
    }
   
}

- (void)dismiss {
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.1f;
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
    
    
    //撤销注册的通知
    [[NSNotificationCenter defaultCenter]removeObserver:self name:NOTIFICATION_AlertOVER object:nil];
    
    //隐藏该视图
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_AlertBGCanCanCel object:nil];
}

@end
