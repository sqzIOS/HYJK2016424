//
//  NSMutableDictionary+Extend.h
//  Sexduoduo
//
//  Created by ly1992 on 15/5/29.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Extend)
/**
 *  安全判断
 *
 *  @param object
 *  @param key
 */
- (void)setNonNilObject:(id)object forKey:(NSString *)key;
@end
