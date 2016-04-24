//
//  SHCopeDetailVC.h
//  sexduoduo
//
//  Created by shown on 15/8/31.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  科普知识详情

#import <UIKit/UIKit.h>
#import "SHRootVC.h"
@interface SHCopeDetailVC : SHRootVC

@property(strong, nonatomic)NSString *idStr;
+(void)gotoMySelf:(id)pvc withIdStr:(NSString *)idStr;

@end
