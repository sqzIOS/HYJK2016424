//
//  SHCopeVC.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//  科普知识

#import <UIKit/UIKit.h>
//typedef enum _theRequestType {
//    searchGoodsType = 0,    //搜索
//    homeViewType,           //首页 专区
//    classifyType,           //分类
//    collectType,            //收藏
//    brandStreet,            //品牌街
//    flagType,               //标签类型
//} theRequestType;

#import "SHRootVC.h"
typedef enum _theCopeVCType
{
    searchType = 0,//搜索结果
    normalType     //正常的科普知识列表
}theCopeVCType;
@interface SHCopeVC : SHRootVC

@property (strong, nonatomic) NSMutableArray *listArray;//数据列表用于存储 结果列表
@property (strong, nonatomic) NSString *searchKeywords;
@property (assign, nonatomic) theCopeVCType copeType;

+(void)gotoMySelf:(id)pvc withType:(theCopeVCType)type andObject:(id)object;
@end
