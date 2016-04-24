//
//  SHDCOrderAnswerView.m
//  sexduoduo
//
//  Created by shown on 15/9/22.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  预约接听号码

#import "SHDCOrderAnswerView.h"

@implementation SHDCOrderAnswerView

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
    phLabel.text=@"预约接听号码:";
    phLabel.font=Font_Large_bold;
    [self addSubview:phLabel];
    //电话号码
    self.phoneLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.phoneLabel.frame=CGRectMake(APP_SPACE(30), phLabel.bottom, 180, 30);
    self.phoneLabel.font=Font_Middle;
    self.phoneLabel.textColor=colorWith04;
    [self addSubview:self.phoneLabel];
    //分割线2
    UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectZero];
    image2.frame=CGRectMake(APP_SPACE(0), APP_SPACE(60), SCREEN_WIDTH, 1);
    image2.backgroundColor=colorWith05;
    [self addSubview:image2];
    
}
- (void)initData
{
    self.phoneLabel.text=@"15860703573";
    
}
@end
