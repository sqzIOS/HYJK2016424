//
//  SHHistoryCell.h
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//  服务历史

#import <UIKit/UIKit.h>
#import "SHMydoctorModel.h"

#define kHistoryCellHeight APP_SPACE(140)

@interface SHHistoryCell : UITableViewCell
//头像
@property (nonatomic,strong) UIImageView *iconImageView;
//用户名
@property (nonatomic,strong) UILabel *nameLabel;
//性别背景
@property (nonatomic,strong) UIImageView *bgImageView;
//性别
@property (nonatomic,strong) UILabel *sexLabel;
//年龄
@property (nonatomic,strong) UILabel *yearLabel;
//提问内容
@property (nonatomic,strong) UILabel *contentLabel;
//提问时间
@property (nonatomic,strong) UILabel *timeLabel;
//医师
@property (nonatomic,strong) UIButton *doctorBtn;
//分割线
@property (nonatomic,strong) UIImageView *lineImageView;
/**
 *  数据
 */
- (void)initTableCellModel:(SHHistoryInfo *)model;
/**
 *  高
 */
+(CGFloat)getTableViewCellHeight;
@end
