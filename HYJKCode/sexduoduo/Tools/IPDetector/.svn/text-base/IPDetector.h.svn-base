//
//  IPDetector.h
//  WhatIsMyIP
//
//  Created by ly on 14-2-24.
//  Copyright (c) 2014年 ly. All rights reserved.
//
/*
 
 //    [IPDetector getWANIPAddressWithCompletion:^(NSString *IPAddress) {
 //        NSLog(@"外网ip=%@",IPAddress);
 //
 //    }];
 */
#import <Foundation/Foundation.h>

@interface IPDetector : NSObject


+ (void)getLANIPAddressWithCompletion:(void (^)(NSString *IPAddress))completion;

+ (void)getWANIPAddressWithCompletion:(void(^)(NSString *IPAddress))completion;

@end
