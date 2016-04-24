//
//  PhysicalDetailsVC.h
//  
//
//  Created by 刘朝涛 on 16/1/5.
//
//  功能：体检详情

#import <UIKit/UIKit.h>
#import "ConsultingModel.h"
#import "DoctorDetailsTableView.h"
#import "DoctorDetailsTableViewHeadView.h"

@interface PhysicalDetailsVC : MyCenterBaseController

@property (nonatomic, strong) ConsultingModel *model;

@end
