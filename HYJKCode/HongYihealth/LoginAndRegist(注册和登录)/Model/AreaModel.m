//
//  AreaModel.m
//  
//
//  Created by apple on 16/1/22.
//
//

#import "AreaModel.h"

@implementation AreaModel

+ (instancetype)areaModelWithDict:(NSDictionary *)dict
{
    AreaModel *model = [[AreaModel alloc] init];
    
    model.areaID = dict[@"id"];
    model.name = dict[@"name"];
    
    return model;
}

@end
