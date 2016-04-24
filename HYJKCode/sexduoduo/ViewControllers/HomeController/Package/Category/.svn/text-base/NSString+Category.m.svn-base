//
//  NSString+Category.m
//  
//
//  Created by sqz on 15/12/2.
//
//
#import "NSString+Category.h"

@implementation NSString (Category)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
