//
//  SHMydoctorModel.m
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHMydoctorModel.h"

@implementation SHMydoctorModel

+ (NSString*)getCachePath
{
    return [NSFileManager pathForCacheFile:[NSString stringWithFormat:@"SHMydoctorModel.json"] inDir:@"SHMydoctorModel"];
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
+(SHMydoctorModel*)buildModel
{
    SHMydoctorModel *m = [[SHMydoctorModel alloc]init];
    m.datasource = [[NSMutableArray alloc]init];
    return m;
}

+(void)loadRemoteDataForDoctorModel:(SHMydoctorModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHMydoctorModel* model))callback
{
    
}

+(SHMydoctorModel*)loadLocalDataForDoctorModel
{
    SHMydoctorModel* model = [self buildModel];
//    SHMydoctorInfo *info = [[SHMydoctorInfo alloc]init];
//    info.iconStr = @"doctor";
//    info.nameStr = @"林大爷";
//    info.postStr = @"主任医生";
//    info.addressStr = @"漳州漳浦县";
//    info.contentStr = @"我是个很帅的医生啦，我是个很帅的医生啦,我是个很帅的医生啦，我是个很帅的医生啦";
//    info.scoreStr = @"999";
//    //info.idStr=@"doctorIdStr";
//    [model.datasource addObject:info];
    return model;
}
@end

@implementation SHHistoryInfo

@end

@implementation SHHistoryModel
+ (NSString*)getCachePath
{
    return [NSFileManager pathForCacheFile:[NSString stringWithFormat:@"SHHistoryModel.json"] inDir:@"SHHistoryModel"];
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

+(SHHistoryModel*)buildModel
{
    SHHistoryModel *m = [[SHHistoryModel alloc]init];
    m.datasource = [[NSMutableArray alloc]init];
    return m;
}

+(void)loadRemoteDataForHistoryModel:(SHHistoryModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHHistoryModel* model))callback
{
    
}

+(SHHistoryModel*)loadLocalDataForHistoryModel
{
    SHHistoryModel *model = [self buildModel];
    SHHistoryInfo *info = [[SHHistoryInfo alloc]init];
    info.iconStr = @"doctor";
    info.nameStr = @"林大爷";
    info.sexStr = @"1";
    info.yearStr = @"18";
    info.contentStr = @"我是个很帅的医生啦，我是个很帅的医生啦,我是个很帅的医生啦，我是个很帅的医生啦";
    info.timeStr = @"2015-06-02 14:06";
    info.doctorStr = @"隔壁老王";
    [model.datasource addObject:info];
    return model;
}

@end
