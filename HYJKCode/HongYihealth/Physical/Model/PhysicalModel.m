//
//  PhysicalModel.m
//  
//
//  Created by 刘朝涛 on 16/1/5.
//
//

#import "PhysicalModel.h"

@implementation PhysicalModel

- (instancetype)initWithDic:(NSDictionary *)dict {
    if (self = [self init]) {
        
        id value = nil;
        
        value = dict[@"head"];
        if (value)
            _head = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"name"];
        if (value)
            _name = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"content"];
        if (value)
            _content = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"address"];
        if (value)
            _address = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"introduce"];
        if (value)
            _introduce = [NSString stringWithFormat:@"%@",value];
        
    }
    return self;
}

@end
