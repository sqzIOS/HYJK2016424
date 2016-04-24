//
//  SearchModel.m
//  搜索以及纪录保存
//
//  Created by shown on 16/1/8.
//  Copyright (c) 2016年 shown. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.headStr forKey:@"headStr"];
    [aCoder encodeObject:self.nameStr forKey:@"nameStr"];
    [aCoder encodeObject:self.job1Str forKey:@"job1Str"];
    [aCoder encodeObject:self.job2Str forKey:@"job2Str"];
    [aCoder encodeObject:self.hospitalStr forKey:@"hospitalStr"];
    [aCoder encodeObject:self.deparmentStr forKey:@"deparmentStr"];
    [aCoder encodeObject:self.introduceStr forKey:@"introduceStr"];
    [aCoder encodeObject:self.starNum forKey:@"starNum"];
    [aCoder encodeObject:self.isAbout forKey:@"isAbout"];
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.headStr = [aDecoder decodeObjectForKey:@"headStr"];
        self.nameStr = [aDecoder decodeObjectForKey:@"nameStr"];
        self.job1Str = [aDecoder decodeObjectForKey:@"job1Str"];
        self.job2Str = [aDecoder decodeObjectForKey:@"job2Str"];
        self.hospitalStr = [aDecoder decodeObjectForKey:@"hospitalStr"];
        self.deparmentStr = [aDecoder decodeObjectForKey:@"deparmentStr"];
        self.introduceStr = [aDecoder decodeObjectForKey:@"introduceStr"];
        self.starNum = [aDecoder decodeObjectForKey:@"starNum"];
        self.isAbout = [aDecoder decodeObjectForKey:@"isAbout"];
    }
    return self;
}

@end
