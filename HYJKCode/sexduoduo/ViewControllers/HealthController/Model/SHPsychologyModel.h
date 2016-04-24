//
//  SHPsychologyModel.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  banner 数据
 */
@interface SHPsychologyAdInfo : NSObject
//banner 图片
@property (nonatomic,strong) NSString *iconStr;
//banner id
@property (nonatomic,strong) NSString *idStr;

@end

@interface SHPsychologyAdModel : NSObject 
//是否请求成功
@property (nonatomic) BOOL success;
//ADInfo对象集合
@property (nonatomic,strong) NSMutableArray *datasource;
//客户端自用, hadload是否远程加载过数据了
@property(nonatomic) BOOL hadload;
/**
 *  对象构造
 *
 *  @return
 */
+(SHPsychologyAdModel*)buildModel;
/**
 *  从远程获取数据,异部方式回调
 *
 *  @param model    外部要构造
 *  @param flag     是否重新加载
 *  @param callback 返回的数据
 */
+(void)loadRemoteDataForAdModel:(SHPsychologyAdModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHPsychologyAdModel* model))callback;
/**
 *  本地读取缓存的数据
 *
 *  @return
 */
+(SHPsychologyAdModel*)loadLocalDataForAdModel;

@end

/**
 *  心理 医师
 */
@interface SHPsychologyInfo : NSObject
//医师 头像
@property (nonatomic,strong) NSString *iconStr;
//医师 名字
@property (nonatomic,strong) NSString *nameStr;
//医师 职称
@property (nonatomic,strong) NSString *postStr;//
//医师 所在医院
@property (nonatomic,strong) NSString *addressStr;
//医师 擅长
@property (nonatomic,strong) NSString *contentStr;
//医师 id
@property (nonatomic,strong) NSString *idStr;
//医师 经度
@property (nonatomic,strong) NSString *lngStr;
//医师 纬度
@property (nonatomic,strong) NSString *latStr;

@end

@interface SHPsychologyModel : NSObject
//是否请求成功
@property (nonatomic) BOOL success;
//ADInfo对象集合
@property (nonatomic,strong) NSMutableArray *datasource;
//客户端自用, hadload是否远程加载过数据了
@property(nonatomic) BOOL hadload;
/**
 *  对象构造
 *
 *  @return
 */
+(SHPsychologyModel*)buildModel;
/**
 *  从远程获取数据,异部方式回调
 *
 *  @param model    外部要构造
 *  @param flag     是否重新加载
 *  @param callback 返回的数据
 */
+(void)loadRemoteDataForPsychologyModel:(SHPsychologyModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHPsychologyModel* model))callback;
/**
 *  本地读取缓存的数据
 *
 *  @return
 */
+(SHPsychologyModel*)loadLocalDataForPsychologyModel;
@end
