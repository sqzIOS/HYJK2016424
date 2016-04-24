//
//  SHCopeCell.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHCopeModel.h"

#define kSHCopeCellHeight APP_SPACE(110)

@interface SHCopeCell : UITableViewCell
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
/**
 *  数据
 */
- (void)initTableViewCellModel:(SHCopeInfo *)model;

@end
