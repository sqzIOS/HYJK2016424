//
//  OrderNumModel.m
//  
//
//  Created by apple on 16/1/14.
//
//

#import "OrderNumModel.h"

@implementation OrderNumModel

+ (instancetype)orderNumModelWithDict:(NSDictionary *)dict
{
    OrderNumModel *model = [[OrderNumModel alloc] init];
    model.await_pay = dict[@"await_pay"];
    model.await_ship = dict[@"await_ship"];;
    model.finished = dict[@"finished"];;
    model.shipped = dict[@"shipped"];
    
    return model;
}

@end
