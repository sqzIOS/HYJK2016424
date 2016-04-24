//
//  SHDCSpecialTimeVC.m
//  sexduoduo
//
//  Created by showm on 15/9/25.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCSpecialTimeVC.h"
#import "FSCalendar.h"
#import "SSLunarDate.h"
#import "StepNumPickerView.h"

@interface SHDCSpecialTimeVC ()<FSCalendarDataSource,FSCalendarDelegate,CustomPickerViewDelegate>
{
    NSMutableArray *dayArray;
    NSDate *selectDay;//当前选中哪天
    
    
}
@end

@implementation SHDCSpecialTimeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleStr:@"特别设定"];
    
    self.view.backgroundColor =WHITE_COLOR;
    
    
    [self initView];
    
    
}

#pragma  mark ---UI

- (void)initView
{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, STAR_Y, k_screenWidth, k_screenHeight-STAR_Y)];
    _scrollView.backgroundColor = CLEAR_COLOR;
    
    //背景图
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(5, QZMake(5),QZMake(375-10) , _scrollView.height-QZMake(10))];
    imgV.top=0;
    imgV.backgroundColor = UICOLOR_RGB(181, 212, 159);
    [imgV qzSetCornerRadius:5];
    [_scrollView addSubview:imgV];
    [self.view addSubview:_scrollView];
    _scrollView.top = STAR_Y;
    
    UILabel *leftRiQiLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
    leftRiQiLab.backgroundColor = [UIColor clearColor];
    leftRiQiLab.textColor = WHITE_COLOR;
    leftRiQiLab.textAlignment = NSTextAlignmentLeft;
    leftRiQiLab.font = [UIFont fontWithName:k_Font size:14.0f];
    leftRiQiLab.text = @"日期";
    [_scrollView addSubview:leftRiQiLab];
    
    
    centerRiQiLab = [[UILabel alloc] initWithFrame:CGRectMake(10, leftRiQiLab.top, k_screenWidth-10*2, 20)];
    centerRiQiLab.backgroundColor = [UIColor clearColor];
    centerRiQiLab.textColor = WHITE_COLOR;
    centerRiQiLab.textAlignment = NSTextAlignmentCenter;
    centerRiQiLab.font = [UIFont fontWithName:k_Font size:14.0f];
    if (self.specialTime) {
        
        centerRiQiLab.text = [NSString stringWithFormat:@"%@月%@日",[self.specialTime substringWithRange:NSMakeRange(5,2)],[self.specialTime substringWithRange:NSMakeRange(8,2)]];
        
        
        selectDay = [NSDate dateFromYMDString:[self.specialTime substringWithRange:NSMakeRange(0,10)]];
        
        
    }else
        centerRiQiLab.text = @"09月24日";
    [_scrollView addSubview:centerRiQiLab];
    
    UILabel *leftTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(10, leftRiQiLab.bottom, 100, 20)];
    leftTimeLab.backgroundColor = [UIColor clearColor];
    leftTimeLab.textColor = WHITE_COLOR;
    leftTimeLab.textAlignment = NSTextAlignmentLeft;
    leftTimeLab.font = [UIFont fontWithName:k_Font size:14.0f];
    leftTimeLab.text = @"出诊时段";
    [_scrollView addSubview:leftTimeLab];
    
    
    centerTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(10, leftTimeLab.top, k_screenWidth-10*2, 20)];
    centerTimeLab.backgroundColor = [UIColor clearColor];
    centerTimeLab.textColor = WHITE_COLOR;
    centerTimeLab.textAlignment = NSTextAlignmentCenter;
    centerTimeLab.font = [UIFont fontWithName:k_Font size:14.0f];
    centerTimeLab.text = @"12:00 ~ 14:00";
    [_scrollView addSubview:centerTimeLab];
    
    
    
    self.picker=[[StepNumPickerView alloc]initWithFrame:CGRectMake(0, centerTimeLab.bottom-10, k_screenWidth, 191)];
    [self.picker setPickerViewStepFrom:@"17"];//默认
    [self.picker setPickerViewStepTo:@"21"];//默认
    self.picker.delegate = self;
    self.picker.backgroundColor = CLEAR_COLOR;
    [_scrollView addSubview:self.picker];
    
    // 取消按钮
    _picker.cancelBtn.frame=CGRectMake(0, _picker.height, 60, 35);
    _picker.cancelBtn.centerY=_picker.height/2.;
    _picker.cancelBtn.backgroundColor = colorWith01;
    [_picker.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_picker.cancelBtn.titleLabel setFont:[UIFont fontWithName:k_Font size:14]];
    [_picker.cancelBtn addTarget:self action:@selector(pickerClickNO:) forControlEvents:UIControlEventTouchUpInside];
    _picker.userInteractionEnabled = YES;
    _picker.cancelBtn.hidden = YES;
    [_picker addSubview:_picker.cancelBtn];
    
    
    // 确定按钮
    _picker.commitBtn.frame=CGRectMake(_picker.width-60, _picker.height, 60, 35);
    _picker.commitBtn.centerY=_picker.height/2.;
    _picker.commitBtn.backgroundColor = colorWith01;
    [_picker.commitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_picker.commitBtn.titleLabel setFont:[UIFont fontWithName:k_Font size:14]];
    [_picker.commitBtn addTarget:self action:@selector(pickerClickOK:) forControlEvents:UIControlEventTouchUpInside];
    _picker.userInteractionEnabled = YES;
    _picker.commitBtn.hidden = YES;
    [_picker addSubview:_picker.commitBtn];

    
    
    
    
    
    //日历背景View
    UIView *dView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_SPACE(5), k_screenHeight-360, SCREEN_WIDTH - SCREEN_SPACE(10), SCREEN_SPACE(360))];
    dView.backgroundColor = RGBACOLOR(0.0, 0.0, 0.0, 0.2);
    dView.layer.cornerRadius = 6.0f;
    dView.layer.masksToBounds = YES;
    [_scrollView addSubview:dView];
    _diaryView = dView;
    
    
    //绘制日历头部
    FSCalendarHeader *scalenderHeader = [[FSCalendarHeader alloc] initWithFrame:CGRectMake(0,0,dView.width,SCREEN_SPACE(40))];
    scalenderHeader.titleFont = [UIFont systemFontOfSize:16.0];
    scalenderHeader.backgroundColor = RGBACOLOR(0.0, 0.0, 0.0, 0.3);
    [dView addSubview:scalenderHeader];
    
    
    //绘制日历模块
    _currentCalendar = [NSCalendar currentCalendar];
    self.calendar = [[FSCalendar alloc]initWithFrame:CGRectMake(0, SCREEN_SPACE(35), SCREEN_WIDTH, SCREEN_SPACE(325))];
    self.calendar.backgroundColor = [UIColor clearColor];
    self.calendar.dataSource = self;
    self.calendar.delegate = self;
    self.calendar.header = scalenderHeader;
    
    
    //方向设定
    self.calendar.flow = FSCalendarFlowHorizontal;
    [dView addSubview:_calendar];
    [self setCalendarStyle];
    
    
}
- (void)setCalendarStyle
{
    [self.calendar setWeekdayTextColor:[UIColor whiteColor]];
    [self.calendar setHeaderTitleColor:[UIColor whiteColor]];
    [self.calendar setEventColor:nil];                          //事件样式
    [self.calendar setHeaderDateFormat:@"yyyy年MM月"];          //头部中间样式
    [self.calendar setMinDissolvedAlpha:0.0];                  //头部左右两边透明度
    [self.calendar setTodayColor:nil];                         //今天背景色
    [self.calendar setSelectionColor:nil];                     //选中背景色
    [self.calendar setCellStyle:FSCalendarCellStyleCircle];    //选中样式
}

#pragma mark - --- data and dataManager

-(BOOL)havaDay:(NSDate *)day
{
    NSString *todayStr = [NSDate dateStringYMDFromDate:day];
    for (NSString *dateStr in dayArray) {
        if ([dateStr isEqualToString:todayStr]) {
            return YES;
        }
    }

    if (selectDay) {
        NSString *selectDayStr = [NSDate dateStringYMDFromDate:selectDay];
        if ([selectDayStr isEqualToString:todayStr]) {
            return YES;
        }
    }
    
    
    return NO;
}

-(void)selectDay:(NSDate *)day
{
    if (selectDay) {
        selectDay = nil;
    }
    selectDay = day;
    
    [NSDate getMonths:day];
    [NSDate getDay:day];
    
    
    //1.更新日期 如果有时间 显示时间
    centerRiQiLab.text = [NSString stringWithFormat:@"%zi月%zi日",[NSDate getMonths:day],[NSDate getDay:day]];
    
    
}
-(void)clearSlectDay
{
    selectDay =nil;
    
    //刷新日历
    
    
}



#pragma mark - ---action 事件
- (void)bt_action_right
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)pickerClickNO:(id)sender
{
    NSLog(@"取消");
    self.picker.cancelBtn.hidden = YES;
    self.picker.commitBtn.hidden = YES;
    
    // 清除选中
    [self clearSlectDay];
}
-(void)pickerClickOK:(id)sender
{
    NSLog(@"确定");
    
    self.picker.cancelBtn.hidden = YES;
    self.picker.commitBtn.hidden = YES;
    
    
    [centerTimeLab setText:[NSString stringWithFormat:@"%@:00~%@:00",self.picker.StepFrom,self.picker.StepTo]];
    
    
    NSDictionary *tempDic=@{
                            
                            @"doctorId":DOCTORID,
                            @"weekFlag":@"0",
                            @"timePart":@"1",
                            @"beginTime":[NSString stringWithFormat:@"%zi-%02ld-%02ld %@",[NSDate getYear:selectDay],(long)[NSDate getMonths:selectDay],(long)[NSDate getDay:selectDay],self.picker.StepFrom],
                            @"endTime":self.picker.StepTo
                            
                            };
    
    [AFHTTPClient postJSONPath:SHINTERFACE_updateCallTime httpHost:sexHealthTestIP parameters:tempDic success:^(id responseObject) {

        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        NSLog(@"=====%@设置时间",dic);

        if ([dic[@"success"] intValue]==1) {
            
            NSLog(@"设置成功");
        }
        
        //在昨晚数据请求之后 清除选中的日期
        [self clearSlectDay];
        
    } fail:^{
        
    }];
   
    
}
#pragma mark --- 选择器控件
-(void)pickerView:(StepNumPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    pickerView.cancelBtn.hidden = NO;
    pickerView.commitBtn.hidden = NO;
}

#pragma mark - --- 日历delegate
//子标题 农历
- (NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date
{
    SSLunarDate* lunarDate = [[SSLunarDate alloc] initWithDate:date calendar:_currentCalendar];
    return lunarDate.dayString;
}
//标记状态
- (BOOL)calendar:(FSCalendar *)calendar hasEventForDate:(NSDate *)date
{
    return [self havaDay:date];
}
/*
 //以后 可滚范围
 - (NSDate *)minimumDateForCalendar:(FSCalendar *)calendar
 {
 }
 //以前 可滚范围
 - (NSDate *)maximumDateForCalendar:(FSCalendar *)calendar
 {
 }
 */

//是否可选择
- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date
{
    if([NSDate compareOneDay:date withAnotherDay:[NSDate date]]>=0)
    {
        return YES;
    }else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"抱歉，您不能穿越奥！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        return NO;
    }
}
//选中后的回调方法
- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date
{
//    [self getMonthDayWithDate:[NSDate dateStringYMDFromDate:date]];
    
    [self selectDay:date];
    [self.calendar reloadData];
}
//改变月份
- (void)calendarCurrentMonthDidChange:(FSCalendar *)calendar
{
//    NSString* currentMonth = [NSDate dateStringYMFromDate:calendar.currentMonth];
//    NSInteger index = [NSDate compareOneDay:calendar.currentMonth withAnotherDay:[NSDate date]];
//    if (index == 1) {
//        return;
//    }
//    [self getYearMonthWithDate:currentMonth];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc withSpecialTime:(NSString *)specialTime
{
    if (pvc == nil) {
        return;
    }
    
    SHDCSpecialTimeVC* vc = [[SHDCSpecialTimeVC alloc]init];
    vc.specialTime = specialTime;
    
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
