//
//  NSDate+QZCategory.m
//  sexduoduo
//
//  Created by showm on 15/9/16.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "NSDate+QZCategory.h"

@implementation NSDate (QZCategory)


+(NSDate*)allocWithFormatString:(NSString *)str
{
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate* inputDate = [inputFormatter dateFromString:str];
    
    return inputDate;
}

//时间戳 改为 时间
+(NSString *)formatTimeStrIntervalSince1970:(NSString *)str
{
    // 时间戳改为时间
    // 备注 如果后台计算的时间戳是以毫秒为单位 则正常
    //     如果后台计算时间是以秒为单位 则需要除以1000.0
//    NSDate *date=[NSDate dateWithTimeIntervalSince1970:[str longLongValue]];//毫秒为单位
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:[str longLongValue]/1000];//秒为单位
    
    
//    NSString *dateStr=[NSString stringWithFormat:@"%@",[date description]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString *dateStr = [formatter stringFromDate:date];
    
    return dateStr;
}


//将long long型的时间戳 格式化为制定格式的 时间 eg：@"yyyy-MM-dd HH:mm:ss Z" 或 @"yyyy-MM-dd HH:mm" 等等
+(NSString *)dateFromLongLong:(long long)msSince1970 dateFormat:(NSString *)format
{
    if (msSince1970 == 0) {
        return @"无";
    }
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:msSince1970];//毫秒为单位
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:msSince1970 / 1000];//秒为单位
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    NSString *strDate = [formatter stringFromDate:date];
    return strDate;
}
@end
