//
//  ExaminationModel.m
//  
//
//  Created by apple on 16/1/27.
//
//

#import "ExaminationModel.h"

@implementation ExaminationModel


+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    ExaminationModel *model = [[ExaminationModel alloc] init];
    
    model.custom_id = dict[@"custom_id"];
    model.user_id = dict[@"user_id"];
    model.id_card = dict[@"id_card"];
    model.medical_institutions = dict[@"medical_institutions"];
    model.mobile = dict[@"mobile"];
    model.contact_name = dict[@"contact_name"];
    model.region = dict[@"region"];
    model.disease_desc = dict[@"disease_desc"];
    model.custom_time = dict[@"custom_time"];
    model.update_time = dict[@"update_time"];
    model.status = dict[@"status"];
    
    return model;
}

@end
