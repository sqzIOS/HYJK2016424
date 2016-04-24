//
//  SHDCServiceCateView.m
//  sexduoduo
//
//  Created by shown on 15/9/22.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  服务类别

#import "SHDCServiceCateView.h"

@implementation SHDCServiceCateView

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
    phLabel.text=@"服务类别:";
    phLabel.font=Font_Large_bold;
    [self addSubview:phLabel];
    //电话号码
    self.fenLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.fenLabel.frame=CGRectMake(APP_SPACE(30), phLabel.bottom, 180, 30);
    self.fenLabel.font=Font_Middle;
    self.fenLabel.textColor=colorWith04;
    [self addSubview:self.fenLabel];
    //分割线2
    UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectZero];
    image2.frame=CGRectMake(APP_SPACE(0), APP_SPACE(60), SCREEN_WIDTH, 1);
    image2.backgroundColor=colorWith05;
    [self addSubview:image2];
    
}
- (void)initData
{
    self.fenLabel.text=@"5~10分钟: 50元/一次";
    
}

@end
