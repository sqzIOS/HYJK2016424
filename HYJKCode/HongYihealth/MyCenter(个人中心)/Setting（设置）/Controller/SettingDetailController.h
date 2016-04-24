//
//  SettingDetailController.h
//  
//
//  Created by wenzhizheng on 16/1/8.
//
//

#import "MyCenterBaseController.h"

@interface SettingDetailController : MyCenterBaseController

+ (instancetype)settingDetailControllerWithTitle:(NSString *)titleStr andAccount:(NSString *)account;
+ (instancetype)settingDetailControllerWithTitle:(NSString *)titleStr;

@end
