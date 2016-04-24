//
//  SHNearbyHospitalModel.m
//  SexHealth
//
//  Created by ly1992 on 15/6/30.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHNearbyHospitalModel.h"

@implementation SHNearbyHospitalInfo
@end

@implementation SHNearbyHospitalModel

+ (NSString*)getCachePath
{
    return [NSFileManager pathForCacheFile:[NSString stringWithFormat:@"SHNearbyHospitalModel.json"] inDir:@"SHNearbyHospitalModel"];
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

+(SHNearbyHospitalModel*)buildModel
{
    SHNearbyHospitalModel *m = [[SHNearbyHospitalModel alloc]init];
    m.datasource = [[NSMutableArray alloc]init];
    return m;
}

+(void)loadRemoteDataForHospitalModel:(SHNearbyHospitalModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHNearbyHospitalModel* model))callback
{
    
}

+(SHNearbyHospitalModel*)loadLocalDataForHospitalModel
{
    SHNearbyHospitalModel* model = [self buildModel];
//    SHNearbyHospitalInfo *info = [[SHNearbyHospitalInfo alloc]init];
//    info.iconStr = @"doctor";
//    info.nameStr = @"隔壁老王医院";
//    info.addressStr = @"中国中央医院";
//    info.contentStr = @"请不要这样子啦，请不要这样子啦，请不要这样子啦，请不要这样子啦，请不要这样子啦，请不要这样子啦，请不要这样子啦，请不要这样子啦，请不要这样子啦，请不要这样子啦，请不要这样子啦";
//    [model.datasource addObject:info];
    return model;

}
@end
