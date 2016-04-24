//
//  StepNumPickerView.m
//  WalkMate
//
//  Created by TestIOS on 14-7-11.
//  Copyright (c) 2014年 sqz. All rights reserved.
//

#import "StepNumPickerView.h"

@implementation StepNumPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = UIColorFromRGB(0xfafafa);
        
        self.myPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 240, frame.size.height)];
        self.myPicker.center = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
        self.myPicker.dataSource = self;
        self.myPicker.delegate=self;
        //self.myPicker.backgroundColor=[UIColor yellowColor];
        [self addSubview:self.myPicker];
        
        
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 25, 35)];
        lab.backgroundColor=colorWith01;
        lab.text=@"至";
        lab.textColor=[UIColor whiteColor];
        lab.font=[UIFont fontWithName:k_Font size:15];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.center=CGPointMake(self.myPicker.frame.size.width/2., self.myPicker.frame.size.height/2.0);
        [self.myPicker addSubview:lab];

    }
    return self;
}
-(void)setPickerViewStepFrom:(NSString *)StepNum{
    self.StepFrom=StepNum;
    
    [self.myPicker selectRow:[StepNum intValue] inComponent:0 animated:NO];
}
-(void)setPickerViewStepTo:(NSString *)StepNum{
    self.StepTo=StepNum;
    
    [self.myPicker selectRow:[StepNum intValue] inComponent:1 animated:NO];
}

#pragma mark ---getter setter

-(UIButton *)commitBtn
{
    if (_commitBtn==nil) {
        _commitBtn = [UIButton buttonWithType:0];
    }
    
    return _commitBtn;
}


-(UIButton *)cancelBtn
{
    if (_cancelBtn==nil) {
        _cancelBtn = [UIButton buttonWithType:0];
    }
    
    return _cancelBtn;
}



#pragma mark -
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSInteger result = 0;
    if ([pickerView isEqual:self.myPicker]){
        result = 2;
    }
    return result;
}
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger result = 0;
    if ([pickerView isEqual:self.myPicker]){
        
        result = 24;
    }
    return result;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 33;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 100;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    NSString *result=nil;
    
    if ([pickerView isEqual:self.myPicker]) {
        
        result=[NSString stringWithFormat:@"%d:00",(int)row];
        
    }
    return result;
}
//UIPickerView控件中自定义展示的字体大小及样式
//通过覆盖如下方法实现
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        //adjustsFontSizeToFitWidth property to YES
        pickerLabel.minimumScaleFactor = 8.;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont fontWithName:k_Font size:15]];
        //        pickerLabel.textColor=[PublicMethod colorWithHexString:@"6bb8e9" andAlpha:1.0];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.StepFrom=[NSString stringWithFormat:@"%d",(int)[pickerView selectedRowInComponent:0]];
    self.StepTo=[NSString stringWithFormat:@"%d",(int)[pickerView selectedRowInComponent:1]];

    if (self.stepLabStr) {
        self.stepLabStr.text=[NSString stringWithFormat:@"%@:00 ~ %@:00",self.StepFrom,self.StepTo];
    }

    
    if ([self.delegate respondsToSelector:@selector(pickerView:didSelectRow:inComponent:)]) {
        [self.delegate pickerView:self didSelectRow:row inComponent:component];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
