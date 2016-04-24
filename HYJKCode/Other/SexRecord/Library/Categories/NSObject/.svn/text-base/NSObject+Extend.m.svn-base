//
//  NSObject+Extend.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/30.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "NSObject+Extend.h"

@implementation NSObject (Extend)
-(id)lkObjectFromJSONData
{
    NSData* data = (NSData*)self;
    if(data.length > 0)
    {
        NSError* error = nil;
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if(error)
        {
            NSLog(@"\n jsonData 解析出错 %@ \n",[error debugDescription]);
        }
        return object;
    }
    return nil;
}
-(id)lkObjectFromJSONString
{
    NSString* string = (NSString*)self;
    NSData* data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data lkObjectFromJSONData];
}
-(id)objectFromJSONDataOrString
{
    if([self isKindOfClass:[NSData class]])
    {
        return [self lkObjectFromJSONData];
    }
    if([self isKindOfClass:[NSString class]])
    {
        return [self lkObjectFromJSONString];
    }
    return nil;
}
-(NSData *)dataFromJSONObject
{
    if([self isKindOfClass:[NSNull class]])
        return nil;
    
    NSError* error = nil;
    NSData* data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"\n object 转换 jsonData 出错: %@ \n",error.debugDescription);
    }
    return data;
}
-(NSString *)stringFromJSONObject
{
    NSData* data = [self dataFromJSONObject];
    if(data.length > 0)
    {
        return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
