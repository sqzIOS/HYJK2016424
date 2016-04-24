//
//  NSDate+Extend.h
//  Sexduoduo
//
//  Created by ly1992 on 15/6/2.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extend)
+(NSCalendar*)shareCNCalendar;
// 获取年
+ (NSInteger)getYear:(NSDate *)date;
// 获取月
+ (NSInteger)getMonths:(NSDate *)date;
// 获取日
+ (NSInteger)getDay:(NSDate *)date;
// 获取某天的string类型，格式如：2013-03
+ (NSString *)dateStringYMFromDate:(NSDate *)date;
// 获取某天的string类型，格式如：2013-3-22
+ (NSString *)dateStringYMDFromDate:(NSDate *)date;

// 时间字符串返回时间NSDate 2013-3-22
+ (NSDate *)dateFromYMDString:(NSString *)dateStr;


/**
 *  比较两个时间的大小
 *
 *  @param oneDay     A
 *  @param anotherDay B
 *
 *  @return （1 == A > B ）(-1 == A < B) (0 == A == B)
 */
+(NSInteger)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

/**
 *  返回时间 间距
 */
//返回NSTimeInterval数值(精确到秒,10位长度)
-(NSUInteger)getDateTINSUIntegerValueEx;
//返回NSTimeInterval字符串(精确到秒,10位长度)
-(NSString*)getDateTIStringEx;

@end
