//
//  NSDictionary+QZCategory.h
//  sexduoduo
//
//  Created by showm on 15/12/2.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (QZCategory)
/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString ;


@end
