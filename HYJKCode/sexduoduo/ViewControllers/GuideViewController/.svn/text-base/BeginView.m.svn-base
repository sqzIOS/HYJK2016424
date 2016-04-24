//
//  BeginView.m
//  Putian Mobile
//
//  Created by app on 13-12-5.
//  Copyright (c) 2013年 Lai fenghai. All rights reserved.
//

#import "BeginView.h"
#import "AppDelegate.h"

@implementation BeginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [self setBeginView];
        
        self.backgroundColor = [UIColor whiteColor];
        [self initGuideView];
        
        if (IOS7_OR_LATER) {
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
        }else
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        
    }
    return self;
}

//弃用
-(void)setBeginView
{
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20,SCREEN_WIDTH, SCREEN_HEIGHT)];
    imageView.image = [UIImage imageNamed:@"begin.png"];
    [self addSubview:imageView];
    
    UIButton *beginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    beginBtn.frame = CGRectMake(110, 300, 100, 35);
    [beginBtn setTitle:@"领取10惠币" forState:UIControlStateNormal];
    [beginBtn setBackgroundImage:[UIImage imageNamed:@"btn_orange_nor.png"] forState:UIControlStateNormal];
    [beginBtn addTarget:self action:@selector(getCoinBeginApp) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:beginBtn];
    
    
    
}

-(void)getCoinBeginApp
{
    [self removeFromSuperview];
    
}

-(void)initGuideView
{
    // 初始化 scrollview
    if (IOS7_OR_LATER) {
        self.guideScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, [UIScreen mainScreen].applicationFrame.size.height + 20)];
    }else
        self.guideScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, [UIScreen mainScreen].applicationFrame.size.height)];
    
    self.guideScrollView.bounces = YES;
    self.guideScrollView.pagingEnabled = YES;
    self.guideScrollView.delegate = self;
    self.guideScrollView.userInteractionEnabled = YES;
    self.guideScrollView.showsHorizontalScrollIndicator = NO;
    self.guideScrollView.showsVerticalScrollIndicator = NO;
//    self.guideScrollView.alwaysBounceVertical = YES;
//    self.guideScrollView.alwaysBounceHorizontal = NO;
    [self addSubview:self.guideScrollView];
    
    
    // 初始化 pagecontrol
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].applicationFrame.size.height, SCREEN_WIDTH, 10)];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:35/255.f green:150/255.f blue:226/255.f alpha:1.0]];
    [self.pageControl setPageIndicatorTintColor:[UIColor colorWithRed:232/255.f green:232/255.f blue:232/255.f alpha:1.0]];
    self.pageControl.numberOfPages = [self.slideImages count];
    self.pageControl.currentPage = 0;
    self.pageControl.hidden = YES;
    [self.pageControl addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.pageControl];
    
    
    
    [self initContentView];
    
    
    
}




-(void)initContentView
{
    // 初始化 数组 并添加四张图片

    if (IS_SexDuoDuo) {
        if(SCREEN_HEIGHT>480)
        {
            self.slideImages = [[NSMutableArray alloc] init];
            [self.slideImages addObject:@"first-568h@2x.png"];
            [self.slideImages addObject:@"second-568h@2x.png"];
            [self.slideImages addObject:@"thirst-568h@2x.png"];
            [self.slideImages addObject:@"fourth-568h@2x.png"];
            //        [self.slideImages addObject:@"fifth-568h@2x.png"];
            
        }else
        {
            self.slideImages = [[NSMutableArray alloc] init];
            [self.slideImages addObject:@"first.png"];
            [self.slideImages addObject:@"second.png"];
            [self.slideImages addObject:@"thirst.png"];
            [self.slideImages addObject:@"fourth.png"];
            //        [self.slideImages addObject:@"fifth.png"];
            
        }
    } else {
        if(SCREEN_HEIGHT>480)
        {
            self.slideImages = [[NSMutableArray alloc] init];
            [self.slideImages addObject:@"health1@2x"];
            [self.slideImages addObject:@"health2@2x"];
            [self.slideImages addObject:@"health3@2x"];
            [self.slideImages addObject:@"health4@2x"];
        }else
        {
            self.slideImages = [[NSMutableArray alloc] init];
            [self.slideImages addObject:@"health1"];
            [self.slideImages addObject:@"health2"];
            [self.slideImages addObject:@"health3"];
            [self.slideImages addObject:@"health4"];
        }
    }
    
    int adsCount = (int)[self.slideImages count];
    for(int i=0;i<adsCount;i++)
    {
        NSString *str=[self.slideImages objectAtIndex:i];
        
        
        UIImageView *contentImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, self.guideScrollView.frame.size.height)];
        [contentImageView setImage:[UIImage imageNamed:str]];

        contentImageView.backgroundColor = [UIColor clearColor];
        [self.guideScrollView addSubview:contentImageView];
        
    }
    
    self.guideScrollView.scrollEnabled = YES;
    self.guideScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*adsCount,[UIScreen mainScreen].applicationFrame.size.height);
    self.pageControl.numberOfPages = adsCount;
    
    UIButton *beginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [beginBtn setBackgroundImage:[UIImage imageNamed:@"begin_btn.png"] forState:UIControlStateNormal];
    [beginBtn addTarget:self action:@selector(startUseApp) forControlEvents:UIControlEventTouchUpInside];
    
    if(IS_IPHONE_5)
    {
        beginBtn.frame = CGRectMake(SCREEN_WIDTH * (adsCount - 1) , 0 ,SCREEN_WIDTH, SCREEN_HEIGHT);
    }else
    {
        beginBtn.frame = CGRectMake(SCREEN_WIDTH * (adsCount - 1) , 0 , SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    
    [self.guideScrollView addSubview:beginBtn];
    
    
    
    
}

-(void)startUseApp
{
//    [self removeFromSuperview];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setBool:YES forKey:@"noFirstLogin"];
//    [defaults synchronize];
    
    [self removeFromSuperview];
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [app setUpCustomTab];
    
    [[AppSet shareInstance] saveNewFunFlag];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
}

// scrollview 委托函数

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.guideScrollView)
    {
        CGFloat pageWidth = self.guideScrollView.frame.size.width;
        int page = floor((self.guideScrollView.contentOffset.x - pageWidth / 2) /pageWidth) +1;
        self.pageControl.currentPage = page;
        
        
       
    }
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"srcollView.contentOffSet.x=%f",scrollView.contentOffset.x);
    if (scrollView.contentOffset.x>= SCREEN_WIDTH*([self.slideImages count] -1)) {
        [self startUseApp];
    }
}



// pagecontrol 选择器的方法
- (void)turnPage
{
    
    int page = (int)self.pageControl.currentPage;
	CGRect frame = self.guideScrollView.frame;
	frame.origin.x = frame.size.width * page;
	[self.guideScrollView scrollRectToVisible:frame animated:YES];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
