//
//  SHCommentModel.m
//  SexHealth
//
//  Created by ly1992 on 15/7/1.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHCommentModel.h"

@implementation SHCommentInfo

@end

@implementation SHCommentModel

+ (NSString*)getCachePath
{
    return [NSFileManager pathForCacheFile:[NSString stringWithFormat:@"SHCommentModel.json"] inDir:@"SHCommentModel"];
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

+(SHCommentModel*)buildModel
{
    SHCommentModel *m = [[SHCommentModel alloc]init];
    m.datasource = [[NSMutableArray alloc]init];
    return m;
}

+(void)loadRemoteDataForCommentModel:(SHCommentModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHCommentModel* model))callback
{
    
}

+(SHCommentModel*)loadLocalDataForCommentModel
{
    SHCommentModel* model = [self buildModel];
    for (int i = 0; i < 5; i++) {
        SHCommentInfo *info = [[SHCommentInfo alloc]init];
        info.contentStr = @"林大爷很累啦。";
        info.topStr= [NSString stringWithFormat:@"%d",i];
        info.timeStr = @"06-14 12:00";
        info.replyStr = @"你大爷";
        [model.datasource addObject:info];
    }
    return model;
}
@end
