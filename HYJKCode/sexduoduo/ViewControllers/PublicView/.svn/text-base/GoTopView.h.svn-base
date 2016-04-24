//
//  GoTopView.h
//  sexduoduo
//
//  Created by dsz on 15-4-24.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//
//  点击该按钮 滚动到顶端的
/*
 
 使用方法：
 1.初始化该view
 2.添加改view的点击事件
 
 3.在vc或者调用出 在代理方法- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
中调用该类的此方法
 
 eg: 1,2
 goTopView=[[GoTopView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, SCREEN_HEIGHT, 44, 44)];
 goTopView.targetScrollView = self.bbsTableView;
 [self.view addSubview:goTopView];
 
 3,
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [goTopView scrollViewDidScroll:scrollView];
 }
 */
#import <UIKit/UIKit.h>

@interface GoTopView : UIView

@property(strong, nonatomic)UIButton *btn;
@property (nonatomic, strong)UIScrollView *targetScrollView;//目标 要滚动的scrollView
@property (nonatomic, assign) CGFloat distanceByBottom;//滑动出来按钮后距底部的位置
-(void)addTarget:(id)target aciton:(SEL) select forControlEvents:(UIControlEvents)event;

//2

-(void)addBtnTargetScrollView:(UIScrollView *)target;

// 返回顶端的按钮 3
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;


@end
