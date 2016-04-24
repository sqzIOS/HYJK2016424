//
//  ServiceModel.m
//  
//
//  Created by apple on 16/1/19.
//
//

#import "ServiceModel.h"

@implementation ServiceModel


+ (instancetype)serviceModelWithDict:(NSDictionary *)dict
{

    ServiceModel *model = [[ServiceModel alloc] init];
    
    model.contact_name = [NSString stringWithFormat:@"%@",dict[@"department"]];
    model.custom_id = [NSString stringWithFormat:@"%@",dict[@"custom_id"]];
    model.custom_time = [NSString stringWithFormat:@"%@",dict[@"custom_time"]];
    model.department = [NSString stringWithFormat:@"%@",dict[@"department"]];
    model.disease_desc = [NSString stringWithFormat:@"%@",dict[@"disease_desc"]];
    model.mobile = [NSString stringWithFormat:@"%@",dict[@"mobile"]];
    model.region = [NSString stringWithFormat:@"%@",dict[@"region"]];
    model.status = [NSString stringWithFormat:@"%@",dict[@"status"]];
    model.update_time = [NSString stringWithFormat:@"%@",dict[@"update_time"]];
    model.user_id = [NSString stringWithFormat:@"%@",dict[@"user_id"]];

    return model;
}

@end
