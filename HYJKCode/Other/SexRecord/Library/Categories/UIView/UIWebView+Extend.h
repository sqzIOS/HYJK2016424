//
//  UIWebView+Extend.h
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (Extend)

+ (void)callNumber:(NSString *)number;

- (void)removeShadow;

- (void)makeTransparent;

- (void)makeTransparentAndRemoveShadow;

- (void)loadURLString:(NSString *)URLString,...;

- (void)loadURL:(NSURL *)URL;

- (void)setWebScrollDelegate:(id <UIScrollViewDelegate>)delegate;

- (UIScrollView *)webScrollVIew;

@end
