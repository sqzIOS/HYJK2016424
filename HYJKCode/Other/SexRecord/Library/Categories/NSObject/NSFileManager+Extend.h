//
//  NSFileManager+Extend.h
//  Sexduoduo
//
//  Created by ly1992 on 15/5/30.
//  Copyright (c) 2015年 ly. All rights reserved.
/*
 Documents：      应用中用户数据可以放在这里，iTunes备份和恢复的时候会包括此目录
 tmp：            存放临时文件，iTunes不会备份和恢复此目录，此目录下文件可能会在应用退出后删除
 Library/Caches： 存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除
 调用方法：
 NSString *filePath =  [NSFileManager pathForDocumentsFile:@"文件名" inDir:@"目录"];
 NSString *JSON = @"写入内容";
 [JSON writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
 */


#import <Foundation/Foundation.h>

@interface NSFileManager (Extend)
/**
 *  沙盒中创建目录 文件
 *
 *  @param filename 文件名
 *  @param dir      沙盒中 目录名
 *
 *  @return         沙盒路径
 */
+(NSString*) pathForDocumentsFile:(NSString *)filename inDir:(NSString*)dir;

+(NSString*) pathForTmpFile:(NSString *)filename inDir:(NSString*)dir;

+(NSString*) pathForCacheFile:(NSString *)filename inDir:(NSString*)dir;

/**
 *  删除 document/dir 目录下 所有文件
 */
+(void)deleteAllForDocumentsDir:(NSString*)dir;
/**
 *  删除 Tmp/dir 目录下 所有文件
 */
+(void)deleteAllForTmpDir:(NSString*)dir;
/**
 *  删除 cache/dir 目录下 所有文件
 */
+(void)deleteAllForCachesDir:(NSString*)dir;

/**
 *  //删除文件
 */
+(void)deleteFile:(NSString*)filepath;
/**
 *  判断文件目录是否存在
 */
+(BOOL)isFileExists:(NSString *)filepath;
@end
