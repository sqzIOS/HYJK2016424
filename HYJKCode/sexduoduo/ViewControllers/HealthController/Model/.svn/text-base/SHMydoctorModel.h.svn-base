//
//  SHMydoctorModel.h
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHMydoctorInfo : NSObject
//医师 头像
@property (nonatomic,strong) NSString *iconStr;
//医师 名字
@property (nonatomic,strong) NSString *nameStr;
//医师 职位
@property (nonatomic,strong) NSString *postStr;
//医师 地址
@property (nonatomic,strong) NSString *addressStr;
//医师 简介
@property (nonatomic,strong) NSString *contentStr;
//医师 评分
@property (nonatomic,strong) NSString *scoreStr;
//医师 id
@property (nonatomic,strong) NSString *idStr;

//地区
@property (nonatomic,strong)NSString *area;

@property (nonatomic,strong)NSString *doctorId;

@property (nonatomic,strong)NSString *doctorName;
//擅长
@property (nonatomic,strong)NSString *goodat;
//头像图片url
@property (nonatomic,strong)NSString *headimgurl;

@property (nonatomic,strong)NSString *hopital;

@property (nonatomic,strong)NSString *hopitalId;
//介绍
@property (nonatomic,strong)NSString *introduce;
//认证
@property (nonatomic,strong)NSString *isCertification;
//坐标
@property (nonatomic,strong)NSString *lat;
//坐标
@property (nonatomic,strong)NSString *lng;
//普及？？？？
@property (nonatomic,strong)NSString *popularity;
//位置
@property (nonatomic,strong)NSString *position;


//附近医师model
@property (nonatomic,strong)NSString *nearbyArea;//地区
@property (nonatomic,strong)NSString *nearbyDistance;//距离
@property (nonatomic,strong)NSString *nearbyDoctorId;//医师id
@property (nonatomic,strong)NSString *nearbyDoctorPostl;// 职称
@property (nonatomic,strong)NSString *nearbyHeadimgurl;//头像
@property (nonatomic,strong)NSString *nearbyIntroduce;//医师简介
@property (nonatomic,strong)NSString *nearbyInt;
@property (nonatomic,strong)NSString *nearbyIat;
@property (nonatomic,strong)NSString *nearbyName;// 名称
@property (nonatomic,strong)NSString *nearbyPopularity;// 评价分数


@end

@interface SHMydoctorModel : NSObject
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
+(SHMydoctorModel*)buildModel;
/**
 *  从远程获取数据,异部方式回调
 *
 *  @param model    外部要构造
 *  @param flag     是否重新加载
 *  @param callback 返回的数据
 */
+(void)loadRemoteDataForDoctorModel:(SHMydoctorModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHMydoctorModel* model))callback;
/**
 *  本地读取缓存的数据
 *
 *  @return
 */
+(SHMydoctorModel*)loadLocalDataForDoctorModel;
@end

/**
 *  服务历史
 */
@interface  SHHistoryInfo: NSObject
//我的 头像
@property (nonatomic,strong) NSString *iconStr;
//我的 名字
@property (nonatomic,strong) NSString *nameStr;
//我的 性别
@property (nonatomic,strong) NSString *sexStr;
//我的 年龄
@property (nonatomic,strong) NSString *yearStr;
//我的 问题
@property (nonatomic,strong) NSString *contentStr;
//我的 时间
@property (nonatomic,strong) NSString *timeStr;
//我的 医师
@property (nonatomic,strong) NSString *doctorStr;





@end

@interface  SHHistoryModel: NSObject
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
+(SHHistoryModel*)buildModel;
/**
 *  从远程获取数据,异部方式回调
 *
 *  @param model    外部要构造
 *  @param flag     是否重新加载
 *  @param callback 返回的数据
 */
+(void)loadRemoteDataForHistoryModel:(SHHistoryModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHHistoryModel* model))callback;
/**
 *  本地读取缓存的数据
 *
 *  @return
 */
+(SHHistoryModel*)loadLocalDataForHistoryModel;

@end