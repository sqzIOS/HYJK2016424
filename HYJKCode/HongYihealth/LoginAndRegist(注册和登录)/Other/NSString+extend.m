//
//  NSString+extend.m
//  
//
//  Created by apple on 16/1/18.
//
//

#import "NSString+extend.h"

@implementation NSString (extend)


#pragma mark - 返回图片的base64字符串编码
+ (NSString *)stringWithImageBybase64Encoding:(UIImage *)image andCompress:(float)compress
{
    NSData *imageData = UIImageJPEGRepresentation(image, compress);
    NSString *str = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return str;
}

#pragma mark - 根据font和maxSize 计算文字占据的真实尺寸
+ (CGSize)sizeOfString:(NSString *)string withFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size;
}



@end
