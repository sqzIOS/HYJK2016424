//
//  CHKeychain.h
//  sexduoduo
//
//  Created by sqz on 14-11-4.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//  保存到本地钥匙串 即使删除应用重新安装依然可以读取出来

#import <Foundation/Foundation.h>
#import <Security/Security.h>


@interface CHKeychain : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;


@end
