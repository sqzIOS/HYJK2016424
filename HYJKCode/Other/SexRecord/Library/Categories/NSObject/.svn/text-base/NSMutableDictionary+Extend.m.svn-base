//
//  NSMutableDictionary+Extend.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/29.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "NSMutableDictionary+Extend.h"

@implementation NSMutableDictionary (Extend)
/**
 *  安全判断
 *
 *  @param object
 *  @param key
 */
- (void)setNonNilObject:(id)object forKey:(NSString *)key
{
    if ([object isKindOfClass:[NSNull class]])
    {
        return;
    }
    
    if ([object isKindOfClass:[NSString class]])
    {
        NSString *string = (NSString *) object;
        if (string.trim.length==0)
        {
            return;
        }
    }
    
    if (object)
    {
        [self setObject:object forKey:key];
    }
}
@end
