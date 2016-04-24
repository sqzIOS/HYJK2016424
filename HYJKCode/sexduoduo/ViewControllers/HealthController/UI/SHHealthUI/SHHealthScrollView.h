//
//  SHHealthScrollView.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//  性健康展示页

#import <UIKit/UIKit.h>

@interface SHHealthScrollView : UIScrollView <UIScrollViewDelegate>
/**
 *  表视图数据
 */
@property (strong, nonatomic) NSMutableArray *tvData;
@property (strong, nonatomic) UIViewController *mainVC;
/**
 *  初始化
 */
- (id)initWithMineScrollView:(NSArray*)tvData withFrame:(CGRect)frame withVC:(UIViewController*)VC;

//刷新
-(void)refrashData;

//刷新医师端和客户端的变化
-(void)refreshView;
@end
