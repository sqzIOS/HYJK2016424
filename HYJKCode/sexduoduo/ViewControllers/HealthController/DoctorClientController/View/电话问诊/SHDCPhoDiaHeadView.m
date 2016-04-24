//
//  SHDCPhoDiaHeadView.m
//  sexduoduo
//
//  Created by shown on 15/9/22.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  表头

#import "SHDCPhoDiaHeadView.h"

@implementation SHDCPhoDiaHeadView

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
    //头像
    self.headImageView=[[UIImageView alloc]initWithFrame:CGRectZero];
    self.headImageView.frame=CGRectMake(APP_SPACE(10), APP_SPACE(10), 70, 70);
    self.headImageView.backgroundColor=colorWith07;
    self.headImageView.layer.cornerRadius=35;
    self.headImageView.layer.masksToBounds=YES;
    [self addSubview:self.headImageView];
    //性别
    self.sexImageView=[[UIImageView alloc]initWithFrame:CGRectZero];
    self.sexImageView.frame=CGRectMake(self.headImageView.right+APP_SPACE(10), APP_SPACE(10), 30, 30);
    self.sexImageView.backgroundColor=[UIColor redColor];
    [self addSubview:self.sexImageView];
    //年龄
    self.ageLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.ageLabel.frame=CGRectMake(self.sexImageView.right+APP_SPACE(5), APP_SPACE(10), 50, 30);
    self.ageLabel.font=Font_Large_bold;
    self.ageLabel.textColor=colorWith02;
    [self addSubview:self.ageLabel];
    //时间
    self.timeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.timeLabel.frame=CGRectMake(self.headImageView.right+APP_SPACE(10), self.sexImageView.bottom+APP_SPACE(10), 90, 16);
    self.timeLabel.font=Font_Small;
    self.timeLabel.textColor=colorWith04;
    [self addSubview:self.timeLabel];
    //分割线
    UIImageView *image1=[[UIImageView alloc]initWithFrame:CGRectZero];
    image1.frame=CGRectMake(APP_SPACE(0), self.headImageView.bottom+APP_SPACE(10), SCREEN_WIDTH, 1);
    image1.backgroundColor=colorWith05;
    [self addSubview:image1];
}
- (void)initData
{
    self.headImageView.image=[UIImage imageNamed:@""];
    self.ageLabel.text=@"25岁";
    self.timeLabel.text=@"06-03-21:57";
}
@end
