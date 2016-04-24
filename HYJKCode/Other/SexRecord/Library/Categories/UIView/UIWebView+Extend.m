//
//  UIWebView+Extend.m
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "UIWebView+Extend.h"

@implementation UIWebView (Extend)

- (void)removeShadow
{
    //Remove that dang shadow.from the UIWebView
    for (UIView *subview in [self.scrollView subviews])
    {
        if ([subview isKindOfClass:[UIImageView class]])
        {
            ((UIImageView *) subview).image = nil;
            subview.backgroundColor = [UIColor clearColor];
        }
    }
}

- (void)makeTransparent
{
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
}

- (void)makeTransparentAndRemoveShadow
{
    [self makeTransparent];
    [self removeShadow];
}

- (void)loadURLString:(NSString *)URLString,...
{
    va_list list;
    va_start(list, URLString);
    NSString* urlStr = [[NSString alloc]initWithFormat:URLString arguments:list];
    va_end(list);
    NSURL *url = [NSURL URLWithString:urlStr];
    [self loadURL:url];
}

- (void)loadURL:(NSURL *)URL
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [self loadRequest:request];
}

- (void)setWebScrollDelegate:(id <UIScrollViewDelegate>)delegate
{
    [self webScrollVIew].delegate = delegate;
}


- (UIScrollView *)webScrollVIew
{
    static UIScrollView *webScrollView = nil;
    @synchronized (self)
    {
        if (nil == webScrollView)
        {
            for (UIScrollView *scrollView in [self subviews])
            {
                if ([scrollView isKindOfClass:[UIScrollView class]])
                {
                    webScrollView = scrollView;
                    break;
                }
            }
        }
    }
    return webScrollView;
}

static UIWebView *callWebView = nil;
+ (void)callNumber:(NSString *)number
{
    //这里本来要要校验电话号码的，但是考虑到各种奇葩号码，什么400啦，国外号码啦，于是乎华丽丽的忽略了。
    if (number.length)
    {
        if (TARGET_IPHONE_SIMULATOR)
        {
            [self quickAlert:number];
        }
        if (!callWebView)
        {
            callWebView = [[UIWebView alloc] init];
        }
        NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:phoneURL];
        [callWebView loadRequest:request];
    }
}

+ (void)quickAlert:(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

@end
