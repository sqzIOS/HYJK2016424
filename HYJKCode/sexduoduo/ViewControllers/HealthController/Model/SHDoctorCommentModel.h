//
//  SHDoctorCommentModel.h
//  SexHealth
//
//  Created by ly1992 on 15/7/2.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHDoctorCommentInfo : NSObject
//客户端 登陆 用户
@property (nonatomic,strong) NSString *logonStr;
//用户 评价
@property (nonatomic,strong) NSString *commentStr;
//评论 Who
@property (nonatomic,strong) NSArray *list;
/**
 *  对象构造
 *
 *  @return
 */
+(SHDoctorCommentInfo*)buildModel;

@end


@interface SHDoctorCommentModel : NSObject
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
+(SHDoctorCommentModel*)buildModel;
/**
 *  从远程获取数据,异部方式回调
 *
 *  @param model    外部要构造
 *  @param flag     是否重新加载
 *  @param callback 返回的数据
 */
+(void)loadRemoteDataForDoctorCommentModel:(SHDoctorCommentModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHDoctorCommentModel* model))callback;
/**
 *  本地读取缓存的数据
 *
 *  @return
 */
+(SHDoctorCommentModel*)loadLocalDataForDoctorCommentModel;
@end
