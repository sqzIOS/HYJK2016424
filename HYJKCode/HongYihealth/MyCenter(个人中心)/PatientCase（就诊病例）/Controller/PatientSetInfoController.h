//
//  PatientSetInfoController.h
//  
//
//  Created by wenzhizheng on 16/1/9.
//
//

#import "MyCenterBaseController.h"

@class MedicalCell,PatientCaseModel;
@interface PatientSetInfoController : MyCenterBaseController

+ (instancetype)patientSetInfoControllerWithCell:(MedicalCell *)cell andDataModel:(PatientCaseModel *)model;


@end
