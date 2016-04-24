//
//  GoTopView.h
//  sexduoduo
//
//  Created by dsz on 15-4-24.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//
//  点击该按钮 滚动到顶端的

#import <UIKit/UIKit.h>

@interface GoTopView : UIView

@property(strong, nonatomic)UIButton *btn;

-(void)addTarget:(id)target aciton:(SEL) select forControlEvents:(UIControlEvents)event;
@end
