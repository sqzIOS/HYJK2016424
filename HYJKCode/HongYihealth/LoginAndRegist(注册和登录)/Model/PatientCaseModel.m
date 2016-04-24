//
//  PatientCaseModel.m
//  
//
//  Created by apple on 16/1/19.
//
//

#import "PatientCaseModel.h"

@implementation PatientCaseModel

+ (instancetype)patientCaseModelWithDict:(NSDictionary *)dict
{
    PatientCaseModel *model = [[PatientCaseModel alloc] init];
    
    model.case_id = [NSString stringWithFormat:@"%@",dict[@"case_id"]];
    model.age = [NSString stringWithFormat:@"%@",dict[@"age"]];
    model.blood_type = [NSString stringWithFormat:@"%@",dict[@"blood_type"]];
    model.bmi = [NSString stringWithFormat:@"%@",dict[@"bmi"]];
    model.disease_desc = [NSString stringWithFormat:@"%@",dict[@"disease_desc"]];
    model.disease_history = [NSString stringWithFormat:@"%@",dict[@"disease_history"]];
    model.height = [NSString stringWithFormat:@"%@",dict[@"height"]];
    model.last_time = [NSString stringWithFormat:@"%@",dict[@"last_time"]];
    model.rhblood_type = [NSString stringWithFormat:@"%@",dict[@"rhblood_type"]];
    model.weight = [NSString stringWithFormat:@"%@",dict[@"weight"]];
    
    model.isSelected = [NSString stringWithFormat:@"%@",dict[@"default_case"]].boolValue;
    
    return model;
}

@end

