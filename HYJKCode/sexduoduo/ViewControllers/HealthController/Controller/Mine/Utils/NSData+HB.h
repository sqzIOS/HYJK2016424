//
//  NSData+HB.h
//  XingJiaBi
//
//  Created by Soldier on 15-1-30.
//  Copyright (c) 2015年 Xiamen Haibao Info. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (HB)

- (NSString *)md5Hash;

- (NSString *)sha1Hash;

+ (NSData *)dataWithBase64EncodedString:(NSString *)string;

- (NSString *)base64Encoding;

@end
