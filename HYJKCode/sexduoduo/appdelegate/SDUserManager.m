//
//  SDUserManager.m
//  sexduoduo
//
//  Created by showm on 15/11/19.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SDUserManager.h"
#import "GeTuiSdk.h"
@implementation SDUserManager

+(void)userLogOut
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"isLogin"];
    [defaults removeObjectForKey:@"userName"];
    [defaults removeObjectForKey:@"password"];

    [defaults removeObjectForKey:@"userSex"];
    [defaults removeObjectForKey:@"userId"];
    [defaults removeObjectForKey:@"isDoctor"];
    [defaults removeObjectForKey:@"doctorId"];
    
    [defaults removeObjectForKey:@"nickname"];

    [defaults synchronize];
    
       
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateMyCenterView" object:nil];
    
}

+(void)userLoginOperation
{

}

#pragma mark  刷新收藏
+(void)refreshCollectList
{
   
}
@end
