//
//  AdressModel.m
//  
//
//  Created by apple on 16/1/20.
//
//

#import "AddressModel.h"

@implementation AddressModel

+ (instancetype)addressModelWithDict:(NSDictionary *)dict
{
    AddressModel *model = [[AddressModel alloc] init];
    
    model.addressID = dict[@"id"];
    model.consignee = dict[@"consignee"];
    model.email = dict[@"email"];
    model.country = dict[@"country_name"];
    model.province = dict[@"province_name"];
    model.city = dict[@"city_name"];
    model.district = dict[@"district_name"];
    model.address = dict[@"address"];
    model.zipcode = dict[@"zipcode"];
    model.tel = dict[@"tel"];
    model.mobile = dict[@"mobile"];
    model.sign_building = dict[@"sign_building"];
    model.best_time = dict[@"best_time"];
    model.default_address = dict[@"default_address"];
    
  
    return model;
}

@end


