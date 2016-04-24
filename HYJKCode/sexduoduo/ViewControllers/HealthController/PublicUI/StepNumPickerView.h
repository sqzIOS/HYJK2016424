//
//  StepNumPickerView.h
//  WalkMate
//
//  Created by TestIOS on 14-7-11.
//  Copyright (c) 2014年 sqz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StepNumPickerView;
@protocol CustomPickerViewDelegate <NSObject>
- (void)pickerView:(StepNumPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
@end


@interface StepNumPickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *myPicker;
@property (nonatomic, strong) NSString *StepFrom;//eg:
@property (nonatomic, strong) NSString *StepTo;//eg:

@property (nonatomic, strong) UIButton *commitBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
@property(strong,nonatomic)UILabel *stepLabStr;// 可以直接用于指向某个要改变的lab
@property (assign,nonatomic)id <CustomPickerViewDelegate>delegate;

-(void)setPickerViewStepFrom:(NSString *)StepNum;
-(void)setPickerViewStepTo:(NSString *)StepNum;

@end


