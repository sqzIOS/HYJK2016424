//
//  BeginView.h
//  Putian Mobile
//
//  Created by app on 13-12-5.
//  Copyright (c) 2013年 Lai fenghai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeginView : UIView<UIScrollViewDelegate>

@property (retain, nonatomic) UIScrollView *guideScrollView;
@property (strong,nonatomic) NSMutableArray *slideImages;
@property (strong,nonatomic) UIPageControl *pageControl;

@end
