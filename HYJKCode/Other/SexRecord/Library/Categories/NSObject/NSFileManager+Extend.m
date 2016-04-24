//
//  NSFileManager+Extend.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/30.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "NSFileManager+Extend.h"

@implementation NSFileManager (Extend)
+(NSString*) pathForDocumentsFile:(NSString *)filename inDir:(NSString*)dir
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *directoryPath = [path stringByAppendingPathComponent:dir];;
    if ([fileManager fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    NSString *filePath = [directoryPath stringByAppendingPathComponent:filename];
    return filePath;
}

+(NSString*) pathForTmpFile:(NSString *)filename inDir:(NSString*)dir
{
    NSString *path = [self tmpPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *directoryPath = [path stringByAppendingPathComponent:dir];;
    if ([fileManager fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    NSString *filePath = [directoryPath stringByAppendingPathComponent:filename];
    return filePath;
}

+(NSString*) pathForCacheFile:(NSString *)filename inDir:(NSString*)dir
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *directoryPath = [path stringByAppendingPathComponent:dir];;
    if ([fileManager fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    NSString *filePath = [directoryPath stringByAppendingPathComponent:filename];
    return filePath;
}
+ (NSString *)tmpPath
{
    return [NSHomeDirectory() stringByAppendingFormat:@"/tmp"];
}
/**
 *  删除 document/dir 目录下 所有文件
 */
+(void)deleteAllForDocumentsDir:(NSString*)dir
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *directoryPath = [path stringByAppendingPathComponent:dir];;
    if (![fileManager fileExistsAtPath:path]) {
        return;
    }
    [fileManager removeItemAtPath:directoryPath error:nil];
}
/**
 *  删除 Tmp/dir 目录下 所有文件
 */
+(void)deleteAllForTmpDir:(NSString*)dir
{
    NSString *path = [self tmpPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *directoryPath = [path stringByAppendingPathComponent:dir];;
    if (![fileManager fileExistsAtPath:path]) {
        return;
    }
    [fileManager removeItemAtPath:directoryPath error:nil];
}
/**
 *  删除 cache/dir 目录下 所有文件
 */
+(void)deleteAllForCachesDir:(NSString*)dir
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *directoryPath = [path stringByAppendingPathComponent:dir];;
    if (![fileManager fileExistsAtPath:path]) {
        return;
    }
    [fileManager removeItemAtPath:directoryPath error:nil];
}

/**
 *  删除文件
 */
+(void)deleteFile:(NSString*)filepath
{
     [[NSFileManager defaultManager] removeItemAtPath:filepath error:nil];
}
/**
 *  判断文件目录是否存在
 */
+(BOOL)isFileExists:(NSString *)filepath
{
     return [[NSFileManager defaultManager] fileExistsAtPath:filepath];
}
@end
