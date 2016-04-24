//
//  SHDiagnoseCell.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHDiagnoseModel.h"
#import "SHHealthButton.h"

#define kDiagnoseCellHeight APP_SPACE(90)

@interface SHDiagnoseCell : UITableViewCell
//图标
@property (nonatomic,strong) UIImageView *iconImageView;
//分割线
@property (nonatomic,strong) UIImageView *lineImageView;
//标题
@property (nonatomic,strong) UILabel *titleLabel;
//内容
@property (nonatomic,strong) UILabel *contentLabel;
//时间
@property (nonatomic,strong) UILabel *timeLabel;
//性别标签
@property (nonatomic,strong) SHHealthButton *sexBtn;
/**
 *  数据
 */
- (void)initTableViewCellModel:(SHDiagnoseModel *)model;
@end
