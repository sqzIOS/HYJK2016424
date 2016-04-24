//
//  NSString+extend.h
//  
//
//  Created by apple on 16/1/18.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (extend)


/**
 * 返回图片的base64字符串编码
 * @compress 压缩质量
 */
+ (NSString *)stringWithImageBybase64Encoding:(UIImage *)image andCompress:(float)compress;


/**
 * 根据font和maxSize 计算文字占据的真实尺寸
 */
+ (CGSize)sizeOfString:(NSString *)string withFont:(UIFont *)font andMaxSize:(CGSize)maxSize;


@end
