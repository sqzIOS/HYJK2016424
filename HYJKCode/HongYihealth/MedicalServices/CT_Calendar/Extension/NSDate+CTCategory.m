//
//  NSDate+CTCategory.m
//  LCT_Calendar
//
//  Created by shown on 16/1/7.
//  Copyright (c) 2016年 shown. All rights reserved.
//

#import "NSDate+CTCategory.h"

@implementation NSDate (CTCategory)

/**
 *  首先需要知道这个月有多少天
 *
 *  @return
 */
- (NSInteger)numberofDayInCurrentMonth {
    
    // 频繁调用 [NSCalendar currentCalendar] 可能存在性能问题
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}
/**
 *  确定这个月的第一天是星期几。这样就能知道给定月份的第一周有几天
 *
 *  @return
 */
- (NSDate *)firstDayOfCurrentMoth {
   
    NSDate *startDate = nil;
    BOOL ok = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitMonth startDate:&startDate interval:NULL forDate:self];
    if (!ok) {
        
    }
    return startDate;
}
/**
 *  获取是星期几
 *
 *  @return
 */
- (NSInteger)weeklyOrdinality {
    
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:self];
}
/**
 *  获取今天是本月的第几天
 *
 *  @return
 */
- (NSInteger)dayOrdinality {
    
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
}
/**
 *  获取当前月份有几个星期
 *
 *  @return
 */
- (NSUInteger)numberOfWeeksInCurrentMonth
{
    NSUInteger weekday = [[self firstDayOfCurrentMoth] weeklyOrdinality];
    
    NSUInteger days = [self numberofDayInCurrentMonth];
    NSUInteger weeks = 0;
    
    if (weekday > 1) {
        weeks += 1, days -= (7 - weekday + 1);
    }
    
    weeks += days / 7;
    weeks += (days % 7 > 0) ? 1 : 0;
    
    return weeks;
}
/**
 *  获取上一个月 / 下个月
 *
 *  @return
 */
- (NSDate *)lastMonth:(NSInteger)month {
    NSDate *lastMonth = nil;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    [comps setMonth:month];
    
    return lastMonth = [[NSCalendar currentCalendar] dateByAddingComponents:comps toDate:self options:0];
}
/**
 *  获取当前年份
 *
 *  @return
 */
- (NSInteger)currentYear {
    
    return [[self currentComponents] year];
}

/**
 *  获取当前月份
 *
 *  @return
 */
- (NSInteger)currentMonth {
    
    return [[self currentComponents] month];
}

/**
 *  获取当前天
 *
 *  @return
 */
- (NSInteger)currentDay {
    
    return [[self currentComponents] day];
}

- (NSDateComponents *)currentComponents {
    NSDateComponents *comps = nil;
    
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return comps = [[NSCalendar currentCalendar] components:unitFlags fromDate:self];
}

@end
