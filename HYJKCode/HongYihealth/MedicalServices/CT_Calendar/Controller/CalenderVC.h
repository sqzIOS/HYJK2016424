//
//  CalenderVC.h
//  选择日期
//
//  Created by shown on 16/1/7.
//  Copyright (c) 2016年 shown. All rights reserved.
//  功能:日历

#import <UIKit/UIKit.h>

@protocol CalenderVCDelegate <NSObject>

- (void)changeTime:(NSString *)selectTime Date:(NSString *)date;

@end

@interface CalenderVC : MyCenterBaseController

@property (nonatomic, assign) id<CalenderVCDelegate> deledate;

@end
