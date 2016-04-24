//
//  SHHealthModel.h
//  SexHealth
//
//  Created by ly1992 on 15/6/29.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  banner 数据
 */
@interface SHHealthAdInfo : NSObject
//banner 图片
@property (nonatomic,strong) NSString *iconStr;
//banner id
@property (nonatomic,strong) NSString *idStr;

@end

@interface SHHealthAdModel : NSObject
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
+(SHHealthAdModel*)buildModel;
/**
 *  从远程获取数据,异部方式回调
 *
 *  @param model    外部要构造
 *  @param flag     是否重新加载
 *  @param callback 返回的数据
 */
+(void)loadRemoteDataForAdModel:(SHHealthAdModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHHealthAdModel* model))callback;
/**
 *  本地读取缓存的数据
 *
 *  @return
 */
+(SHHealthAdModel*)loadLocalDataForAdModel;
@end

/**
 *  推荐医师 数据
 */
@interface SHHealthDoctorInfo : NSObject
//医师 头像
@property (nonatomic,strong) NSString *iconStr;
//医师 名字
@property (nonatomic,strong) NSString *nameStr;
//医师 id
@property (nonatomic,strong) NSString *idStr;

@end

@interface SHHealthDoctorModel : NSObject
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
+(SHHealthDoctorModel*)buildModel;
/**
 *  从远程获取数据,异部方式回调
 *
 *  @param model    外部要构造
 *  @param flag     是否重新加载
 *  @param callback 返回的数据
 */
+(void)loadRemoteDataForDoctorModel:(SHHealthDoctorModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHHealthDoctorModel* model))callback;
/**
 *  本地读取缓存的数据
 *
 *  @return
 */
+(SHHealthDoctorModel*)loadLocalDataForDoctorModel;
@end

/**
 *  推荐医院 数据
 */
@interface SHHealthHospitalInfo : NSObject
//医院 图片
@property (nonatomic,strong) NSString *iconStr;
//医院 名字
@property (nonatomic,strong) NSString *nameStr;
//医院 id
@property (nonatomic,strong) NSString *idStr;
//医院 地址
@property (nonatomic,strong) NSString *addressStr;
//医院 简介
@property (nonatomic,strong) NSString *contentStr;

@end

@interface SHHealthHospitalModel : NSObject
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
+(SHHealthHospitalModel*)buildModel;
/**
 *  从远程获取数据,异部方式回调
 *
 *  @param model    外部要构造
 *  @param flag     是否重新加载
 *  @param callback 返回的数据
 */
+(void)loadRemoteDataForHospitalModel:(SHHealthHospitalModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHHealthHospitalModel* model))callback;
/**
 *  本地读取缓存的数据
 *
 *  @return
 */
+(SHHealthHospitalModel*)loadLocalDataForHospitalModel;
@end

@interface SHHealthModel : NSObject

@end

