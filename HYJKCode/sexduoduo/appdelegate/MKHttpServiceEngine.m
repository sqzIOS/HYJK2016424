//
//  MKHttpServiceEngine.m
//  sexduoduo
//
//  Created by showm on 14-5-28.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//

#import "MKHttpServiceEngine.h"

@implementation MKHttpServiceEngine

+(id)shareMyInstance
{
    static MKHttpServiceEngine *sharedClient=nil;
    static dispatch_once_t   p;
    dispatch_once(&p,^{
        
        if ([UserDefaults objectForKey:@"useShopIp"] && [[UserDefaults objectForKey:@"useShopIp"] isEqualToString:@"1"]) {
            useShopIp=YES;
            
        }else if([UserDefaults objectForKey:@"useShopIp"] && [[UserDefaults objectForKey:@"useShopIp"]isEqualToString:@"0"] )
        {
            useShopIp=NO;
        }
        
        
        NSString *str= useShopIp ? SHOPIP1 :SHOPIP;
        
        NSLog(@"商城id或域名=%@",str);
        
        sharedClient = [[MKHttpServiceEngine alloc]initWithHostName:str];
//        [sharedClient useCache];
        
    });
    
    
//    MKHttpServiceEngine *sharedClient=nil;
//    NSString *str= useShopIp ? SHOPIP1 :SHOPIP;
//    NSLog(@"商城id或域名=%@",str);
//    
//    sharedClient = [[MKHttpServiceEngine alloc]initWithHostName:str];
    
    
    
    return sharedClient;
}


//首页分类获取商品列表
-(MKNetworkOperation*) requestHomeGoodListWithWithDic:(NSDictionary*) dic
                         completionHandler:(HttpResponseSuccessIdObject) completionBlock
                                  errorHandler:(MKNKErrorBlock) errorBlock {
    MKNetworkOperation *op = [self operationWithPath:@"/shopxx/shop/goods!getGoodsAppByIt.action"
                                              params:dic
                                          httpMethod:@"POST"];
    [self completionWithNetWorkOperation:op completionHandler:completionBlock errorHandler:errorBlock];

    
    return op;
}

#pragma mark - 下载完成和出错的处理
-(void)completionWithNetWorkOperation:(MKNetworkOperation*)op completionHandler:(HttpResponseSuccessIdObject) completionBlock
                         errorHandler:(MKNKErrorBlock) errorBlock
{
    [op addCompletionHandler:^(MKNetworkOperation* completedOperation) {
        
        //        DLog(@"字符数据%@", [completedOperation responseString]);
        if([completedOperation isCachedResponse]) {
            
            DLog(@"Data from cache");
            [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
                completionBlock(jsonObject);
            }];
            
        }else {
            
            DLog(@"Data from server");
            [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
                completionBlock(jsonObject);
            }];
            
        }
        
        
    }
                errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
                    
                    errorBlock(error);
                }];
    [self enqueueOperation:op];
    
}



@end
