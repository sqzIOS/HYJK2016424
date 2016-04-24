//
//  SHDoctorCommentModel.m
//  SexHealth
//
//  Created by ly1992 on 15/7/2.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHDoctorCommentModel.h"


@implementation SHDoctorCommentInfo

@end

@implementation SHDoctorCommentModel

+ (NSString*)getCachePath
{
    return [NSFileManager pathForCacheFile:[NSString stringWithFormat:@"SHDoctorCommentModel.json"] inDir:@"SHDoctorCommentModel"];
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
+(SHDoctorCommentModel*)buildModel
{
    SHDoctorCommentModel *m = [[SHDoctorCommentModel alloc]init];
    m.datasource = [[NSMutableArray alloc]init];
    return m;
}

+(void)loadRemoteDataForDoctorCommentModel:(SHDoctorCommentModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHDoctorCommentModel* model))callback
{
    
}

+(SHDoctorCommentModel*)loadLocalDataForDoctorCommentModel
{
    SHDoctorCommentModel *model = [self buildModel];
    for (int i = 0; i < 5; i++) {
        SHDoctorCommentInfo *info = [[SHDoctorCommentInfo alloc]init];
        info.logonStr = @"QQ登陆用户";
        info.commentStr = @"满意";
        info.list = [NSArray arrayWithObjects:@"意见很有帮助",@"意见很有帮助",@"意见很有帮助", nil];
        [model.datasource addObject:info];
    }
    return model;
    
}
@end
