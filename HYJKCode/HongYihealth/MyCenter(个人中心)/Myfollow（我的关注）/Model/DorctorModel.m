//
//  DorctorModel.m
//  
//
//  Created by wenzhizheng on 16/1/24.
//
//

#import "DorctorModel.h"

@implementation DorctorModel

+ (instancetype)dorctorModelWithDict:(NSDictionary *)dict
{
    DorctorModel *model = [[DorctorModel alloc] init];
    NSDictionary *image = dict[@"img"];
    model.icon = image[@"small"];
    
    NSString *string = dict[@"name"];
    NSArray *strArry = [string componentsSeparatedByString:@" "];
    model.name = strArry.firstObject;
    model.detail = strArry.lastObject;
    
    model.ID = dict[@"goods_id"];
    
    return model;
}

@end
