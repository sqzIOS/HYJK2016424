//
//  SHDCOrderPhoView.m
//  sexduoduo
//
//  Created by shown on 15/9/22.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  预约去电时间

#import "SHDCOrderPhoView.h"

@implementation SHDCOrderPhoView

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
    phLabel.text=@"预约去电时间:";
    phLabel.font=Font_Large_bold;
    [self addSubview:phLabel];
    //
    self.electricLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.electricLabel.frame=CGRectMake(APP_SPACE(30), phLabel.bottom, 180, 30);
    self.electricLabel.font=Font_Middle;
    self.electricLabel.textColor=colorWith04;
    [self addSubview:self.electricLabel];
    //分割线2
    UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectZero];
    image2.frame=CGRectMake(APP_SPACE(0), APP_SPACE(60), SCREEN_WIDTH, 1);
    image2.backgroundColor=colorWith05;
    [self addSubview:image2];
    //修改时间
    self.modifyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.modifyBtn.frame=CGRectMake(SCREEN_WIDTH-APP_SPACE(85), image1.bottom+APP_SPACE(10), 70, 20);
    self.modifyBtn.backgroundColor=[UIColor orangeColor];
    self.modifyBtn.layer.cornerRadius=3.0;
    self.modifyBtn.font=Font_Middle;
    [self.modifyBtn setTitle:@"修改时间" forState:UIControlStateNormal];
    [self.modifyBtn setTitleColor:colorWithLYWhite forState:UIControlStateNormal];
    //[self.modifyBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.modifyBtn];
    
    self.dayLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.dayLabel.frame=CGRectMake( SCREEN_WIDTH-APP_SPACE(85), phLabel.bottom, 40, 20);
    self.dayLabel.font=Font_Middle;
    self.dayLabel.textColor=colorWith04;
    self.dayLabel.text=@"今天";
    [self addSubview:self.dayLabel];
    
}
- (void)initData
{
    self.electricLabel.text=@"2015-08-02 19:00～21:00";
    
}

@end
