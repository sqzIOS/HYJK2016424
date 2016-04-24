//
//  NSString+QZCategory.m
//  sexduoduo
//
//  Created by showm on 15/9/1.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "NSString+QZCategory.h"
#import "RegexKitLite.h"

@implementation NSString (QZCategory)

#pragma mark - 实例方法
//清除html标签
- (NSString *)clearHtmlTag
{
    NSString *str = [NSString stringWithFormat:@"%@", self];
    NSString *regEx = @"<([^>]*)>";
    str = [str stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    str = [str stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
    str = [str stringByReplacingOccurrencesOfRegex:regEx withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];//网页的空格占位符
    str = [str stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];//"
    return str;
}




#pragma mark - 类方法


+(NSAttributedString *)attributedStringWithHtml:(NSString *)html
{
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSMutableAttributedString *attrString=[[NSMutableAttributedString alloc] initWithData:[html dataUsingEncoding:NSUnicodeStringEncoding allowLossyConversion:YES] options:options documentAttributes:nil error:nil];
    return attrString;
    
}


/**
 *  获取字体的大小范围
 */
+(CGSize)getTextContent:(NSString*)text withFont:(UIFont*)font
{
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
    
}
/**
 *  获取字体的大小范围
 *  多行显示
 */
+(CGSize)getTextMultilineContent:(NSString*)text withFont:(UIFont*)font withSize:(CGSize)size
{
    CGSize mSize = [text boundingRectWithSize:size
                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName:font}
                                      context:nil].size;
    return mSize;
}

/**
 文字局部变色
 **/
+(void)setLableText:(UILabel*)label attribute:(NSString*)attribute instr:(NSString*)str withColor:(UIColor*)color
{
    NSRange matchRange = [str rangeOfString:attribute];
    if (matchRange.location != NSNotFound) {
        NSMutableAttributedString *attributestr = [[NSMutableAttributedString alloc] initWithString:str];
        [attributestr addAttribute:NSForegroundColorAttributeName value:color range:matchRange];
        label.attributedText = attributestr;
    } else {
        label.text = str;
    }
}



// 清除前后空格
+ (NSString *)clearWhiteSpace:(NSString *)text
{
    
    
    NSString *str=[text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return str;
}

//清除前后空格 和 换行字符
+ (NSString *)clearWhiteSpaceAndNewLine:(NSString *)text
{
    NSString *str=[text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return str;
}



@end
