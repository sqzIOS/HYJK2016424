//
//  SHHealthHeaderView.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHHealthHeaderView.h"
#import "StyledPageControl.h"
#import "SHHealthModel.h"
#import "SHCopeDetailVC.h"
/**
 *  scrollView样式展示
 */
@interface SHHealthHeaderSubView : UIView
//图片
@property(weak,nonatomic)UIImageView* imageView;

@end

@implementation SHHealthHeaderSubView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //背景图片
        UIImageView* bgImageView = [[UIImageView alloc]initWithFrame:self.frame];
        [self addSubview:bgImageView];
        self.imageView = bgImageView;
    }
    return self;
}

@end

@interface SHHealthHeaderView()
//滚动点
@property(weak,nonatomic)StyledPageControl* pageControl;
//滚动宽
@property float pageControlWidth;
//广告对象Model
@property (strong,nonatomic) SHHealthAdModel *model;
//滚动数据
@property(strong,nonatomic)NSMutableArray* svData;
@end

@implementation SHHealthHeaderView

- (id)initWithFrameAndType:(CGRect)frame pvc:(id)pvc
{
    self = [super initWithFrame:frame];
    if (self) {
        self.svData = [NSMutableArray array];
        self.parentVC = pvc;
        XLCycleScrollView *adScrollView = [[XLCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        adScrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        adScrollView.delegate = self;
        adScrollView.datasource = self;
        adScrollView.scrollView.scrollsToTop = NO;
        adScrollView.autoScrollDuration = 3;
        adScrollView.autoScroll = YES;
        adScrollView.pageControl.hidden = YES;
        [self addSubview:adScrollView];
        self.scrollView = adScrollView;
        //点
        StyledPageControl* pageControl = [[StyledPageControl alloc]initWithFrame:CGRectMake(0, frame.size.height-20, frame.size.width, 20)];
        pageControl.diameter = 10;
        pageControl.gapWidth = 10;
        pageControl.coreNormalColor = colorWithLYWhite;
        pageControl.coreSelectedColor = colorWith01;
        [self addSubview:pageControl];
        self.pageControl = pageControl;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initData];
        });
    }
    return self;
}

#pragma mark ---Data
-(void)initData
{
    _model = [SHHealthAdModel loadLocalDataForAdModel];
    if (_model && _model.datasource && _model.datasource.count > 0) {
        [self handleRemoteData:_model];
    }
    if (!_model.hadload) {
        [self requestRemoteData];
    }
}

#pragma mark ---网络数据
-(void)handleRemoteData:(SHHealthAdModel*)model
{
    [_svData removeAllObjects];
    [_svData addObjectsFromArray:_model.datasource];
    [_scrollView reloadData];
}
-(void)requestRemoteData
{
    [SHHealthAdModel loadRemoteDataForAdModel:_model flag:NO cb:^(BOOL isOK, SHHealthAdModel *model) {
        if (isOK) {
            [self handleRemoteData:model];
        }
    }];
}

#pragma mark ---Delegate
- (NSInteger)numberOfPages
{
    NSInteger count = [self.svData count];
    _pageControlWidth = (count-1)*10;
    return count;
}
- (UIView *)cycleScrollView:(XLCycleScrollView *)scrollView pageAtIndex:(NSInteger)index
{
    SHHealthHeaderSubView *AdView = [_scrollView dequeueReusableView];
    if (!AdView) {
        AdView = [[SHHealthHeaderSubView alloc] initWithFrame:_scrollView.bounds];
    }
    SHHealthAdInfo *model = _svData[index];
    if (1 == _svData.count) {
        self.pageControl.numberOfPages = 0;
    } else {
        self.pageControl.numberOfPages = (int)_svData.count;
    }
    self.pageControl.currentPage = (int)scrollView.currentPage;
    AdView.imageView.contentMode = UIViewContentModeScaleToFill;
    AdView.imageView.loadedContentModel = UIViewContentModeScaleToFill;
    if ([model.iconStr hasPrefix:@"http://"]) {
        [AdView.imageView sd_setImageWithURL:[NSURL URLWithString:model.iconStr]];
    }else
        AdView.imageView.image = [UIImage imageNamed:model.iconStr];
    return AdView;
}
//点击事件
-(void)didClickPage:(XLCycleScrollView *)csView atIndex:(NSInteger)index
{
    SHHealthAdInfo *info = _svData[index];
    
    [SHCopeDetailVC gotoMySelf:self.parentVC withIdStr:info.idStr];
}

@end
