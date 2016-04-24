//
//  SHHospitalIntroduceScrollView.m
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHHospitalIntroduceScrollView.h"
#import "SHHealthButton.h"

@interface SHHospitalIntroduceScrollView()
//图片
@property (nonatomic,strong) UIImageView *iconImageView;
//名称
@property (nonatomic,strong) UILabel *nameLabel;
//挂号
@property (nonatomic,strong) UIButton *callBtn;
//介绍
@property (nonatomic,strong) UILabel *introLabel;
//地址
@property (nonatomic,strong) UILabel *addressLabel;

@end

@implementation SHHospitalIntroduceScrollView

- (void)initView
{
    //图片
    self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.iconImageView.frame = CGRectMake(APP_SPACE(15), APP_SPACE(15), SCREEN_WIDTH - APP_SPACE(30), APP_SPACE(140));
    self.iconImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.iconImageView];
    //标题
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.nameLabel.backgroundColor = [UIColor clearColor];
    self.nameLabel.font = Font_Large_bold;
    self.nameLabel.textColor = colorWith02;
    [self addSubview:self.nameLabel]; 
    //介绍
    self.introLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.introLabel.backgroundColor = [UIColor clearColor];
    self.introLabel.font = Font_Middle;
    self.introLabel.textColor = colorWith03;
    [self addSubview:self.introLabel];
    //地址
    self.addressLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.addressLabel.backgroundColor = [UIColor clearColor];
    self.addressLabel.font = Font_Middle;
    self.addressLabel.textColor = colorWith03;
    [self addSubview:self.addressLabel];
    //挂号
    self.callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.callBtn.backgroundColor = colorWith01;
    self.callBtn.frame = CGRectMake(SCREEN_WIDTH - APP_SPACE(80) - APP_SPACE(15), self.iconImageView.bottom + APP_SPACE(10), APP_SPACE(80), APP_SPACE(25));
    [self.callBtn setTitle:NSLocalizedString(@"预约挂号", nil) forState:UIControlStateNormal];
    [self.callBtn setTintColor:colorWithLYWhite];
    self.callBtn.titleLabel.font = Font_Small;
    [self addSubview:self.callBtn];
}

- (void)reloadData
{
    
}

- (void)inintSegmentView
{
    UIImageView *segmentImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    segmentImageView.frame = CGRectMake(0, APP_SPACE(255), SCREEN_WIDTH, APP_SPACE(40));
    segmentImageView.backgroundColor = colorWith05;
    [self addSubview:segmentImageView];
    //专家推荐
    UILabel *commentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    commentLabel.backgroundColor = [UIColor clearColor];
    commentLabel.font = Font_SuperLarge_bold;
    commentLabel.textColor = colorWith02;
    commentLabel.text = NSLocalizedString(@"推荐专家", nil);
    CGSize size = [LYGlobalDefine getTextContent:commentLabel.text withFont:commentLabel.font];
    commentLabel.frame = CGRectMake(APP_SPACE(15), (segmentImageView.height - size.height)/2, size.width, size.height);
    [segmentImageView addSubview:commentLabel];
}
- (void)reloadView
{
    for (int i = 0; i < 0; i++) {
       SHHealthButton *btn =  [self createCustomButton];
        btn.origin = CGPointMake(0, 0);
        btn.tag = i;
        [btn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
}
- (SHHealthButton*) createCustomButton
{
    return nil;
}

#pragma mark ---action 事件
- (void)bt_action_event:(UIButton*)sender
{
//    NSInteger index = sender.tag;
    
    
}


@end
