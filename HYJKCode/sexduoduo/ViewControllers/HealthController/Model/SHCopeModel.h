//
//  SHCopeModel.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHCopeInfo : NSObject
//科普 图标
@property (nonatomic,strong) NSString *iconStr;
//科普 标题
@property (nonatomic,strong) NSString *titleStr;
//科普 内容
@property (nonatomic,strong) NSString *contentStr;
//科普 时间
@property (nonatomic,strong) NSString *timeStr;
//科普 ID
@property (nonatomic,strong) NSString *idStr;

@end

@interface SHCopeModel : NSObject
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
+(SHCopeModel*)buildModel;
/**
 *  从远程获取数据,异部方式回调
 *
 *  @param model    外部要构造
 *  @param flag     是否重新加载
 *  @param callback 返回的数据
 */
+(void)loadRemoteDataForCopeModel:(SHCopeModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHCopeModel* model))callback;
/**
 *  本地读取缓存的数据
 *
 *  @return
 */
+(SHCopeModel*)loadLocalDataForCopeModel;
@end
