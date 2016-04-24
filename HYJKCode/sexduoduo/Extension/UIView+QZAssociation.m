//
//  UIView+QZAssociation.m
//  sexduoduo
//
//  Created by showm on 15/10/14.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "UIView+QZAssociation.h"

#import <objc/runtime.h>
@implementation UIView (QZAssociation)

#undef   KEY_QZTAGSTRING
#define KEY_QZTAGSTRING     "UIView.qzTagString"


- (NSString *)qzTagString {
    
    NSObject *obj = objc_getAssociatedObject(self, KEY_QZTAGSTRING);
    if (obj && [obj isKindOfClass:[NSString class]]) {
        return (NSString *)obj;
    }
    return nil;
}

- (void)setQzTagString:(NSString *)value {
    objc_setAssociatedObject(self, KEY_QZTAGSTRING, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)subViewWithQzTagString:(NSString *)value {
    if (nil == value) {
        return nil;
    }
    
    for (UIView *subview in self.subviews) {
        NSString *tag = subview.qzTagString;
        if ([tag isEqualToString:value])
        {
            return subview;
        }
    }
    return nil;
}

@end
