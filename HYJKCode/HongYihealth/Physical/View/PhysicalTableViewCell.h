//
//  PhysicalTableViewCell.h
//  
//
//  Created by 刘朝涛 on 16/1/5.
//
//  功能：体检tableView cell

#import <UIKit/UIKit.h>
#import "ConsultingModel.h"

@interface PhysicalTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImageView;

@property (nonatomic, strong) UILabel *nameLab;

@property (nonatomic, strong) UILabel *contentLab;

@property (nonatomic, strong) UILabel *addressLab;

- (void)theDataWithModel:(ConsultingModel *)model;

@end
