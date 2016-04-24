//
//  NoNetworkView.m
//  sexduoduo
//
//  Created by dsz on 15-4-14.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "NoNetworkView.h"

@implementation NoNetworkView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self formartView];
    }
    return self;
}

-(void)formartView
{
    self.backgroundColor = WHITE_COLOR;
    self.noNetView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    [self addSubview:self.noNetView];
    
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 221)];
    imageView.centerX=SCREEN_WIDTH/2.;
    imageView.image = UIImageByName(@"noNet.png");
    [self.noNetView addSubview:imageView];
    
    
    UIButton *btn=[UIButton buttonWithType:0];
    [btn setTitle:@"重新加载" forState:UIControlStateNormal];
    [btn.titleLabel setFont:fontWithSize(18)];
    [btn.titleLabel setTextColor:WHITE_COLOR];
    [btn setFrame:CGRectMake(0, imageView.bottom + 5, 95, 44)];
    btn.centerX = self.width/2.;
    btn.backgroundColor = NAV_MoreBg_COLOR;
    [btn addTarget:self action:@selector(refreshDataAgain:) forControlEvents:UIControlEventTouchUpInside];
    [self.noNetView addSubview:btn];
    
    self.indicator =[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.indicator.centerX = SCREEN_WIDTH/2.;
    self.indicator.centerY = SCREEN_HEIGHT/2.-100;
    [self.indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];//设置进度轮显示类型
    [self addSubview:self.indicator];
    
}

-(id)initWithDelegate:(id)delegate
{
    if (self=[super init]) {
        self.delegate=delegate;
        
        self.backgroundColor=[UIColor whiteColor];
        
    }
    return self;
}

- (IBAction)refreshDataAgain:(id)sender
{
    NSLog(@"重新加载");
    
    if ([self.delegate respondsToSelector:@selector(noNetworkViewRefreshBtnClick)]) {
        [self.delegate noNetworkViewRefreshBtnClick];
    }
    
}



@end
