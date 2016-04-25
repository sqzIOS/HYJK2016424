//
//  CTBanner.m
//  无限循环轮播图
//
//  Created by shown on 16/4/19.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "CTBanner.h"

@interface CTBanner ()<UIScrollViewDelegate>
{
    NSInteger currentIndex;
    NSInteger lastIndex;    //当前图片位置

    // page 点
    UIImage *_currentImage;   //当前点
    UIImage *_otherImage; //其它点
    
    // 定时器
    NSTimer *_currentTimer;

    UIImage* activeImage;
    
    UIImage* inactiveImage;
}
@property (nonatomic, strong) UIScrollView *bannerScrollView;   //

@property (nonatomic, strong) UIImageView *leftImageView;

@property (nonatomic, strong) UIImageView *middleImageView;

@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, strong) UIPageControl *pageC;

@end

@implementation CTBanner

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initView];
    }
    return self;
}

- (void)initView
{
    currentIndex = 0;
    lastIndex = 0;
    
    activeImage = [UIImage imageNamed:@"selected"];
    inactiveImage = [UIImage imageNamed:@"un_selected"];
    
    [self addSubview:self.bannerScrollView];
    [self.bannerScrollView addSubview:self.leftImageView];
    [self.bannerScrollView addSubview:self.middleImageView];
    [self.bannerScrollView addSubview:self.rightImageView];
}

- (void)setupScrllView
{
    if (_imageArr.count < 3)
    {
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
        [_middleImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.firstObject] placeholderImage:DEFAULT_AVATAR];
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
    }
    else
    {
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
        [_middleImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.firstObject] placeholderImage:DEFAULT_AVATAR];
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[1]] placeholderImage:DEFAULT_AVATAR];
    }
    
    _bannerScrollView.contentSize = CGSizeMake(self.bounds.size.width * 3, self.bounds.size.height);
    _bannerScrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
    
    [self addSubview:self.pageC];
    self.pageC.numberOfPages = _imageArr.count;
    [self updateDots];
    [self startTimer];
}

#pragma mark --- NSTimer
/**
 *  启动定时器
 */
- (void)startTimer
{
    _currentTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction
{
    NSInteger page = _bannerScrollView.contentOffset.x / _bannerScrollView.bounds.size.width;
    page = page >= _imageArr.count ? 0 : ++page;
    [_bannerScrollView setContentOffset:CGPointMake(self.bounds.size.width * page, 0) animated:YES];
}

#pragma mark --- <UIScrollViewDelegate>
/**
 *  手动操作滚动触发，即将滚动
 *
 *  @param scrollView
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (_currentTimer)
    {
        [_currentTimer invalidate];
        _currentTimer = nil;
    }
}
/**
 *  手动操作滚动触发，彻底结束滚动
 *
 *  @param scrollView
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (!_currentTimer)
    {
        [self startTimer];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_imageArr.count > 0)
    {
        if (scrollView.contentOffset.x >= scrollView.bounds.size.width * 2)
        {
            currentIndex++;
            _bannerScrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
            if (currentIndex == _imageArr.count - 1)
            {
                if (currentIndex == 0)
                {
                    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
                }
                else
                {
                    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex - 1]] placeholderImage:DEFAULT_AVATAR];
                    
                }
                [_middleImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex]] placeholderImage:DEFAULT_AVATAR];
                [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.firstObject] placeholderImage:DEFAULT_AVATAR];
                lastIndex = currentIndex;
                currentIndex = -1;
            }
            else if (currentIndex == _imageArr.count)
            {
                [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
                [_middleImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.firstObject] placeholderImage:DEFAULT_AVATAR];
                [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[1]] placeholderImage:DEFAULT_AVATAR];
                lastIndex = 0;
                currentIndex = 0;
            }
            else if (currentIndex == 0)
            {
                [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
                [_middleImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.firstObject] placeholderImage:DEFAULT_AVATAR];
                [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[1]] placeholderImage:DEFAULT_AVATAR];
                lastIndex = currentIndex;
            }
            else
            {
                if (currentIndex == 0)
                {
                    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
                }
                else
                {
                    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex - 1]] placeholderImage:DEFAULT_AVATAR];
                    
                }
                [_middleImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex]] placeholderImage:DEFAULT_AVATAR];
                [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex + 1]] placeholderImage:DEFAULT_AVATAR];
                lastIndex = currentIndex;
            }
        }
        else if (scrollView.contentOffset.x <= 0)
        {
            currentIndex--;
            _bannerScrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
            if (currentIndex == -2)
            {
                currentIndex = _imageArr.count - 2;
                if (currentIndex == 0)
                {
                    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
                }
                else
                {
                    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex - 1]] placeholderImage:DEFAULT_AVATAR];

                }
                [_middleImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex]] placeholderImage:DEFAULT_AVATAR];
                [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
                lastIndex = currentIndex;
            }
            else if (currentIndex == -1)
            {
                currentIndex = _imageArr.count - 1;
                if (currentIndex == 0)
                {
                    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
                }
                else
                {
                    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex - 1]] placeholderImage:DEFAULT_AVATAR];
                    
                }
                [_middleImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex]] placeholderImage:DEFAULT_AVATAR];
                [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.firstObject] placeholderImage:DEFAULT_AVATAR];
                lastIndex = currentIndex;
            }
            else if (currentIndex == 0)
            {
                [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
                [_middleImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.firstObject] placeholderImage:DEFAULT_AVATAR];
                [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[1]] placeholderImage:DEFAULT_AVATAR];
                lastIndex = currentIndex;
            }
            else
            {
                if (currentIndex == 0)
                {
                    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr.lastObject] placeholderImage:DEFAULT_AVATAR];
                }
                else
                {
                    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex - 1]] placeholderImage:DEFAULT_AVATAR];
                    
                }
                [_middleImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex]] placeholderImage:DEFAULT_AVATAR];
                [_rightImageView sd_setImageWithURL:[NSURL URLWithString:_imageArr[currentIndex + 1]] placeholderImage:DEFAULT_AVATAR];
                lastIndex = currentIndex;
            }
        }
        
        [self setCurrentPage:lastIndex];
    }
}


-(void) updateDots

{
    for (int i=0; i<[self.pageC.subviews count]; i++) {
        
        UIImageView* dot = (UIImageView *)[self.pageC.subviews objectAtIndex:i];
        
        CGSize size;
        
        size.height = MAKEOF5(6.5);     //自定义圆点的大小
        
        size.width = MAKEOF5(7);      //自定义圆点的大小
        [dot setFrame:CGRectMake(dot.frame.origin.x, dot.frame.origin.y, size.width, size.width)];
        if (i == self.pageC.currentPage) {
            UIColor *bgColor = [UIColor colorWithPatternImage:activeImage];
            dot.backgroundColor = bgColor;
        } else {
            UIColor *bgColor = [UIColor colorWithPatternImage:inactiveImage];
            dot.backgroundColor = bgColor;
        }
    }
    
}

-(void) setCurrentPage:(NSInteger)page
{
    self.pageC.currentPage = page;
    [self updateDots];
}


#pragma mark --- click action

- (void)clickAction
{
    
}

#pragma mark --- setter

- (void)setImageArr:(NSArray *)imageArr
{
    _imageArr = [imageArr copy];
    
    [self setupScrllView];
}

#pragma mark --- getter

- (UIScrollView *)bannerScrollView
{
    if (!_bannerScrollView)
    {
        _bannerScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _bannerScrollView.delegate = self;
        _bannerScrollView.showsHorizontalScrollIndicator = NO;
        _bannerScrollView.showsVerticalScrollIndicator = NO;
        _bannerScrollView.bounces = NO;
        _bannerScrollView.pagingEnabled = YES;
    }
    return _bannerScrollView;
}

- (UIImageView *)leftImageView
{
    if (!_leftImageView)
    {
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _leftImageView.userInteractionEnabled = YES;
//        _leftImageView.clipsToBounds = YES;
//        _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
        [_leftImageView addGestureRecognizer:tap];
    }
    return _leftImageView;
}

- (UIImageView *)middleImageView
{
    if (!_middleImageView)
    {
        _middleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
        _middleImageView.userInteractionEnabled = YES;
//        _middleImageView.clipsToBounds = YES;
//        _middleImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
        [_middleImageView addGestureRecognizer:tap];
    }
    return _middleImageView;
}

- (UIImageView *)rightImageView
{
    if (!_rightImageView)
    {
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width * 2, 0, self.bounds.size.width, self.bounds.size.height)];
        _rightImageView.userInteractionEnabled = YES;
//        _rightImageView.clipsToBounds = YES;
//        _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
        [_rightImageView addGestureRecognizer:tap];
    }
    return _rightImageView;
}

- (UIPageControl *)pageC
{
    if (_pageC == nil)
    {
        _pageC = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.height - MAKEOF5(30), SCREEN_WIDTH, MAKEOF5(30))];
        _pageC.currentPage = 0;
        _pageC.currentPageIndicatorTintColor = colorWith01;
        _pageC.pageIndicatorTintColor = colorWithClear;
    }
    return _pageC;
}

@end
