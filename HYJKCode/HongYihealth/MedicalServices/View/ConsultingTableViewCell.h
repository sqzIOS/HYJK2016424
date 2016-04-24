//
//  ConsultingTableViewCell.h
//  
//
//  Created by 刘朝涛 on 16/1/1.
//
//  功能: 咨询TableViewCell

#import <UIKit/UIKit.h>
#import "ConsultingModel.h"

@interface ConsultingTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImageView;   //头像

@property (nonatomic, strong) UILabel *nameLab; //姓名

@property (nonatomic, strong) UILabel *jobLab;

@property (nonatomic, strong) UILabel *deparmentLab;    //科室

@property (nonatomic, strong) UILabel *hospitalLab; //医院名称

@property (nonatomic, strong) UILabel *priceLab;    // 实际价格

@property (nonatomic, strong) UILabel *market_priceLab; // 优惠前价格

- (void)theDataWith:(ConsultingModel *)model;

@end
