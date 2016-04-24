//
//  NSData+Extend.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/30.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "NSData+Extend.h"

@implementation NSData (Extend)
-(NSString *)convertTo16ByteString
{
    const char *bytes = [self bytes];
    NSInteger length = self.length;
    NSMutableString *hexStr= [NSMutableString string];
    for(int i=0;i<length;i++)
    {
        [hexStr appendFormat:@"%02X",bytes[i]&0xff];
    }
    return hexStr;
}
+(NSArray *)arrayWithJSONData:(NSData *)data
{
    id JSON = [data objectFromJSONDataOrString];
    if([JSON isKindOfClass:[NSArray class]])
    {
        return JSON;
    }
    return nil;
}
+(NSDictionary *)dictionaryWithJSONData:(NSData *)data
{
    id JSON = [data objectFromJSONDataOrString];
    if([JSON isKindOfClass:[NSDictionary class]])
    {
        return JSON;
    }
    return nil;
}
@end
