//
//  BrowserWebVC.h
//  Sexduoduo
//
//  Created by ly1992 on 15/5/29.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "LYProgressView.h"

@interface BrowserWebVC : UIViewController

//webView 显示界面
@property(strong, nonatomic) UIWebView *webView;
// URL
@property(copy, nonatomic) NSString *urlString;
//默认取URL的title，如果手动设置了，则不取
@property(copy, nonatomic) NSString *navTitleString;
//进度条
@property(strong, nonatomic) LYProgressView* progressView;
//是否返回
@property(assign,nonatomic) BOOL canGoBack;
/**
 *  展示Web 界面
 *
 *  @param urlString      URL
 *  @param navTitleString Title
 *
 *  @return
 */
- (id)initWithUrlString:(NSString *)urlString navTitleString:(NSString *)navTitleString;
/**
 跳转到外部浏览器页面
 **/
+(void) gotoWebBrowse:(NSString*)url;


@end
