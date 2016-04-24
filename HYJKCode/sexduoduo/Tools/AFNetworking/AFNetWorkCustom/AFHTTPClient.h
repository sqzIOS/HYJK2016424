//
//  AFHTTPClient.h
//  Sexduoduo
//
//  Created by ly1992 on 15/5/30.
//  Copyright (c) 2015年 ly. All rights reserved.
/*
 要使用常规的AFN网络访问
 
 1. AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 
 所有的网络请求,均有manager发起
 
 2. 需要注意的是,默认提交请求的数据是二进制的,返回格式是JSON
 
 1> 如果提交数据是JSON的,需要将请求格式设置为AFJSONRequestSerializer
 2> 如果返回格式不是JSON的,
 
 3. 请求格式
 
 AFHTTPRequestSerializer            二进制格式
 AFJSONRequestSerializer            JSON
 AFPropertyListRequestSerializer    PList(是一种特殊的XML,解析起来相对容易)
 
 4. 返回格式
 
 AFHTTPResponseSerializer           二进制格式
 AFJSONResponseSerializer           JSON
 AFXMLParserResponseSerializer      XML,只能返回XMLParser,还需要自己通过代理方法解析
 AFXMLDocumentResponseSerializer (Mac OS X)
 AFPropertyListResponseSerializer   PList
 AFImageResponseSerializer          Image
 AFCompoundResponseSerializer       组合
 
 eg:  manager.responseSerializer = [AFJSONResponseSerializer serializer];
 */

#import <Foundation/Foundation.h>

@interface AFHTTPClient : NSObject


#pragma mark - 重新写过的返回json的

+ (void)postRequestJSONDataPath:(NSString *)path httpHost:(NSString *)host parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail;

/**
 *   JSON方式获取数据
 *
 *  @param host    http 主域名
 *  @param path    http 路径
 *  @param params  参数字典
 *  @param success
 *  @param fail
 */
+ (AFHTTPRequestOperation*)getJSONPath:(NSString *)path httpHost:(NSString *)host params:(id)params success:(void (^)(id json))success fail:(void (^)())fail;

/**
 *   post提交json数据
 *
 *  @param host    http 主域名
 *  @param path    http 路径
 *  @param params  参数字典
 *  @param success
 *  @param fail
 */
+ (AFHTTPRequestOperation*)postJSONPath:(NSString *)path httpHost:(NSString *)host parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail;

/**
 *   xml方式获取数据
 *
 *  @param host    http 主域名
 *  @param path    http 路径
 *  @param params  参数字典
 *  @param success
 *  @param fail
 */
+ (AFHTTPRequestOperation*)getXMLPath:(NSString *)path httpHost:(NSString *)host params:(NSDictionary *)params success:(void (^)(id xml))success fail:(void (^)())fail;

/**
 *   下载文件
 *
 *  @param urlStr  下载路径
 *  @param fileURL  下载得到URL
 *  @param fail
 */
+ (void)sessionDownloadWithUrl:(NSString *)urlStr success:(void (^)(NSURL *fileURL))success fail:(void (^)())fail;
/**
 *  文件上传－自定义上传文件名
 *
 *  @param urlStr
 *  @param fileURL
 *  @param fileName
 *  @param fileTye
 *  @param success
 *  @param fail
 */
+ (AFHTTPRequestOperation*)postUploadWithUrl:(NSString *)urlStr fileUrl:(NSURL *)fileURL fileName:(NSString *)fileName fileType:(NSString *)fileTye success:(void (^)(id responseObject))success fail:(void (^)())fail;
/**
 *  文件上传－随机生成文件名
 *
 *  @param urlStr
 *  @param fileURL
 *  @param success
 *  @param fail
 */
+ (AFHTTPRequestOperation*)postUploadWithUrl:(NSString *)urlStr fileUrl:(NSURL *)fileURL success:(void (^)(id responseObject))success fail:(void (^)())fail;



+ (NSDictionary *)jsonTurnToDictionary:(id)responseObject;


@end
