//
//  NSDate+QZCategory.h
//  sexduoduo
//
//  Created by showm on 15/9/16.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (QZCategory)

//yyyy-MM-dd HH:mm:ss Z
+(NSDate*)allocWithFormatString:(NSString *)str;

// 将字符串类型的时间戳 改为 时间字符串 打印出来是yyyy-MM-dd HH:mm:ss Z
+(NSString *)formatTimeStrIntervalSince1970:(NSString *)str;


//将long long型的时间戳 格式化为制定格式的 时间 eg：@"yyyy-MM-dd HH:mm:ss Z" 或 @"yyyy-MM-dd HH:mm" 等等
+(NSString *)dateFromLongLong:(long long)msSince1970 dateFormat:(NSString *)format;







@end
