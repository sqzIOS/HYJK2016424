//
//  Desease.m
//  
//
//  Created by wenzhizheng on 16/1/10.
//
//



#import "Desease.h"

@implementation Desease


+ (instancetype)deseaseWithDict:(NSDictionary *)dict
{
    Desease *desease = [[Desease alloc] init];
    
    desease.category_id = dict[@"id"];
    desease.name = dict[@"name"];
    desease.children = dict[@"children"];
    desease.category_img = dict[@"category_img"];
    
    return desease;
}

@end
