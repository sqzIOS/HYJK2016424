//
//  SHCommentModel.h
//  SexHealth
//
//  Created by ly1992 on 15/7/1.
//  Copyright (c) 2015年 showm. All rights reserved.
//  问题评论

#import <Foundation/Foundation.h>

@interface SHCommentInfo : NSObject
//评论 内容
@property (nonatomic,strong) NSString *contentStr;
//评论 楼层
@property (nonatomic,strong) NSString *topStr;
//评论 时间
@property (nonatomic,strong) NSString *timeStr;
//评论 Who
@property (nonatomic,strong) NSString *replyStr;

@end

@interface SHCommentModel : NSObject
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
+(SHCommentModel*)buildModel;
/**
 *  从远程获取数据,异部方式回调
 *
 *  @param model    外部要构造
 *  @param flag     是否重新加载
 *  @param callback 返回的数据
 */
+(void)loadRemoteDataForCommentModel:(SHCommentModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHCommentModel* model))callback;
/**
 *  本地读取缓存的数据
 *
 *  @return
 */
+(SHCommentModel*)loadLocalDataForCommentModel;

@end
