//
//  NSDate+Extend.m
//  Sexduoduo
//
//  Created by ly1992 on 15/6/2.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "NSDate+Extend.h"

static __strong NSCalendar *calendar_instance;
@implementation NSDate (Extend)
//返回NSTimeInterval数值(精确到秒,10位长度)
-(NSUInteger)getDateTINSUIntegerValueEx
{
    NSString *tistr = [self getDateTIStringEx];
    return tistr.integerValue;
}
//返回NSTimeInterval字符串(精确到秒,10位长度)
-(NSString*)getDateTIStringEx
{
    NSTimeInterval ti = self.timeIntervalSince1970;
    NSString *stime = [NSString stringWithFormat:@"%.0f",ti];
    return stime;
}

+ (NSCalendar *)shareCNCalendar
{
    if (calendar_instance == nil)
    {
        @synchronized (self)
        {
            if (calendar_instance == nil)
            {
                calendar_instance = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            }
        }
    }
    return calendar_instance;
}
// 获取年
+ (NSInteger)getYear:(NSDate *)date
{
    NSCalendar *calendar = [NSDate shareCNCalendar];
    NSDateComponents *comps = [calendar components:(NSYearCalendarUnit) fromDate:date];
    return [comps year];
}
// 获取月
+ (NSInteger)getMonths:(NSDate *)date
{
    NSCalendar *calendar = [NSDate shareCNCalendar];
    NSDateComponents *comps = [calendar components:(NSMonthCalendarUnit) fromDate:date];
    return [comps month];
}

// 获取日
+ (NSInteger)getDay:(NSDate *)date
{
    NSCalendar *calendar = [NSDate shareCNCalendar];
    NSDateComponents *comps = [calendar components:(NSDayCalendarUnit) fromDate:date];
    return [comps day];
}
// 获取某天的string类型，格式如：2013-03
+ (NSString *)dateStringYMFromDate:(NSDate *)date
{
    return [NSString stringWithFormat:@"%ld-%02ld", (long)[NSDate getYear:date], (long)[NSDate getMonths:date]];
}
// 获取某天的string类型，格式如：2013-3-22
+ (NSString *)dateStringYMDFromDate:(NSDate *)date
{
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld", (long)[NSDate getYear:date], (long)[NSDate getMonths:date], (long)[NSDate getDay:date]];
}


// 时间字符串返回时间NSDate 2013-3-22
+ (NSDate *)dateFromYMDString:(NSString *)dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    
    NSDate *destDate= [dateFormatter dateFromString:dateStr];
    
    return destDate;
}


//比较 两个时间的大小
+(NSInteger)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        return 1;
    }
    else if (result == NSOrderedAscending){
        return -1;
    }
    return 0;
    
}
@end
