//
//  DoctorDetailsTableViewCell.h
//  
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能:医师详情tableViewCell

#import <UIKit/UIKit.h>
#import "UserEvaluateModel.h"

@interface DoctorDetailsTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nickNameLab;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UILabel *diseaseLab;  //疾病

@property (nonatomic, strong) UILabel *gradeLab1;  //分数1

@property (nonatomic, strong) UILabel *gradeLab2;  //分数2

@property (nonatomic, strong) UILabel *gradeLab3;  //分数3

@property (nonatomic, strong) UILabel *contentLab;  //内容

@property (nonatomic, strong) UILabel *lab1;

@property (nonatomic, strong) UILabel *lab2;

@property (nonatomic, strong) UILabel *lab3;

@property (nonatomic, strong) UILabel *lab4;

@property (nonatomic, strong) UIView *line;

- (void)theDataWithModel:(UserEvaluateModel *)model;

@end
