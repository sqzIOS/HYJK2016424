//
//  SHDCPictureTextCell.h
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDCPictureTextCell : UITableViewCell

@property (nonatomic,strong)UIImageView *headImageView;

@property (nonatomic,strong)UIImageView *sexImageView;

@property (nonatomic,strong)UILabel *ageLabel;

@property (nonatomic,strong)UILabel *contentLabel;

@property (nonatomic,strong)UILabel *timeLabel;
//抢答
@property (nonatomic,strong)UILabel *answerlabel;
//已完成
@property (nonatomic,strong)UILabel *completelabel;


@end
