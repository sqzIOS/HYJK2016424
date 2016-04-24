//
//  SHConsulting.h
//  sexduoduo
//
//  Created by shown on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHConsulting : NSObject
@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *casesId;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) long long createDate;
@property (nonatomic, copy) NSString *headImg;
@property (nonatomic, copy) NSString *sex;
+ (instancetype)consultingWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
