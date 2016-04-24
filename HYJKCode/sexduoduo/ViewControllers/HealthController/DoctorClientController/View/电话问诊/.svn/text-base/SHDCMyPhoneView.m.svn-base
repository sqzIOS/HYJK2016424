//
//  SHDCMyPhoneView.m
//  sexduoduo
//
//  Created by shown on 15/9/22.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  我的去电时间

#import "SHDCMyPhoneView.h"

@implementation SHDCMyPhoneView

- (id)init
{
    self=[super init];
    if (self) {
        [self initView];
        [self initData];
    }
    return self;
}
- (void)initView
{
    //分割线1
    UIImageView *image1=[[UIImageView alloc]initWithFrame:CGRectZero];
    image1.frame=CGRectMake(APP_SPACE(0), APP_SPACE(0), SCREEN_WIDTH, 1);
    image1.backgroundColor=colorWith05;
    [self addSubview:image1];
    
    UILabel *phLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    phLabel.frame=CGRectMake(APP_SPACE(10), APP_SPACE(5), 120, 30);
    phLabel.text=@"我的去电时间:";
    phLabel.font=Font_Large_bold;
    [self addSubview:phLabel];
    //
    self.myLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.myLabel.frame=CGRectMake(APP_SPACE(30), phLabel.bottom, 180, 30);
    self.myLabel.font=Font_Middle;
    self.myLabel.textColor=colorWith04;
    [self addSubview:self.myLabel];
    //分割线2
    UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectZero];
    image2.frame=CGRectMake(APP_SPACE(0), APP_SPACE(60), SCREEN_WIDTH, 1);
    image2.backgroundColor=colorWith05;
    [self addSubview:image2];
    //时间
    self.dayLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.dayLabel.frame=CGRectMake( SCREEN_WIDTH-APP_SPACE(85), phLabel.bottom, 40, 20);
    self.dayLabel.font=Font_Middle;
    self.dayLabel.textColor=colorWith04;
    [self addSubview:self.dayLabel];
    //按钮
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(self.dayLabel.right+APP_SPACE(10), phLabel.bottom, 20, 20);
    button.backgroundColor=[UIColor redColor];
    [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
}
- (void)initData
{
    self.myLabel.text=@"2015-08-02 19:00～21:00";
    self.dayLabel.text=@"今天";
}
- (void)click
{
    
}

@end
