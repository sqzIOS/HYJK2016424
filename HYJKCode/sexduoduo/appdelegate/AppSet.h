//
//  AppSet.h
//  SouTao
//
//  Created by chw on 13-7-5.
//  Copyright (c) 2013年 chw. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _LOGIN_TYPE
{
    NO_LOGIN    = 0,    //未登录
    HAVE_LOGIN,       //登陆
}LOGIN_TYPE;

@interface AppSet : NSObject

@property(nonatomic, strong) NSArray *subscribeSets;    //当前订阅，未登录是本地保存的，登陆后更新服务器上的
@property(nonatomic, strong) NSString *headUrl;         //登录后的头像
@property(nonatomic, assign) LOGIN_TYPE loginType;      //登陆类型，淘宝、腾讯、新浪...
@property(nonatomic, strong) NSArray *collectGoods;     //收藏的商品列表
@property(nonatomic, strong) NSNumber *loginUserID;     //登陆后返回的ID，由后台生成的
@property(nonatomic, assign) BOOL downloading;          //当前是否在下载
@property(nonatomic, assign) BOOL bFirstInstall;        //是否第一次下载 =1是第一次下载
@property (nonatomic, assign) NSInteger is_new_fun;     //新功能是否已经查看标志  =0是还未查看
@property (nonatomic, assign) NSInteger new_fun_flag;   //新功能查看标志
@property (nonatomic, strong) NSString *softwareVersion;//记录版本号
@property (nonatomic, strong) NSArray *trackGoods;      //我的足迹
@property (nonatomic, strong) NSMutableArray *classify;        //全局分类信息
@property (nonatomic, strong) NSArray *recommendArray;        //推荐相关
@property(nonatomic, assign) BOOL isMainView;        //是否四个主要界面
@property (nonatomic, assign) NSInteger indexBtn;   //底部btn选择标志
@property(nonatomic, strong) NSString *pushTag;  //推送标志
@property(nonatomic, assign) BOOL isPush;  //是否推送

@property(nonatomic, strong) NSMutableArray *slideImages;   //

@property(nonatomic, strong) NSMutableArray *userAddrArry;  //用户地址

@property(nonatomic, strong) NSMutableArray *collectArray;  //收藏id

@property(nonatomic, strong) NSMutableArray *classifyArray; //分类数组
@property(nonatomic, strong) NSMutableArray *historyArray; //分类数组history

@property(nonatomic, strong) NSMutableArray *shopCarData;//购物车内容
@property(nonatomic, strong) NSMutableArray *shopCarNumArray;  //购物车  数量

@property(nonatomic, strong) NSMutableArray *homeCategoryArray; //首页分类
@property(nonatomic, strong) NSMutableArray *homeGoodsDataArray; //首页商品
@property(nonatomic, strong) NSMutableArray *homeNewDataArray; //新首页内容
@property(nonatomic, strong) NSMutableArray *homeNewADArray; //新首页广告

@property(nonatomic, strong) NSMutableArray *BBSArray; //论坛版块
@property(nonatomic, strong) NSMutableArray *MyBBSArray; //我的论坛版块
@property(nonatomic, strong) NSMutableArray *hotBBSList;//论坛最热话题
@property(nonatomic, strong) NSMutableArray *BBSADList;//论坛最热话题
@property(nonatomic, strong) NSMutableArray *nvShenDaoGouListArr;//女神导购


+ (instancetype)shareInstance;

- (void)saveAddr;
- (void)saveNewFunFlag;
- (void)saveFirstInstall;
- (void)saveCollectGoodsData;
- (void)saveClassifyData;
- (void)saveHistoryData;

- (void)saveHomeCategoryData;
- (void)saveHomeGoodsData;
- (void)saveHomeNewData;
- (void)saveHomeNewADArray;

- (void)saveBBSData;
- (void)saveMyBBSData;
- (void)saveHotBBSList;
- (void)saveBBSADList;
- (void)saveNvShenDaoGouListArray;


- (void)saveShopCarData;//购物车

@end
