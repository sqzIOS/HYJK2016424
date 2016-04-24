//
//  AppSet.m
//  SouTao
//
//  Created by chw on 13-7-5.
//  Copyright (c) 2013年 chw. All rights reserved.
//

#import "AppSet.h"

#define FILE_APP_SET    [NSHomeDirectory() stringByAppendingString:@"/Documents/systemSetup"]

static AppSet *instance = nil;

@implementation AppSet

@synthesize bFirstInstall, is_new_fun, new_fun_flag, softwareVersion, userAddrArry , collectArray ,classifyArray , historyArray , shopCarData, homeCategoryArray ,homeGoodsDataArray,homeNewDataArray,homeNewADArray, BBSArray,MyBBSArray,hotBBSList,BBSADList,nvShenDaoGouListArr;

+ (instancetype)shareInstance
{
    if (instance == nil)
    {
        instance = [[AppSet alloc] init];
    }
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        if (dic != nil)
        {
            bFirstInstall = [[dic objectForKey:@"FirstInstall"] boolValue];
            
//            softwareVersion = [dic objectForKey:@"lastSoftwareVersion"];
            softwareVersion = [NSString stringWithFormat:@"%@",[dic objectForKey:@"lastSoftwareVersion"]];
            
            is_new_fun = [[dic objectForKey:@"is_new_fun"] integerValue];
            
            userAddrArry = [dic objectForKey:@"userAddr"];
            
            collectArray = [dic objectForKey:@"collect"];
            
            classifyArray = [dic objectForKey:@"classify"];
            
            
            
            historyArray = [dic objectForKey:@"historyNew"];
            
            homeCategoryArray=[dic objectForKey:@"homeCategory"];
            
            homeGoodsDataArray = [dic objectForKey:@"homeGoods"];
            
            homeNewDataArray = [dic objectForKey:@"homeNewDataArray"];
            
            BBSArray = [dic objectForKey:@"BBSArray"];
            
            
            MyBBSArray =  [dic objectForKey:@"MyBBSArray"];
            
            hotBBSList = [dic objectForKey:@"hotBBSList"];
            
            BBSADList = [dic objectForKey:@"BBSADList"];
            
            
            homeNewADArray = [dic objectForKey:@"homeNewADArray"];
            nvShenDaoGouListArr = [dic objectForKey:@"nvShenDaoGouListArr"];
            
            shopCarData = [dic objectForKey:@"shopCarData"];//购物车
            
            
            
        }
        else
            bFirstInstall = YES;
        
//        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
//        NSNumber *currentVersion = [NSNumber numberWithFloat:[[infoDic objectForKey:@"CFBundleVersion"] floatValue]];
//        if (softwareVersion == nil || ![softwareVersion isEqualToNumber:currentVersion])
//        {
//            is_new_fun = 0;  //标记为 未看过  新版引导
//            softwareVersion = currentVersion;
//        }
        
        NSString *currentVersion= [ShareFunction getApplicationVersion];
        NSLog(@"版本号 %@ %@",softwareVersion,currentVersion);
        
        if (softwareVersion == nil || ![softwareVersion isEqualToString:currentVersion])
        {
            is_new_fun = 0;  //标记为 未看过  新版引导
            softwareVersion = currentVersion;
        }
    }
    return self;
}

- (void)saveAddr
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
//    if (userAddrArry.count > 0) {
        [dic setValue:userAddrArry forKey:@"userAddr"];
//    }

    
    [dic writeToFile:FILE_APP_SET atomically:YES];
    
}


- (void)saveNewFunFlag
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dict = [NSMutableDictionary dictionaryWithDictionary:dic];
        [dict setValue:softwareVersion forKey:@"lastSoftwareVersion"];
        [dict setValue:[NSNumber numberWithInteger:1] forKey:@"is_new_fun"];  //标记为 已看过  新版引导
    }
    else
    {
        dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:softwareVersion,@"lastSoftwareVersion", [NSNumber numberWithInteger:1], @"is_new_fun", nil];
    }
    
    is_new_fun = 1;
    [dict writeToFile:FILE_APP_SET atomically:YES];
}

-(void)saveFirstInstall
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dict = [NSMutableDictionary dictionaryWithDictionary:dic];
        [dict setValue:[NSNumber numberWithBool:0] forKey:@"FirstInstall"];
    }
    else
    {
        dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:0], @"FirstInstall", nil];
    }

    [dict writeToFile:FILE_APP_SET atomically:YES];
}

- (void)saveCollectGoodsData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
//    NSLog(@">>>%@",collectArray);
//    if (collectArray.count > 0) {
        [dic setValue:collectArray forKey:@"collect"];
//    }
    
    [dic writeToFile:FILE_APP_SET atomically:YES];
    
}

- (void)saveClassifyData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    if (classifyArray.count > 0) {
        [dic setValue:classifyArray forKey:@"classify"];
    }
    
    [dic writeToFile:FILE_APP_SET atomically:YES];
    
}

- (void)saveHistoryData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
//    NSLog(@">>>%@",historyArray);
    if (historyArray.count > 0) {
        [dic setValue:historyArray forKey:@"historyNew"];
    }
    
    [dic writeToFile:FILE_APP_SET atomically:YES];
    
}

- (void)saveHomeCategoryData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
//    NSLog(@">>>%@",homeCategoryArray);
    if (homeCategoryArray.count > 0) {
        [dic setValue:homeCategoryArray forKey:@"homeCategory"];
    }
    
    [dic writeToFile:FILE_APP_SET atomically:YES];
    
}

- (void)saveHomeGoodsData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
//    NSLog(@">>>%@",homeGoodsDataArray);
    if (homeGoodsDataArray.count > 0) {
        [dic setValue:homeGoodsDataArray forKey:@"homeGoods"];
    }
    
    [dic writeToFile:FILE_APP_SET atomically:YES];
    
}

- (void)saveHomeNewData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
//    NSLog(@">>>%@ ,array.count=%d",homeNewDataArray,(int)homeNewDataArray.count);
    if (homeNewDataArray.count > 0) {
        
        [dic setValue:homeNewDataArray forKey:@"homeNewDataArray"];
        
    }
    
    NSLog(@"保存成功与否=%d",[dic writeToFile:FILE_APP_SET atomically:YES]);
    
}

- (void)saveHomeNewADArray
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    if (homeNewADArray.count > 0) {
        
        [dic setValue:homeNewADArray forKey:@"homeNewADArray"];
        
    }
    
    NSLog(@"首页广告 保存成功与否=%d",[dic writeToFile:FILE_APP_SET atomically:YES]);
    
}

- (void)saveBBSData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    if (BBSArray.count > 0) {
        [dic setValue:BBSArray forKey:@"BBSArray"];
    }
    
    NSLog(@"保存成功与否=%d",[dic writeToFile:FILE_APP_SET atomically:YES]);
    
}

- (void)saveMyBBSData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    if (MyBBSArray.count > 0) {
        [dic setValue:MyBBSArray forKey:@"MyBBSArray"];
    }
    
    [dic writeToFile:FILE_APP_SET atomically:YES];
    
}
- (void)saveHotBBSList
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    
    if (hotBBSList.count > 0) {
        [dic setValue:hotBBSList forKey:@"hotBBSList"];
    }
    
    NSLog(@"保存最热帖子 成功与否=%d",[dic writeToFile:FILE_APP_SET atomically:YES]);
}



- (void)saveBBSADList
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    
    if (BBSADList.count > 0) {
        [dic setValue:BBSADList forKey:@"BBSADList"];
    }
    
    NSLog(@"保存论坛广告 成功与否=%d",[dic writeToFile:FILE_APP_SET atomically:YES]);
}

- (void)saveNvShenDaoGouListArray
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    
    if (nvShenDaoGouListArr.count > 0) {
        [dic setValue:nvShenDaoGouListArr forKey:@"nvShenDaoGouListArr"];
    }
    
    NSLog(@"保存女神导购 成功与否=%d",[dic writeToFile:FILE_APP_SET atomically:YES]);
}


- (void)saveShopCarData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    if ([[NSFileManager defaultManager] fileExistsAtPath:FILE_APP_SET])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:FILE_APP_SET];
        dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    
    if (shopCarData.count > 0) {
        [dic setValue:shopCarData forKey:@"shopCarData"];
    }
    
    NSLog(@"保存购物车 成功与否=%d",[dic writeToFile:FILE_APP_SET atomically:YES]);
}



-(BOOL)application:(UIApplication*)application openURL : (NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return YES;
}


@end
