//
//  SHProblemDetailHeaderView.m
//  SexHealth
//
//  Created by ly1992 on 15/7/1.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHProblemDetailHeaderView.h"

@interface SHProblemDetailHeaderView()
//头像
@property (nonatomic,strong) UIImageView *iconImageView;
//性别
@property (nonatomic,strong) UILabel *sexLabel;
//年龄
@property (nonatomic,strong) UILabel *yearLabel;
//时间
@property (nonatomic,strong) UILabel *timeLabel;
//问题描述
@property (nonatomic,strong) UILabel *contentNameLabel;
//问题
@property (nonatomic,strong) UILabel *contentLabel;
//倒三角
@property (nonatomic,strong) UIImageView *sIconImageView;
//分割线
@property (nonatomic,strong) UIImageView *lineImageView;
//分割线
@property (nonatomic,strong) UIImageView *lineSubImageView;

@end

@implementation SHProblemDetailHeaderView

-(id)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}
- (void)initView
{
    //
    self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.iconImageView.frame = CGRectMake(APP_SPACE(10), APP_SPACE(15), APP_SPACE(70), APP_SPACE(70));
    self.iconImageView.backgroundColor = [UIColor clearColor];
    self.iconImageView.layer.borderColor = colorWith05.CGColor;
    self.iconImageView.layer.borderWidth = 2.0f;
    [self addSubview:self.iconImageView];
    //
    self.sexLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.sexLabel.backgroundColor = [UIColor clearColor];
    self.sexLabel.font = Font_Middle_bold;
    self.sexLabel.textColor = colorWith02;
    [self addSubview:self.sexLabel];
    //
    self.yearLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.yearLabel.backgroundColor = [UIColor clearColor];
    self.yearLabel.font = Font_Large_bold;
    self.yearLabel.textColor = colorWith02;
    [self addSubview:self.yearLabel];
    //
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.timeLabel.backgroundColor = [UIColor clearColor];
    self.timeLabel.font = Font_Middle;
    self.timeLabel.textColor = colorWith04;
    [self addSubview:self.timeLabel];
    //
    self.contentNameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.contentNameLabel.backgroundColor = [UIColor clearColor];
    self.contentNameLabel.font = Font_Small;
    self.contentNameLabel.textColor = colorWith03;
    self.contentNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.contentNameLabel];
    //
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.contentLabel.backgroundColor = [UIColor clearColor];
    self.contentLabel.font = Font_Middle;
    self.contentLabel.textColor = colorWith03;
    self.contentLabel.numberOfLines = 0;
    [self addSubview:self.contentLabel];
    //
    self.lineImageView = [UIImageView imageViewLineWithX:0 withY:0 withWidth:SCREEN_WIDTH withHeight:1];
    [self addSubview:self.lineImageView];
    //
    self.sIconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.sIconImageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.sIconImageView];
    //
    self.lineSubImageView = [UIImageView imageViewLineWithX:0 withY:0 withWidth:SCREEN_WIDTH withHeight:1];
    [self addSubview:self.lineSubImageView];
}

- (void)refreshDataWithModel:(SHHistoryInfo*)model
{
    self.iconImageView.image = [UIImage imageNamed:model.iconStr];
    self.sexLabel.text = @"男" ;//model.nameStr;
    CGSize size = [LYGlobalDefine getTextContent:self.sexLabel.text withFont:self.sexLabel.font];
    self.sexLabel.frame = CGRectMake(self.iconImageView.right + APP_SPACE(10), self.iconImageView.top, size.width, size.height);
    self.yearLabel.text = @"99岁" ;//model.nameStr;
    size = [LYGlobalDefine getTextContent:self.yearLabel.text withFont:self.yearLabel.font];
    self.yearLabel.frame = CGRectMake(self.sexLabel.right + APP_SPACE(20), self.iconImageView.top - APP_SPACE(2), size.width, size.height);
    self.timeLabel.text = @"2015-6-16 09:60" ;//model.nameStr;
    size = [LYGlobalDefine getTextContent:self.timeLabel.text withFont:self.timeLabel.font];
    self.timeLabel.frame = CGRectMake(self.sexLabel.left, self.sexLabel.bottom + APP_SPACE(15), size.width, size.height);
    self.contentNameLabel.text = @"问题描述" ;//model.nameStr;
    size = [LYGlobalDefine getTextContent:self.contentNameLabel.text withFont:self.contentNameLabel.font];
    self.contentNameLabel.frame = CGRectMake(self.iconImageView.left, self.iconImageView.bottom + APP_SPACE(5), self.iconImageView.width, size.height);
    //
    self.lineImageView.origin = CGPointMake(0, self.contentNameLabel.bottom + APP_SPACE(10));
    //
    UIImage *image = [UIImage imageNamed:@"health_lineup"];
    self.sIconImageView.image = image;
    self.sIconImageView.frame = CGRectMake(APP_SPACE(30), self.lineImageView.top - image.size.height + 1, image.size.width,image.size.height);
    //
    self.contentLabel.text = @"我知道，我知道你一切的一切，我知道，你就是上帝派来的一头猪，一头🐷，你知道吗。" ;//model.nameStr;
    size = [LYGlobalDefine getTextMultilineContent:self.contentLabel.text withFont:self.contentLabel.font withSize:CGSizeMake(SCREEN_WIDTH - APP_SPACE(40), SCREEN_HEIGHT)];
    self.contentLabel.frame = CGRectMake(APP_SPACE(20), self.lineImageView.bottom + APP_SPACE(5), size.width, size.height);
    self.lineSubImageView.origin = CGPointMake(0, self.contentLabel.bottom + APP_SPACE(10));
    
}

+(CGFloat)getDetailHeaderViewHeightWithModel:(SHHistoryInfo*)model;
{
    UILabel *label = [[UILabel alloc]init];
    label.font = Font_Middle;
    label.numberOfLines = 0;
    label.text = @"我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的。"; //model.
    CGSize size = [LYGlobalDefine getTextMultilineContent:label.text withFont:label.font withSize:CGSizeMake(SCREEN_WIDTH - APP_SPACE(40), SCREEN_HEIGHT)];
    return size.height + APP_SPACE(137);
}

@end
