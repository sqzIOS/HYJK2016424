//
//  LYGlobalDefine.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/11.
//  Copyright (c) 2015年 dsz. All rights reserved.
//

#import "LYGlobalDefine.h"

//屏幕分辨率
static CGFloat deviceWH = 0;
//屏幕基准
static CGFloat screensize = 0;
//字号
static CGFloat SuperLarge_Size = 0;
static CGFloat ExtraLarge_Size = 0;
static CGFloat Large_Size = 0;
static CGFloat Middle_Size = 0;
static CGFloat Small_Size = 0;

#define device_320_480 (320*480)    //iphone4
#define device_320_568 (320*568)    //iphone5,5c,5s
#define device_375_667 (375*667)    //iphone6
#define device_414_736 (414*736)    //iphone6p

/**
 iphone4字号
 **/
//超大号
#define device_320_480_Font_SuperLarge_Size 20
//较大号
#define device_320_480_Font_ExtraLarge_Size 18
//大号
#define device_320_480_Font_Large_Size 16
//中号
#define device_320_480_Font_Middle_Size 14
//小号
#define device_320_480_Font_Small_Size 13

/**
 iphone5,5c,5s字号
 **/
//超大号
#define device_320_568_Font_SuperLarge_Size 21
//较大号
#define device_320_568_Font_ExtraLarge_Size 19
//大号
#define device_320_568_Font_Large_Size 17
//中号
#define device_320_568_Font_Middle_Size 15
//小号
#define device_320_568_Font_Small_Size 14

/**
 iphone6字号
 **/
//超大号
#define device_375_667_Font_SuperLarge_Size 22
//较大号
#define device_375_667_Font_ExtraLarge_Size 20
//大号
#define device_375_667_Font_Large_Size 18
//中号
#define device_375_667_Font_Middle_Size 16
//小号
#define device_375_667_Font_Small_Size 15

/**
 iphone6p字号
 **/
//超大号
#define device_414_736_Font_SuperLarge_Size 23
//较大号
#define device_414_736_Font_ExtraLarge_Size 21
//大号
#define device_414_736_Font_Large_Size 19
//中号
#define device_414_736_Font_Middle_Size 17
//小号
#define device_414_736_Font_Small_Size 16


@implementation LYGlobalDefine

/*
 *获取iphone手机型号
 *返回 4，5，6，61....
 */
+(NSInteger)getIphoneModel
{
    if (deviceWH == 0) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        deviceWH = size.width*size.height;
    }
    
    if (deviceWH == device_320_480) {
        return 4;
    } else if (deviceWH == device_320_568) {
        return 5;
    } else if (deviceWH == device_375_667) {
        return 6;
    } else if (deviceWH == device_414_736) {
        return 61;
    } else {
        return 4;
    }
}
/**
 获取字号
 type:1表示Font_SuperLarge_Size,2表示Font_ExtraLarge_Size,3表示Font_Large_Size,4表示Font_Middle_Size,5表示Font_Small_Size
 其它值无效
 **/
+(CGFloat)getFontSize:(NSInteger)type
{
    switch (type) {
        case 1: {
            if (SuperLarge_Size > 0) {
                return SuperLarge_Size;
            }
            break;
        }
        case 2: {
            if (ExtraLarge_Size > 0) {
                return ExtraLarge_Size;
            }
            break;
        }
        case 3: {
            if (Large_Size > 0) {
                return Large_Size;
            }
            break;
        }
        case 4: {
            if (Middle_Size > 0) {
                return Middle_Size;
            }
            break;
        }
        case 5: {
            if (Small_Size > 0) {
                return Small_Size;
            }
            break;
        }
        default:
            break;
    }
    
    if (deviceWH == 0) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        deviceWH = size.width*size.height;
    }
    
    if (deviceWH == device_320_480) {
        SuperLarge_Size = device_320_480_Font_SuperLarge_Size;
        ExtraLarge_Size = device_320_480_Font_ExtraLarge_Size;
        Large_Size = device_320_480_Font_Large_Size;
        Middle_Size = device_320_480_Font_Middle_Size;
        Small_Size = device_320_480_Font_Small_Size;
    } else if (deviceWH == device_320_568) {
        SuperLarge_Size = device_320_568_Font_SuperLarge_Size;
        ExtraLarge_Size = device_320_568_Font_ExtraLarge_Size;
        Large_Size = device_320_568_Font_Large_Size;
        Middle_Size = device_320_568_Font_Middle_Size;
        Small_Size = device_320_568_Font_Small_Size;
    } else if (deviceWH == device_375_667) {
        SuperLarge_Size = device_375_667_Font_SuperLarge_Size;
        ExtraLarge_Size = device_375_667_Font_ExtraLarge_Size;
        Large_Size = device_375_667_Font_Large_Size;
        Middle_Size = device_375_667_Font_Middle_Size;
        Small_Size = device_375_667_Font_Small_Size;
    } else if (deviceWH == device_414_736) {
        SuperLarge_Size = device_414_736_Font_SuperLarge_Size;
        ExtraLarge_Size = device_414_736_Font_ExtraLarge_Size;
        Large_Size = device_414_736_Font_Large_Size;
        Middle_Size = device_414_736_Font_Middle_Size;
        Small_Size = device_414_736_Font_Small_Size;
    } else {
        SuperLarge_Size = device_320_480_Font_SuperLarge_Size;
        ExtraLarge_Size = device_320_480_Font_ExtraLarge_Size;
        Large_Size = device_320_480_Font_Large_Size;
        Middle_Size = device_320_480_Font_Middle_Size;
        Small_Size = device_320_480_Font_Small_Size;
    }
    
    switch (type) {
        case 1: {
            if (SuperLarge_Size > 0) {
                return SuperLarge_Size;
            }
            break;
        }
        case 2: {
            if (ExtraLarge_Size > 0) {
                return ExtraLarge_Size;
            }
            break;
        }
        case 3: {
            if (Large_Size > 0) {
                return Large_Size;
            }
            break;
        }
        case 4: {
            if (Middle_Size > 0) {
                return Middle_Size;
            }
            break;
        }
        case 5: {
            if (Small_Size > 0) {
                return Small_Size;
            }
            break;
        }
        default:
            break;
    }
    
    return device_320_480_Font_Middle_Size;
}
/*
 **以6为基类， 适配 其他屏幕
 */
+(CGFloat)getScreenSize:(NSInteger)size
{
//    return size * 1.0;
    
    if (screensize > 0) {
        return size* screensize;
    }
    
    if (deviceWH == 0) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        deviceWH = size.width*size.height;
    }
    if (deviceWH == device_320_480) {
        screensize = (320/375.0);
    } else if (deviceWH == device_320_568) {
        screensize = (320/375.0);
    } else if (deviceWH == device_375_667) {
        screensize = 1.0;
    } else if (deviceWH == device_414_736) {
        screensize = (414/375.0);
    } else {
        screensize = 1.0;
    }
    return size * screensize;
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
                                      options:NSStringDrawingUsesLineFragmentOrigin
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



@end
