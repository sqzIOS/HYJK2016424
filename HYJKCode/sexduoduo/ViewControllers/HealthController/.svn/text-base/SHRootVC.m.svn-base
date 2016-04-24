//
//  SHRootVC.m
//  sexduoduo
//
//  Created by showm on 15/9/28.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHRootVC.h"
#define TopViewHeight 64
@implementation SHRootVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTopNavView];
    
}

#pragma mark ---UI
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    UIView *topImgv = [[UIView alloc]init];
    topImgv.frame = CGRectMake(0, 0, k_screenWidth,64);
    topImgv.backgroundColor = NAV_COLOR;
    [self.view addSubview:topImgv];
    
    self.topTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, k_screenWidth-120, 38*2/3.)];
    self.topTitleLab.backgroundColor = [UIColor clearColor];
    self.topTitleLab.textAlignment = NSTextAlignmentCenter;
    self.topTitleLab.textColor = colorWith01;
    self.topTitleLab.font = [UIFont systemFontOfSize:20.0];
    [topImgv addSubview:self.topTitleLab];
    self.topTitleLab.hidden=YES;

    
//        UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height - 10, frame.size.width, 10)];
//        [lineImg setImage:[UIImage imageNamed:@"topLine.png"]];
//        lineImg.backgroundColor = [UIColor clearColor];
//        [topImgv addSubview:lineImg];
    
    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,  TopViewHeight - 0.5, k_screenWidth, 0.5)];
    lineImg.backgroundColor = UICOLOR_RGB(200, 200, 200);
    [topImgv addSubview:lineImg];
    
    
    //
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [self.leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(shGoBack:) forControlEvents:UIControlEventTouchUpInside];
    self.leftBtn.tag = 1000;
    [self.view addSubview:self.leftBtn];
    
    
    
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = CGRectMake(278, 25 , 32, 32);
    [self.rightBtn setImage:[UIImage imageNamed:@"health_searchicon"] forState:UIControlStateNormal];
    self.rightBtn.tag = 1001;
    self.rightBtn.hidden = YES;
    [self.view addSubview:self.rightBtn];
    
    
    
}


-(void)setTitleStr:(NSString *)str
{
    self.topTitleLab.text=str;
    self.topTitleLab.hidden=NO;
}


-(void)shGoBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
