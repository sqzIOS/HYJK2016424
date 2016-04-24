//
//  SHSearchModel.m
//  SexHealth
//
//  Created by ly1992 on 15/7/1.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHSearchModel.h"

@implementation SHSearchModel

@end




#define FILE_APP_SET    [NSHomeDirectory() stringByAppendingString:@"/Documents/systemSetup"]

static SHSearchSet *instance = nil;

@implementation SHSearchSet

@synthesize historyArray;

+ (id)shareInstance
{
    if (instance == nil)
    {
        instance = [[SHSearchSet alloc] init];
    }
    return instance;
}
- (id)init
{
    self = [super init];
    if (self != nil)
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        if (dic != nil)
        {
           historyArray = [dic objectForKey:@"historySearch"];
        }
    }
    return self;
}

- (void)saveHistorySearchData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    NSLog(@"historySearch === %@",historyArray);
    if (historyArray.count > 0) {
        [dic setValue:historyArray forKey:@"historySearch"];
    }
    [dic writeToFile:FILE_APP_SET atomically:YES];
    
}
@end
