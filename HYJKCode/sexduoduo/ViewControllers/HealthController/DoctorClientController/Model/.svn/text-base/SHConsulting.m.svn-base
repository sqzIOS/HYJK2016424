//
//  SHConsulting.m
//  sexduoduo
//
//  Created by shown on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHConsulting.h"

@implementation SHConsulting
+ (instancetype)consultingWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict{
    if ((self = [super init]) && dict) {
        id value;
        value = dict[@"age"];
        if(value) _age = [value intValue];
        
        value = dict[@"casesId"];
        if(value) _casesId = value;
        
        value = dict[@"content"];
        if(value) _content = value;
        
        value = dict[@"createDate"];
        if(value) _createDate = [value longLongValue];
        
        value = dict[@"headImg"];
        if(value) _headImg = value;
        
        value = dict[@"sex"];
        if(value) _sex = value;
    }
    return self;
}
@end
