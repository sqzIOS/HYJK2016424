//
//  SHCopeModel.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHCopeModel.h"

@implementation SHCopeInfo
@end

@implementation SHCopeModel
+ (NSString*)getCachePath
{
    return [NSFileManager pathForCacheFile:[NSString stringWithFormat:@"SHCopeModel.json"] inDir:@"SHCopeModel"];
}

+ (BOOL)setRemoteDataCache:(NSData*)data
{
    if (data == nil || data.length <= 0) {
        return NO;
    }
    NSString* cachePath =  [self getCachePath];
    if ([NSString isBlankString:cachePath]) {
        return NO;
    }
    return [data writeToFile:cachePath atomically:YES];
}
+(SHCopeModel*)buildModel
{
    SHCopeModel *m = [[SHCopeModel alloc]init];
    m.datasource = [[NSMutableArray alloc]init];
    return m;
}

+(void)loadRemoteDataForCopeModel:(SHCopeModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHCopeModel* model))callback
{
    
}

+(SHCopeModel*)loadLocalDataForCopeModel
{
    SHCopeModel *model = [self buildModel];
    SHCopeInfo *info = [[SHCopeInfo alloc]init];
    info.iconStr = @"doctor";
    info.titleStr = @"如何避免性疾病";
    info.contentStr = @"我是个很帅的医生啦，我是个很帅的医生啦,我是个很帅的医生啦，我是个很帅的医生啦";
    info.timeStr = @"2015-06-02 14:06";
    [model.datasource addObject:info];
    return model;
}
@end
