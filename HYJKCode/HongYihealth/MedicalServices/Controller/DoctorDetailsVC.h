//
//  DoctorDetailsVC.h
//  
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能：医师详情

#import <UIKit/UIKit.h>
#import "ConsultingModel.h"
#import "DoctorDetailsTableView.h"
#import "DoctorDetailsTableViewHeadView.h"
#import "MyCenterBaseController.h"


@interface DoctorDetailsVC : MyCenterBaseController

@property (nonatomic, strong) ConsultingModel *model;

@property (nonatomic, assign) DoctorDetailsVCType type;

- (instancetype)initWithType:(DoctorDetailsVCType)type;

@end
