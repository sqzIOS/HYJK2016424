//
//  BrowserWebVC.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/29.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "BrowserWebVC.h"
#import "UIWebView+Extend.h"

@interface BrowserWebVC () <UIWebViewDelegate,UIGestureRecognizerDelegate>

@property(assign, nonatomic) BOOL firstLoad;

@property(assign, nonatomic) BOOL isFailed;

@property(assign, nonatomic) CGPoint tapPoint;

@end

@implementation BrowserWebVC

- (id)initWithUrlString:(NSString *)urlString navTitleString:(NSString *)navTitleString
{
    self = [super init];
    if (self)
    {
        self.urlString = urlString;
        self.navTitleString = navTitleString;
        self.firstLoad = YES;
        self.canGoBack = YES;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_navTitleString)
    {
        self.navigationItem.title = _navTitleString;
    }
    else
    {
        [self.view addSubview:[UIView bolang]];
    }
    if (_urlString)
    {
        NSString *joinChar = nil;
        if ([_urlString rangeOfString:@"?"].length > 0)
        {
            joinChar = @"&";
        }
        else
        {
            joinChar = @"?";
        }
        
        NSString *strURL = _urlString;
        NSURL *url = [NSURL URLWithString:strURL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
}

//返回
-(void)leftBarButtonItemTouchUpInside:(id)sender
{
    if ([_webView canGoBack] && _canGoBack) {
        [_webView goBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark ---加载中....
- (void)loadView
{
    [super loadView];
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    [self.view addSubview:_webView];
    [self showProgressView];
}

#pragma mark ---加载中....进度条
-(void)showProgressView
{
    if (_progressView == nil) {
        CGRect vrc = _webView.frame;
        CGRect rc = CGRectMake(vrc.origin.x, vrc.origin.y, vrc.size.width, 3);
        _progressView = [[LYProgressView alloc] initWithFrame:rc];
        _progressView.lb_text.hidden = YES;
        _progressView.hidden = YES;
        [self.view addSubview:_progressView];
    }
    
    _progressView.hidden = NO;
    if (_progressView.progress >= 1.0) {
        _progressView.hidden = YES;
        return;
    } else {
        _progressView.progress += 0.05;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showProgressView];
    });
}

#pragma mark ---加载完成
-(void)hiddenProgressView
{
    _progressView.progress = 1.0;
}

#pragma mark ---Web Delegate 
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *currentURL= webView.request.URL.absoluteString;
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if (title.length >= 3) {
        NSString *substring = [title substringToIndex:3];
        if ([NSString isPureInt:substring]) {
            if (substring.intValue >= 400) {
                [self webView:webView didFailLoadWithError:nil];
                return;
            }
        }
    }
    _firstLoad = NO;
    if (!_navTitleString) {
        self.navigationItem.title = title;
    }
    if (![NSString isBlankString:currentURL]) {
        _urlString = currentURL;
    }
    NSString *meta = [NSString stringWithFormat:@"document.getElementsByName(\"viewport\")[0].content = \"width=%f, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\"", webView.frame.size.width];
    [webView stringByEvaluatingJavaScriptFromString:meta];
    [webView.scrollView setContentSize:CGSizeMake(self.view.width, webView.scrollView.contentSize.height)];
    
    [self hiddenProgressView];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    self.isFailed = YES;
    if (!_navTitleString && error.code != 101)
    {
        self.navigationItem.title = NSLocalizedString(@"加载失败", nil);
    }
    if (_firstLoad)
    {
        
    } else {
//        [DoAlertView showToastMessage:error.localizedFailureReason];
    }

    [self hiddenProgressView];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    if (_firstLoad)
    {
        [self asyncMainBlock:^{
            if (!_isFailed)
            {
            }
        } afterSecond:1];
    }
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return [BrowserWebVC handleCustomWebViewEvent:webView request:request];
}

/**
 处理客户端与wap定义的时间
 **/
+(BOOL)handleCustomWebViewEvent:(UIWebView *)webView request:(NSURLRequest *)request
{
    if (request && request.URL && request.URL.absoluteString && ![NSString isBlankString:request.URL.absoluteString]) {
        if ([self handleCustomExtenalLink:request.URL webView:webView]) {
            return NO;
        }
    }
    return YES;
}

#pragma mark ---自定义外部链接,需要跳转到系统浏览器
+(BOOL)handleCustomExtenalLink:(NSURL*)nsurl webView:(UIWebView *)webView
{
    NSRange range = [nsurl.absoluteString rangeOfString:@"banketime=out"];
    if (range.location != NSNotFound) {
        [BrowserWebVC gotoWebBrowse:nsurl.absoluteString];
        return YES;
    }
    range = [nsurl.absoluteString rangeOfString:@"&istaobao=1"];
    if (range.location != NSNotFound) {
        NSString *requrl = [nsurl.absoluteString stringByReplacingOccurrencesOfString:@"&istaobao=1" withString:@""];
         [BrowserWebVC gotoWebBrowse:requrl];
        return YES;
    }
    return NO;
}
#pragma mark --- 跳转到外部浏览器页面
+(void) gotoWebBrowse:(NSString*)url
{
    if ([NSString isBlankString:url]) {
        return;
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

#pragma mark --- didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
