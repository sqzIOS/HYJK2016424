//
//  SearchModel.h
//  搜索以及纪录保存
//
//  Created by shown on 16/1/8.
//  Copyright (c) 2016年 shown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *headStr;

@property (nonatomic, copy) NSString *nameStr;

@property (nonatomic, copy) NSString *job1Str;

@property (nonatomic, copy) NSString *job2Str;

@property (nonatomic, copy) NSString *hospitalStr;

@property (nonatomic, copy) NSString *deparmentStr;

@property (nonatomic, copy) NSString *introduceStr;

@property (nonatomic, copy) NSString *starNum;  //分数

@property (nonatomic, copy) NSString *isAbout;  // 是否可预约

@end
