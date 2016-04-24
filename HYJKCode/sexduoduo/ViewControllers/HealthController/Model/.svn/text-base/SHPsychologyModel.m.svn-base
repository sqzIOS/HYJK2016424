//
//  SHPsychologyModel.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHPsychologyModel.h"

@implementation SHPsychologyAdInfo

@end

@implementation SHPsychologyAdModel
+ (NSString*)getCachePath
{
    return [NSFileManager pathForCacheFile:[NSString stringWithFormat:@"SHPsychologyModel.json"] inDir:@"SHPsychologyAdModel"];
}
+ (BOOL)setRemoteDataCache:(NSData*)data
{
    if (data == nil || data.length <= 0) {
        return NO;
    }
    NSString* cachePath =  [self getCachePath];
    if ([NSString isBlankString:cachePath]) {
        return NO;
    }
    return [data writeToFile:cachePath atomically:YES];
}

+(SHPsychologyAdModel*)buildModel
{
    SHPsychologyAdModel *m = [[SHPsychologyAdModel alloc]init];
    m.datasource = [[NSMutableArray alloc]init];
    return m;
}

+(void)loadRemoteDataForAdModel:(SHPsychologyAdModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHPsychologyAdModel* model))callback
{
    
}

+(SHPsychologyAdModel*)loadLocalDataForAdModel
{
    
    SHPsychologyAdModel* model = [self buildModel];
    for (int i = 0; i < 1; i++) {
        SHPsychologyAdInfo *info = [[SHPsychologyAdInfo alloc]init];
        info.iconStr = @"xjk_banner3";
        info.idStr = @"1000";
        [model.datasource addObject:info];
    }
    return model;

}
@end

@implementation SHPsychologyInfo

@end

@implementation SHPsychologyModel

+ (NSString*)getCachePath
{
    return [NSFileManager pathForCacheFile:[NSString stringWithFormat:@"SHPsychologyModel.json"] inDir:@"SHPsychologyModel"];
}

+ (BOOL)setRemoteDataCache:(NSData*)data
{
    if (data == nil || data.length <= 0) {
        return NO;
    }
    NSString* cachePath =  [self getCachePath];
    if ([NSString isBlankString:cachePath]) {
        return NO;
    }
    return [data writeToFile:cachePath atomically:YES];
}


+(SHPsychologyModel*)buildModel
{
    SHPsychologyModel *m = [[SHPsychologyModel alloc]init];
    m.datasource = [[NSMutableArray alloc]init];
    return m;
}

+(void)loadRemoteDataForPsychologyModel:(SHPsychologyModel*)model flag:(BOOL)flag cb:(void(^)(BOOL isOK, SHPsychologyModel* model))callback
{
    
    [AFHTTPClient postJSONPath:SHINTERFACE_recommendedCounseling httpHost:sexHealthIP parameters:nil success:^(id responseObject) {
        
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        NSLog(@"心理咨询----%@----心理咨询",dic);
        
        if (dic[@"success"] && [dic[@"success"] intValue]==1) {
            
            NSMutableArray *array = [[NSMutableArray alloc] init];
            for (int i=0; i<[dic[@"datasource"] count]; i++) {
                SHPsychologyInfo *info=[[SHPsychologyInfo alloc] init];
                
                info.iconStr= [NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"headimgurl"]];
                info.nameStr = [NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"name"]];
                info.postStr = [NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"psychologist"]];
                info.addressStr = [NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"area"]];
                info.contentStr = [NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"introduce"]];
                info.idStr = [NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"doctorId"]];
                info.lngStr = [NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"lng"]];
                info.latStr = [NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"lat"]];

                [array addObject:info];
            }
            
            model.datasource = [[NSMutableArray alloc] initWithArray:array];
            
            callback(YES,model);
        }
        
        
    } fail:^{
        
    }];
}

+(SHPsychologyModel*)loadLocalDataForPsychologyModel
{
    SHPsychologyModel* model = [self buildModel];
//    for (int i = 0; i < 5; i++) {
//        SHPsychologyInfo *info = [[SHPsychologyInfo alloc]init];
//        info.iconStr = @"doctor";
//        info.nameStr = @"林大爷";
//        info.postStr = @"主任医师";
//        info.addressStr = @"漳浦霞美镇医院";
//        info.contentStr = @"我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的，我很帅的。";
//        [model.datasource addObject:info];
//    }
    return model;
}
@end
