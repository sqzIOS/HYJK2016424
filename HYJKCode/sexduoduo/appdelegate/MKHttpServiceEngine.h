//
//  MKHttpServiceEngine.h
//  sexduoduo
//
//  Created by showm on 14-5-28.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//


#import "MKNetworkEngine.h"

typedef void (^HttpResponseSuccessIdObject)(id responseObject);

@interface MKHttpServiceEngine : MKNetworkEngine

+(id)shareMyInstance;


//获取商品列表
-(MKNetworkOperation*) requestHomeGoodListWithWithDic:(NSDictionary*) dic
                     completionHandler:(HttpResponseSuccessIdObject) completionBlock
                          errorHandler:(MKNKErrorBlock) errorBlock;




@end
