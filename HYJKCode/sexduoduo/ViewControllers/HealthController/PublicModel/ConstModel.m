//
//  ConstModel.m
//  Sexduoduo
//
//  Created by ly1992 on 15/6/2.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "ConstModel.h"


@implementation ConstModel

+ (NSString*)getUserID
{
    NSString* uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
    return uid;
}
/**
 判断是否登录状态
 **/
+ (BOOL)isLogined
{
//    if([[ConstModel shareUserModel].uid isEqualToString:defalutUserId]) {
//        return NO;
//    } else {
//        return YES;
//    }
    return NO;
}
/**
 判断缓存是否在有效期
 **/
+(BOOL)checkCachePeriod:(NSString *)key
{
    if ([NSString isBlankString:key]) {
        return NO;
    }
    
    NSString *keystr = [NSString stringWithFormat:@"%@",key];
    NSInteger periodTime = [[NSUserDefaults standardUserDefaults] integerForKey:keystr];
    if (periodTime <= 0) {
        return NO;
    }
    NSDate* date = [NSDate date];
    NSUInteger time = [date getDateTINSUIntegerValueEx];
    if (periodTime > time) {
        return YES;
    }
    return NO;
}
/**
 设置缓存有效期
 sec为秒
 **/
+(void)setCachePeriod:(NSString *)key sec:(NSUInteger)sec
{
    if ([NSString isBlankString:key]) {
        return;
    }
    
    NSDate* date = [NSDate date];
    NSUInteger time = [date getDateTINSUIntegerValueEx];
    time += sec;
    
    NSString *keystr = [NSString stringWithFormat:@"%@",key];
    [[NSUserDefaults standardUserDefaults] setInteger:time forKey:keystr];

}
@end
