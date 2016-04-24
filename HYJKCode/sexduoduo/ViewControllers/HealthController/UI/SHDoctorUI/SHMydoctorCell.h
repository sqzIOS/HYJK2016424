//
//  SHMydoctorCell.h
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//  医师列表 Cell

#import <UIKit/UIKit.h>
#import "SHMydoctorModel.h"
#import "SHPsychologyModel.h"

#define kNearbyHospitalCellHeight APP_SPACE(150)
@interface SHMydoctorCell : UITableViewCell
//头像
@property (nonatomic,strong) UIImageView *iconImageView;
//距离
@property (nonatomic,strong) UILabel *selectLabel;
//分割线
@property (nonatomic,strong) UIImageView *lineImageView;
//分割线
@property (nonatomic,strong) UIImageView *lineSubImageView;
//用户名
@property (nonatomic,strong) UILabel *nameLabel;
//职位
@property (nonatomic,strong) UILabel *postLabel;
//所在医院
@property (nonatomic,strong) UILabel *hospitalLabel;
//内容
@property (nonatomic,strong) UILabel *contentLabel;
//选TA
@property (nonatomic,strong) UIButton *callBtn;
//认证
@property (nonatomic,strong) UIImageView *authIconImageView;
//评分
@property (nonatomic,strong) UIImageView *loveIconImageView;
@property (nonatomic,strong) UILabel *scoreLabel;
/**
 *  数据
 */
- (void)initDoctorTableCellModel:(SHMydoctorInfo *)model;
/**
 *  高
 */
+(CGFloat)getDoctorTableViewCellModel:(SHMydoctorInfo *)model;

/**
 *  心理咨询 数据
 */
- (void)initPsyTableCellModel:(SHPsychologyInfo *)model;
/**
 *  心理咨询 高
 */
+(CGFloat)getPsyTableViewCellModel:(SHPsychologyInfo *)model;

@end
