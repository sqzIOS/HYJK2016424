//
//  MedicalDemandSetInfoController.h
//  sexduoduo
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 dbCode. All rights reserved.
//

#import "MyCenterBaseController.h"

@class MedicalCell;

typedef enum {
    MedicalDemandSetInfoControllerTypeService = 0,
    MedicalDemandSetInfoControllerTypeExamination,
} MedicalDemandSetInfoControllerType;

@interface MedicalDemandSetInfoController : MyCenterBaseController

/**
 * 创建控制器
 */
+ (instancetype)controllerWithType:(MedicalDemandSetInfoControllerType)type medicalCell:(MedicalCell *)cell andModel:(id)model;

@end
