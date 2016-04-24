//
//  SHBuyDoctorPhoneSeverVC.h
//  sexduoduo
//
//  Created by showm on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  购买电话服务

#import <UIKit/UIKit.h>
#import "SHMydoctorModel.h"
#import "StepNumPickerView.h"
@interface SHBuyDoctorPhoneSeverVC : UIViewController
{
    NSInteger selectServerNum;//0： 5~15分钟 1：15~30分钟
    
    NSString *dayStr;  // 预约日期
    NSString *timeStr; // 预约时间
    
    UILabel *section_2_CellLab_0;//预约日期
    UILabel *section_2_CellLab_1;//预约时间
    
    UIImageView *serverSelectImage1;//服务选择的两个选中标示
    UIImageView *serverSelectImage2;
    
    UIDatePicker *datePicker ;//选择接听时间 的日期
    StepNumPickerView *timePicker;//选择接听的时间段 
}
@property (nonatomic,strong)SHMydoctorInfo *model;


+(void)gotoMySelf:(id)pvc ;


@end
