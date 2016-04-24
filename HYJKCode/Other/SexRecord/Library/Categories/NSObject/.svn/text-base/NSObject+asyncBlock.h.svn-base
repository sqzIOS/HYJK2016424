//
//  NSObject+asyncBlock.h
//  Sexduoduo
//
//  Created by ly1992 on 15/5/30.
//  Copyright (c) 2015年 ly. All rights reserved.
//  Block 异步回调

#import <Foundation/Foundation.h>

@interface NSObject (asyncBlock)

- (void)asyncBlock:(void (^)(void))block;

+ (void)asyncBlock:(void (^)(void))block;

- (void)asyncBlock:(void (^)(void))block afterSecond:(double)second;

+ (void)asyncBlock:(void (^)(void))block afterSecond:(double)second;

- (void)asyncMainBlock:(void (^)(void))block;

+ (void)asyncMainBlock:(void (^)(void))block;

- (void)asyncMainBlock:(void (^)(void))block afterSecond:(double)second;

+ (void)asyncMainBlock:(void (^)(void))block afterSecond:(double)second;

@end
