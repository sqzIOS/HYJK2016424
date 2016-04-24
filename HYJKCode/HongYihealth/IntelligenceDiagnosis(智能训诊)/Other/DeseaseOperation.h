//
//  DeseaseOperation.h
//  
//
//  Created by apple on 16/1/20.
//
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"
#import "Desease.h"
#import "ShareData.h"

@interface DeseaseOperation : NSObject

+ (void)getDeseaseCategory:(void(^)(NSArray *deseaseArry))succeed failed:(void(^)())failed;

@end
