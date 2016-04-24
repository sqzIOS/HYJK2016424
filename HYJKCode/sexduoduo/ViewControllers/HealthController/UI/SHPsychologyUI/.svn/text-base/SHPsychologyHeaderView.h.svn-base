//
//  SHPsychologyHeaderView.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//  心理咨询 页

#import <UIKit/UIKit.h>
#import "XLCycleScrollView.h"

@interface SHPsychologyHeaderView : UIView<XLCycleScrollViewDelegate,XLCycleScrollViewDatasource>
//顶部滚动 UIScrollView
@property(strong, nonatomic) XLCycleScrollView *scrollView;
//父视图
@property(weak,nonatomic)UIViewController* parentVC;
/**
 * 初始化 SHHealthHeaderView
 */
- (id)initWithFrame:(CGRect)frame pvc:(id)pvc;
/**
 * 远程获取数据用来显示View
 */
-(void)requestRemoteData;

@end
