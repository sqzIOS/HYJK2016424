//
//  TimePickView.m
//  
//
//  Created by apple on 16/1/11.
//
//

#import "TimePickView.h"

typedef void(^MyBlock)(NSInteger,NSInteger);

@interface TimePickView () <UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic) NSInteger hour;
@property (nonatomic) NSInteger minute;

@property (nonatomic,weak) UIPickerView *pickView1;
@property (nonatomic,weak) UIPickerView *pickView2;
@property (nonatomic,weak) UILabel *hourLabel;
@property (nonatomic,weak) UILabel *minuteLabel;
@property (nonatomic,weak) UILabel *maohao;


@end

@implementation TimePickView

+ (instancetype)timePickViewWithFrame:(CGRect)frame
{
    TimePickView *timePickView = [[TimePickView alloc] initWithFrame:frame];
    timePickView.clipsToBounds = YES;
    
    UIPickerView *pickView1 = [[UIPickerView alloc] init];
    pickView1.tag = 1;
    pickView1.delegate = timePickView;
    pickView1.dataSource = timePickView;
    timePickView.pickView1 = pickView1;
    [timePickView addSubview:pickView1];
    
    UIPickerView *pickView2 = [[UIPickerView alloc] init];
    pickView2.tag = 2;
    pickView2.delegate = timePickView;
    pickView2.dataSource = timePickView;
    timePickView.pickView2 = pickView2;
    [timePickView addSubview:pickView2];
    
    UILabel *hour = [[UILabel alloc] init];
    hour.font = [UIFont systemFontOfSize:13];
    hour.text = @"时";
    timePickView.hourLabel = hour;
    [pickView1 addSubview:hour];
    
    UILabel *minute = [[UILabel alloc] init];
    minute.text = @"分";
    minute.font = [UIFont systemFontOfSize:13];
    timePickView.minuteLabel = minute;
    [pickView2 addSubview:minute];
    
    UILabel *maohao = [[UILabel alloc] init];
    maohao.text = @":";
    maohao.textAlignment = NSTextAlignmentCenter;
    timePickView.maohao = maohao;
    maohao.font = [UIFont systemFontOfSize:30];
    [timePickView addSubview:maohao];
    
    return timePickView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.pickView1.frame = CGRectMake(0, 0, self.frame.size.width/2, 0);
    self.pickView1.center = CGPointMake(self.frame.size.width / 4, self.frame.size.height/2);
    self.hourLabel.frame = CGRectMake(self.pickView1.width - 25, self.pickView1.frame.size.height / 2, 22,22);
    self.maohao.frame = CGRectMake(0, 0, 30, self.height);
    self.maohao.center = CGPointMake(self.width /2, self.height / 2);
    
    self.pickView2.frame = CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2 , 0);
    self.pickView2.center = CGPointMake(self.pickView2.center.x, self.frame.size.height/2);
    self.minuteLabel.frame = CGRectMake(90, self.pickView2.frame.size.height / 2, 22,22);
    

}

- (void)setHeightForRow:(CGFloat)heightForRow
{
    _heightForRow = heightForRow;
    [self.pickView1 reloadAllComponents];
    [self.pickView2 reloadAllComponents];
    
//    self.hourLabel.font = [U];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    if (self.heightForRow <= 0) {
        return 44;
    }
    return self.heightForRow;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = (UILabel *)view;
    if (label == nil) {
        label = [[UILabel alloc] init];
    }
    label.frame = CGRectMake(35, 0, pickerView.width - 70, pickerView.height);
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:40];
    label.text = [NSString stringWithFormat:@"%02d",row];
    if (pickerView.tag == 2) {
        label.textAlignment = NSTextAlignmentLeft;
    } else {
        label.textAlignment = NSTextAlignmentRight;
    }
    return label;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag == 1) {
        return 24;
    }
    return 60;
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == 1) {
        self.hour = row;
    } else {
        self.minute = row;
    }
    [self.delegate timePickViewDidChooseHour:self.hour andMinute:self.minute];
}


@end
