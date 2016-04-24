//
//  SetClockController.m
//  
//
//  Created by wenzhizheng on 16/1/8.
//
//

#import "SetClockController.h"
#import "BookingPickView.h"
#import "TimePickView.h"
#import "Tools.h"
#import "BookingCell.h"

@interface SetClockController () <TimePickViewDelegate>

@property (nonatomic) int hour;
@property (nonatomic) int minute;


@end

@implementation SetClockController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"预约闹钟";
    [self setClockView];
    
}



#pragma mark - 设置时钟
- (void)setClockView
{
    TimePickView *timePick = [TimePickView timePickViewWithFrame:CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_WIDTH / 2)];
    timePick.heightForRow = 60;
    timePick.delegate = self;
    [self.view addSubview:timePick];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, timePick.bottom, SCREEN_WIDTH, 44);
    [self.view addSubview:btn];
    btn.backgroundColor = MAINCOLOR;
    [btn setTitle:@"设置" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(setBtnClick) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - 根据选择的时间设定本地推送
- (void)timePickViewDidChooseHour:(int)hour andMinute:(int)minute
{
    self.hour = hour;
    self.minute = minute;
}

- (void)setBtnClick
{
    int time = [Tools timeIntervalWithHour:self.hour andMinute:self.minute andSecond:0];
    if (time <= 0) {
        [ShareFunction showToast:@"请选择正确的时间"];
    } else {
        [Tools setLocalNotificationWithAlertBody:@"通知" andHour:self.hour minute:self.minute second:0];
        [ShareFunction showToast:@"设置成功"];
        [self.cell setNotiTimeHour:self.hour minute:self.minute];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }
}

@end
