//
//  StartPictureView.m
//  sexduoduo
//
//  Created by Showm on 14-11-10.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//

#import "StartPictureView.h"

@implementation StartPictureView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor whiteColor];
        [self initGuideView];
        if (IOS7_OR_LATER) {
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
        }else
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    }
    return self;
}

-(void)initGuideView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (SCREEN_HEIGHT==480) {
        imageView.image = [UIImage imageNamed:@"startPic960.png"];
    }else
        imageView.image = [UIImage imageNamed:@"startPic1136.png"];
    [self addSubview:imageView];
    
    [self performSelector:@selector(goToApp:) withObject:nil afterDelay:2];
}


-(void)goToApp:(id)sender
{
    
    
    [UIView animateWithDuration:1.5 animations:^{
        self.alpha=0;
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
