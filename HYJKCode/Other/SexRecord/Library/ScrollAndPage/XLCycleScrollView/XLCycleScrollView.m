//
//  XLCycleScrollView.m
//  CycleScrollViewDemo
//
//  Created by xie liang on 9/14/12.
//  Copyright (c) 2012 xie liang. All rights reserved.
//

#import "XLCycleScrollView.h"
#import "StyledPageControl.h"

@interface XLCycleScrollView ()
{
    
}
@property(strong, nonatomic) NSMutableArray *cacheViews;
@property(strong, nonatomic) NSTimer *scrollTimer;
@end

@implementation XLCycleScrollView

@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;
@synthesize currentPage = _curPage;
@synthesize autoScroll = _autoScroll;
@synthesize autoScrollDuration = _autoScrollDuration;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(self.bounds.size.width * 3, self.bounds.size.height);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
        _scrollView.pagingEnabled = YES;
        [self addSubview:_scrollView];

        CGRect rect = self.bounds;
        rect.origin.y = rect.size.height - 25;
        rect.size.height = 25;
        _pageControl = [[StyledPageControl alloc] initWithFrame:rect];
        _pageControl.coreNormalColor = RGBCOLOR(169, 169, 169);
        _pageControl.coreSelectedColor = RGBCOLOR(255, 101, 1);
        _pageControl.userInteractionEnabled = NO;
        _pageControl.hidesForSinglePage = YES;

        [self addSubview:_pageControl];
        
        _curPage = 0;

        _imageViewNull = [[UIImageView alloc] initWithFrame:self.bounds];
//        _imageViewNull.backgroundColor = RGBCOLOR(238, 238, 238);
//        [_imageViewNull setImage:[UIImage imageNamed:@"meetyou_one"]];
//        _imageViewNull.contentMode = UIViewContentModeCenter;
//        _imageViewNull.userInteractionEnabled = NO;
//        [self addSubview:_imageViewNull];

    }
    return self;
}

- (void)setAutoScrollDuration:(NSTimeInterval)autoScrollDuration
{
    _autoScrollDuration = autoScrollDuration;
    [self starTimer];
}

- (void)setDataource:(id <XLCycleScrollViewDatasource>)datasource
{
    _datasource = datasource;
    [self reloadData];
}

- (void)reloadData
{
    _totalPages = [_datasource numberOfPages];
    self.userInteractionEnabled = _totalPages > 0;
    if (_totalPages == 0)
    {
        _imageViewNull.hidden = NO;
        return;
    }

    self.scrollView.scrollEnabled = _totalPages <= 1 ? NO : YES;
    _imageViewNull.hidden = YES;
    _pageControl.numberOfPages = _totalPages;
    [self loadData];
}

- (void)loadData
{

    if (_autoScroll)
    {
        [self stopTimer];
    }
    _pageControl.currentPage = _curPage;

    //从scrollView上移除所有的subview
    NSArray *subViews = [_scrollView subviews];
    if ([subViews count] != 0)
    {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }

    [self getDisplayImagesWithCurpage:_curPage];

    for (int i = 0; i < 3; i++)
    {
        UIView *v = [_curViews objectAtIndex:i];
        if ([v gestureRecognizers].count==0)
        {
             [v addGestureRecognizer:[self tapGes]];
        }
        v.userInteractionEnabled = YES;
        v.left = v.width * i;
        [_scrollView addSubview:v];
    }
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0)];
    [self starTimer];
}


- (UITapGestureRecognizer *)tapGes
{
    return  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

- (void)getDisplayImagesWithCurpage:(int)page
{
    int pre = [self validPageValue:_curPage - 1];
    int last = [self validPageValue:_curPage + 1];
    if (!_curViews)
    {
        _curViews = [[NSMutableArray alloc] init];
    }
    
    if ([_datasource respondsToSelector:@selector(cycleScrollView:pageAtIndex:)])
    {
        [_curViews removeAllObjects];
        [_curViews addObject:[_datasource cycleScrollView:self pageAtIndex:pre]];
        [_curViews addObject:[_datasource cycleScrollView:self pageAtIndex:page]];
        [_curViews addObject:[_datasource cycleScrollView:self pageAtIndex:last]];
        self.cacheViews = [NSMutableArray arrayWithArray:_curViews];
    }
}

- (int)validPageValue:(NSInteger)value
{

    if (value == -1) {
        value = _totalPages - 1;
    } else if (value == _totalPages) {
        value = 0;
    }

    return value;

}

- (void)handleTap:(UITapGestureRecognizer *)tap
{

    if ([_delegate respondsToSelector:@selector(didClickPage:atIndex:)])
    {
        [_delegate didClickPage:self atIndex:_curPage];
    }

}

- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index
{
    if (index == _curPage)
    {
        [_curViews replaceObjectAtIndex:1 withObject:view];
        for (int i = 0; i < 3; i++)
        {
            UIView *v = [_curViews objectAtIndex:i];
            v.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                    action:@selector(handleTap:)];
            singleTap.delegate = self;
            [v addGestureRecognizer:singleTap];

            v.frame = CGRectOffset(v.frame, v.frame.size.width * i, 0);
            [_scrollView addSubview:v];
            
            [_scrollView setUserInteractionEnabled:YES];
        }
    }
}

- (id)dequeueReusableView
{
    UIView *view = _cacheViews.lastObject;
    if(view)
    {
        [_cacheViews removeObject:view];
    }
    return view;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
//    NSLog(@"count = %d",aScrollView.subviews.count);
    int x = aScrollView.contentOffset.x;

    //往下翻一张
    if (x >= (2 * self.frame.size.width))
    {
        _curPage = [self validPageValue:_curPage + 1];
        [self loadData];
    }

    //往上翻
    if (x <= 0)
    {
        _curPage = [self validPageValue:_curPage - 1];
        [self loadData];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView
{

    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0) animated:YES];

}

- (void)stopTimer
{
//    if (_scrollTimer.isValid)
//    {
//        [_scrollTimer invalidate];
//        _scrollTimer = nil;
//    }
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(autoScroll) object:nil];
}

- (void)starTimer
{
    [self stopTimer];
    if (_autoScroll && _autoScrollDuration > 0 && _totalPages > 1)
    {
//        self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:_autoScrollDuration target:self selector:@selector(autoScroll:) userInfo:nil repeats:YES];
        [self performSelector:@selector(autoScroll) withObject:nil afterDelay:_autoScrollDuration];
    }
}

- (BOOL)autoScroll
{
    [_scrollView scrollRectToVisible:CGRectMake(_scrollView.width * 2, 0, _scrollView.width, _scrollView.height) animated:YES];
    return _autoScroll;
}

- (void)autoScroll:(NSTimer *)timer
{
    [_scrollView scrollRectToVisible:CGRectMake(_scrollView.width * 2, 0, _scrollView.width, _scrollView.height) animated:YES];
}

- (void)dealloc
{
    _scrollView.delegate = nil;
    NSLog(@"dealloc");
    [self stopTimer];
}


@end
