//
//  AddressTableViewCell.h
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能: address tableView cell 

#import <UIKit/UIKit.h>
#import "AddressModel.h"

@interface AddressTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *line; //分割线

@property (nonatomic, strong) UILabel *lab; //医院地址

@property (nonatomic, strong) UILabel *addressLab;   //诊所地址

@property (nonatomic, strong) UIImageView *imageView1;

- (void)theDateWith:(AddressModel *)model;

@end
