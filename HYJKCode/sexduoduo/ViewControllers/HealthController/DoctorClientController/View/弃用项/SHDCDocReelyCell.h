//
//  SHDCDocReelyCell.h
//  sexduoduo
//
//  Created by shown on 15/9/21.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDCDocReelyCell : UITableViewCell
#define kSHCopeCellHeight APP_SPACE(155)
//头像
@property (nonatomic,strong)UIImageView *headImageView;
//医师姓名
@property (nonatomic,strong)UILabel *nameLabel;
//职位
@property (nonatomic,strong)UILabel *jobLabel;
//认证
@property (nonatomic,strong)UILabel *autLabel;
//坐标图片
@property (nonatomic,strong)UIImageView *coordinateView;
//地址
@property (nonatomic,strong)UILabel *addlabel;
//分割线
@property (nonatomic,strong)UIImageView *iconImageView;
//内容
@property (nonatomic,strong)UILabel *contentLabel;
//人气图片
@property (nonatomic,strong)UIImageView *moodsImageView;
//人气数量
@property (nonatomic,strong)UILabel *moodsLabel;
//时间
@property (nonatomic,strong)UILabel *timeLabel;
//查看回复
@property (nonatomic,strong)UILabel *seeLabel;
@end
