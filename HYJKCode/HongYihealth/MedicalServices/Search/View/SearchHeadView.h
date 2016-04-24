//
//  SearchHeadView.h
//  搜索以及纪录保存
//
//  Created by shown on 16/1/8.
//  Copyright (c) 2016年 shown. All rights reserved.
//  功能：搜索tableView headView

#import <UIKit/UIKit.h>

@protocol SearchHeadViewDelegate <NSObject>

- (void)showMaskView:(BOOL)isShow;

@end

@interface SearchHeadView : UIView

@property (nonatomic, strong) UITextField *editF;   //搜索框

@property (nonatomic, strong) UIButton *searchBtn;  //搜索按钮

@property (nonatomic, copy) void (^ SearchHeadViewBlock)(NSString *doctorName);

@property (nonatomic, assign) id<SearchHeadViewDelegate> headDelegate;

@end
