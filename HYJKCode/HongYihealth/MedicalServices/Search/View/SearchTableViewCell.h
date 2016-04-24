//
//  SearchTableViewCell.h
//  搜索以及纪录保存
//
//  Created by shown on 16/1/8.
//  Copyright (c) 2016年 shown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConsultingModel.h"

@interface SearchTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImageView;

@property (nonatomic, strong) UILabel *nameLab;

//@property (nonatomic, strong) UILabel *jobLab;  //职称：主任医师 加 教授

@property (nonatomic, strong) UILabel *hospitalNameLab; //医院名称 + 科室

@property (nonatomic, strong) UILabel *introduceLab;    // 价格

@property (nonatomic, strong) UILabel *market_priceLab; // 原价

@property (nonatomic, strong) UIView *starView; //星星图

@property (nonatomic, strong) UIImageView *icon;    //可否预约

@property (nonatomic, strong) UIView *line;

- (void)theDataWithModel:(ConsultingModel *)model;

@end
