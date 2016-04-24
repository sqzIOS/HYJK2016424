//
//  ConstModel.h
//  Sexduoduo
//
//  Created by ly1992 on 15/6/2.
//  Copyright (c) 2015年 ly. All rights reserved.
/*
   model对象 & 后台服务器 交互的常量 设置
 */

#import <Foundation/Foundation.h>
//判断用户是否登录
#define hasUserLogin ([ConstModel isLogined])

/**
 *  缓存有效期
 */
//清除有效期
#define CACHEPERIOD_RESET 0
//15秒有效期
#define CACHEPERIOD_SHORTTIME 15
//10分钟有效期
#define CACHEPERIOD_LONGTIME 10*60
//1小时效期
#define CACHEPERIOD_LONGTIME_HOUR 60*60
//一天有效期
#define CACHEPERIOD_LONGTIME_DAY 60*60*24

@interface ConstModel : NSObject

/**
 判断缓存是否在有效期
 **/
+(BOOL)checkCachePeriod:(NSString *)key;
/**
 设置缓存有效期
 sec为秒
 **/
+(void)setCachePeriod:(NSString *)key sec:(NSUInteger)sec;

@end
