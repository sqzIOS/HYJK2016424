//
//  XLCycleScrollView.h
//  CycleScrollViewDemo
//
//  Created by xie liang on 9/14/12.
//  Copyright (c) 2012 xie liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XLCycleScrollViewDelegate;
@protocol XLCycleScrollViewDatasource;
@class StyledPageControl;

@interface XLCycleScrollView : UIView <UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    NSInteger _totalPages;
    NSInteger _curPage;

    NSMutableArray *_curViews;
    BOOL _autoScroll;
    NSTimeInterval _autoScrollDuration;
}

@property(nonatomic, readonly) UIScrollView *scrollView;
@property(nonatomic, readonly) StyledPageControl *pageControl;
@property(nonatomic, assign) NSInteger currentPage;
@property(nonatomic, weak, setter = setDataource:) id <XLCycleScrollViewDatasource> datasource;
@property(nonatomic, weak, setter = setDelegate:) id <XLCycleScrollViewDelegate> delegate;
@property(nonatomic) BOOL autoScroll;
@property(nonatomic) NSTimeInterval autoScrollDuration;//滚动的时间间隔

@property(nonatomic, readonly) UIImageView *imageViewNull;//一个默认图


- (void)reloadData;

- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index;

- (void)starTimer;

- (void)stopTimer;

- (id)dequeueReusableView;

@end

@protocol XLCycleScrollViewDelegate <NSObject>

@optional
- (void)didClickPage:(XLCycleScrollView *)csView atIndex:(NSInteger)index;

@end

@protocol XLCycleScrollViewDatasource <NSObject>

@optional
- (NSInteger)numberOfPages;

- (UIView *)cycleScrollView:(XLCycleScrollView *)scrollView pageAtIndex:(NSInteger)index;

@end
