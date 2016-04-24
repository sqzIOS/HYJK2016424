//
//  CalenderVC.m
//  选择日期
//
//  Created by shown on 16/1/7.
//  Copyright (c) 2016年 shown. All rights reserved.
//  功能:日历

#import "CalenderVC.h"
#import "CalendarHeadView.h"

@interface CalenderVC ()<CalendarHeadViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSString *startHours;
    NSString *startMinute;
    NSString *endHours;
    NSString *endMinute;
}

@property (nonatomic, strong) CalendarHeadView *headView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIPickerView *pickerView;    //时间选择器

@property (nonatomic, strong) NSMutableArray *hoursArr;

@property (nonatomic, strong) NSMutableArray *minuteArr;

@property (nonatomic, strong) UIView *bgView;

@end

@implementation CalenderVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTopUpiew];
    
    [self initData];
}

/**
 *  设置导航栏
 */
- (void)setTopUpiew {
    
    self.titleStr = @"选择预约日期";
    self.isNeedBack = YES;
}

- (void)initData {
    
    if (_hoursArr == nil) {
        _hoursArr = [[NSMutableArray alloc] initWithCapacity:24];
        for (int i = 0; i < 24; i++) {
            [_hoursArr addObject:[NSString stringWithFormat:@"%02zi",i]];
        }
    }
    if (_minuteArr == nil) {
        _minuteArr = [[NSMutableArray alloc] initWithCapacity:60];
        for (int i = 0; i < 60; i++) {
            [_minuteArr addObject:[NSString stringWithFormat:@"%02zi",i]];
        }
    }
    
    [self initView];
}

- (void)initView {
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.pickerView];
    
    [self.view addSubview:self.bgView];
}

#pragma maek --- delegate

- (void)sureTime:(NSString *)selectTime Date:(NSString *)selectDate{
    if (_deledate) {
        [_deledate changeTime:selectTime Date:selectDate];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)selectTime {
    NSString *str = _headView.selectedTime.text;
    NSRange range = [str rangeOfString:@"-"];
    NSString *startTime = [str substringToIndex:range.location];
    NSString *endTime = [str substringFromIndex:range.location + range.length];
    
    range = [startTime rangeOfString:@":"];
    startHours = [startTime substringToIndex:range.location];
    startMinute = [startTime substringFromIndex:range.location + range.length];
    
    range = [endTime rangeOfString:@":"];
    endHours = [endTime substringToIndex:range.location];
    endMinute = [endTime substringFromIndex:range.location + range.length];
    
    [_pickerView selectRow:[startHours integerValue] inComponent:0 animated:NO];
    [_pickerView selectRow:[startMinute integerValue] inComponent:1 animated:NO];
    [_pickerView selectRow:[endHours integerValue] inComponent:2 animated:NO];
    [_pickerView selectRow:[endMinute integerValue] inComponent:3 animated:NO];
    
    _pickerView.hidden = NO;
    _bgView.hidden = NO;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    //    return [pickerArray count];
    if (component % 2 == 0) {
        return _hoursArr.count;
    }
    return _minuteArr.count;
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //    return [pickerArray objectAtIndex:row];
    if (component % 2 == 0) {
        return _hoursArr[row];
    }
    return _minuteArr[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0: startHours = _hoursArr[row]; break;
        case 1: startMinute = _minuteArr[row]; break;
        case 2: endHours = _hoursArr[row]; break;
        case 3: endMinute = _minuteArr[row]; break;
        default:
            break;
    }
}

#pragma mark --- get
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT - STAR_Y) style:UITableViewStylePlain];
        _tableView.backgroundColor = WHITE_COLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}


- (CalendarHeadView *)headView {
    if (_headView == nil) {
        _headView = [[CalendarHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _headView.delegate = self;
    }
    return _headView;
}

- (UIPickerView *)pickerView {
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 216, SCREEN_WIDTH, 216)];
        _pickerView.hidden = YES;
        _pickerView.backgroundColor = colorWith05;
        _pickerView.showsSelectionIndicator = YES;
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, _pickerView.top, SCREEN_WIDTH, MAKEOF5(30))];
        _bgView.backgroundColor = colorWith04;
        _bgView.hidden = YES;
        
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(MAKEOF5(12), 0, _bgView.width/4., _bgView.height);
        [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
        [leftBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        leftBtn.titleLabel.font = FONT_WITH_SIZE(MAKEOF5(13));
        leftBtn.layer.cornerRadius = 3.;
        leftBtn.layer.masksToBounds = YES;
        leftBtn.layer.borderColor = colorWith03.CGColor;
        leftBtn.layer.borderWidth = 1.;
        [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:leftBtn];
        
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(_bgView.width - _bgView.width/4. - MAKEOF5(12), 0, _bgView.width/4., _bgView.height);
        [rightBtn setTitle:@"确定" forState:UIControlStateNormal];
        [rightBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        rightBtn.titleLabel.font = FONT_WITH_SIZE(MAKEOF5(13));
        rightBtn.layer.cornerRadius = 3.;
        rightBtn.layer.masksToBounds = YES;
        rightBtn.layer.borderColor = colorWith03.CGColor;
        rightBtn.layer.borderWidth = 1.;
        [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:rightBtn];
    }
    return _bgView;
}

#pragma mark -- btn action
//取消
- (void)leftBtnAction {
    [self hiddenView];
}
//确定
- (void)rightBtnAction {
    if ([startHours intValue] > [endHours intValue]) {
        [ShareFunction showToast:@"结束时间需>=开始时间"];
        return;
    } else if ([startHours intValue] == [endHours intValue] && [startMinute intValue] > [endMinute intValue]) {
        [ShareFunction showToast:@"结束时间需>=开始时间"];
        return;
    }
    NSString *selectTime = [NSString stringWithFormat:@"%@:%@-%@:%@",startHours,startMinute,endHours,endMinute];
    _headView.selectedTime.text = selectTime;
    [self hiddenView];
}

- (void)hiddenView {
    if (_pickerView) {
        _pickerView.hidden = YES;
    }
    
    if (_bgView) {
        _bgView.hidden = YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
