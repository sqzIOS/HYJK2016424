//
//  PhysicalModel.h
//  
//
//  Created by 刘朝涛 on 16/1/5.
//
//

#import <Foundation/Foundation.h>

@interface PhysicalModel : NSObject

@property (nonatomic, copy) NSString *head;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *introduce;    //简介

- (instancetype)initWithDic:(NSDictionary *)dict;

@end
