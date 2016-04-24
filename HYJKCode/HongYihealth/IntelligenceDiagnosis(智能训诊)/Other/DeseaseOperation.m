//
//  DeseaseOperation.m
//  
//
//  Created by apple on 16/1/20.
//
//

#import "DeseaseOperation.h"
#import "UserOperation.h"

@implementation DeseaseOperation


+ (void)getDeseaseCategory:(void(^)(NSArray *deseaseArry))succeed failed:(void(^)())failed
{
    NSString *path = @"/category";
    [AFHTTPClient postJSONPath:path httpHost:HOST  parameters:nil success:^(id responseObject) {
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *dataArry = responseDict[@"data"];
        NSMutableArray *deseaseArry = [NSMutableArray array];
        for (NSDictionary *dict in dataArry) {
            Desease *desease = [Desease deseaseWithDict:dict];
            [deseaseArry addObject:desease];
        }
        succeed(deseaseArry);
        
    } fail:^{
        failed();
        NSNotification *noti = [[NSNotification alloc] initWithName:NoNet object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:noti];
    }];
}

@end
