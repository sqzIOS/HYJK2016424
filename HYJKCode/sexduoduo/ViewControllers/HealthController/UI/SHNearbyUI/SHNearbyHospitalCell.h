//
//  SHNearbyHospitalCell.h
//  SexHealth
//
//  Created by ly1992 on 15/6/30.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHNearbyHospitalModel.h"

#define kNearbyHospitalCellHeight APP_SPACE(135)

@interface SHNearbyHospitalCell : UITableViewCell
//图标
@property (nonatomic,strong) UIImageView *iconImageView;
//分割线
@property (nonatomic,strong) UIImageView *lineImageView;
//标题
@property (nonatomic,strong) UILabel *titleLabel;
//地址
@property (nonatomic,strong) UILabel *addLabel;
//内容
@property (nonatomic,strong) UILabel *contentLabel;
//预约挂号
@property (nonatomic,strong) UIButton *orderBtn;

/**
 *  数据
 */
- (void)initTableViewCellModel:(SHNearbyHospitalInfo *)model;

@end
