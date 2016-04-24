//
//  NSDictionary+Extend.h
//  Sexduoduo
//
//  Created by ly1992 on 15/5/29.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extend)
/**
 *   安全判断
 *  @return
 */
- (id)safeObjectForKey:(id)key;
@end
