//
//  NSObject+asyncBlock.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/30.
//  Copyright (c) 2015年 ly. All rights reserved.
//  Block 异步回调

#import "NSObject+asyncBlock.h"

@implementation NSObject (asyncBlock)
- (void)asyncBlock:(void (^)(void))block
{
    [NSObject asyncBlock:block afterSecond:0];
}

- (void)asyncBlock:(void (^)(void))block afterSecond:(double)second
{
    [NSObject asyncBlock:block afterSecond:second];
}

+ (void)asyncBlock:(void (^)(void))block
{
    [self asyncBlock:block afterSecond:0];
}

+ (void)asyncBlock:(void (^)(void))block afterSecond:(double)second
{
    if (second > 0)
    {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (second * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
    }
    else
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), block);
    }
}


- (void)asyncMainBlock:(void (^)(void))block
{
    [NSObject asyncMainBlock:block afterSecond:0];
}

- (void)asyncMainBlock:(void (^)(void))block afterSecond:(double)second
{
    [NSObject asyncMainBlock:block afterSecond:second];
}

+ (void)asyncMainBlock:(void (^)(void))block
{
    [self asyncMainBlock:block afterSecond:0];
}

+ (void)asyncMainBlock:(void (^)(void))block afterSecond:(double)second
{
    if (second > 0)
    {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (second * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), block);
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}
@end
