//
//  NSDate+CTCategory.h
//  LCT_Calendar
//
//  Created by shown on 16/1/7.
//  Copyright (c) 2016年 shown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CTCategory)

/**
 *  首先需要知道这个月有多少天
 *
 *  @return
 */
- (NSInteger)numberofDayInCurrentMonth;

/**
 *  确定这个月的第一天是星期几。这样就能知道给定月份的第一周有几天
 *
 *  @return
 */
- (NSDate *)firstDayOfCurrentMoth;

/**
 *  获取是星期几
 *
 *  @return
 */
- (NSInteger)weeklyOrdinality;

/**
 *  获取今天是本月的第几天
 *
 *  @return
 */
- (NSInteger)dayOrdinality;

/**
 *  获取当前月份有几个星期
 *
 *  @return
 */
- (NSUInteger)numberOfWeeksInCurrentMonth;

/**
 *  获取上一个月
 *
 *  @return
 */
- (NSDate *)lastMonth:(NSInteger)month;

/**
 *  获取当前年份
 *
 *  @return
 */
- (NSInteger)currentYear;

/**
 *  获取当前月份
 *
 *  @return
 */
- (NSInteger)currentMonth;

/**
 *  获取当前天
 *
 *  @return
 */
- (NSInteger)currentDay;

@end
