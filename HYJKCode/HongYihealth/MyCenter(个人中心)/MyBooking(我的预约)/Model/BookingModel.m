//
//  BookingModel.m
//  
//
//  Created by wenzhizheng on 16/1/3.
//
//

#import "BookingModel.h"

@implementation BookingModel

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    BookingModel *model = [[BookingModel alloc] init];
    model.patientInfo = dict[@"shipping_info"];
    NSArray *docInfoArry = dict[@"goods_list"];
    model.doctorInfo = [docInfoArry firstObject];
    model.orderInfo = dict[@"order_info"];
    
    model.patientName = model.patientInfo[@"consignee"];
    model.patientPhone = model.patientInfo[@"tel"];
    
    NSString *str = model.doctorInfo[@"name"];
    NSArray *strArry = [str componentsSeparatedByString:@" "];
    model.doctorName = [strArry firstObject];
    model.doctorDetail = [strArry lastObject];
    model.doctorID = model.doctorInfo[@"goods_id"];
    NSDictionary *photoArry = model.doctorInfo[@"img"];
    model.doctorPhoto = photoArry[@"small"];
    
    model.orderNumber = dict[@"order_sn"];
    model.orderID = dict[@"order_id"];
    NSString *orderStr = dict[@"order_time"];
    NSArray *orderStrArry = [orderStr componentsSeparatedByString:@" "];
    model.treatDay = orderStrArry.firstObject;
    model.treatTime = [orderStrArry objectAtIndex:1];
    
    model.progress = dict[@"order_status_name"];
    
    return model;
}

@end
