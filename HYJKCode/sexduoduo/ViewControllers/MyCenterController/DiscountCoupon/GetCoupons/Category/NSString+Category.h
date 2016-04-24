//
//  NSString+Category.h
//  
//
//  Created by sqz on 15/12/2.
//
//

#import <UIKit/UIKit.h>

@interface NSString (Category)

/** 通过字体计算文字占用的size */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
