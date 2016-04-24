//
//  TopRightAlertView.h
//  sexduoduo
//
//  Created by dsz on 15-3-12.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TopRightAlertViewDelegate
-(void)topRightAlertViewButtonClick:(id)sender;

@end
@interface TopRightAlertView : UIView

@property(nonatomic)id<TopRightAlertViewDelegate>topAlertViewDelegate;
@property (strong, nonatomic) NSString *levelStr;
@property (strong, nonatomic) IBOutlet UIImageView *userImageView;

@property (strong, nonatomic) IBOutlet UILabel *userNameLab;

@property (strong, nonatomic) IBOutlet UILabel *userLevelLab;

@property (strong, nonatomic) IBOutlet UIImageView *huiFuLeftImageView;

@property (strong, nonatomic) UIImageView *numImg ;// 我的消息个数 背景
@property (strong, nonatomic) UILabel *numLabel;//我的消息个数 Lab

-(void)configView;

@end
