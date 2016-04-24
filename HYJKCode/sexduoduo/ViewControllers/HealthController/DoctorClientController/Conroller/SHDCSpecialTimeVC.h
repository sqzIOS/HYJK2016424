//
//  SHDCSpecialTimeVC.h
//  sexduoduo
//
//  Created by showm on 15/9/25.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  特别设定
//  出诊时间设置里面的跳转的 特别设定界面

#import <UIKit/UIKit.h>
#import "FSCalendarHeader.h"
#import "SHRootVC.h"
@class StepNumPickerView;
@interface SHDCSpecialTimeVC : SHRootVC
{
    UIScrollView *_scrollView;
    UIView * _diaryView;
    NSCalendar *_currentCalendar;
    
    UILabel *centerRiQiLab; //显示当前选中的日期
    UILabel *centerTimeLab; //显示当前选中的时间
    
}

@property (strong,nonatomic) FSCalendar *calendar;
@property (strong,nonatomic) StepNumPickerView *picker;//时间选择
@property (strong,nonatomic) NSString *specialTime;


+(void)gotoMySelf:(id)pvc withSpecialTime:(NSString *)specialTime;


@end
