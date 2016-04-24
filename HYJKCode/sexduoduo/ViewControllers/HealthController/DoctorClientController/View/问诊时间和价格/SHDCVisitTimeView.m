//
//  SHDCVisitTimeView.m
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCVisitTimeView.h"
#import "SHDCVisitTimeCell.h"
#import "StepNumPickerView.h"
#import "SHDCSpecialTimeVC.h"

@implementation SHDCVisitTimeView

- (id)initWithCopeTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC
{
    
    if(self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        self.frame = frame;
        self.mainVC = VC;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // 特别设定
        self.specialView = [[SHDCVisitTimeHeadView alloc]init];
        self.specialView.frame=CGRectMake(0, 0, SCREEN_WIDTH, 44);
        self.tableHeaderView=self.specialView;
        [self.specialView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
        
        _todayArray=[[NSArray alloc]initWithObjects:@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日", nil];
        
    }
    
    return self;
    
}
#pragma mark ---TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _todayArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showUserInfoCellIdentifier = @"SHDCVisitTimeCell";
    SHDCVisitTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell) {
        cell = [[SHDCVisitTimeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
    }
    
    cell.todayLabel.text=_todayArray[indexPath.row];
    cell.timeLabel.text = _timeArray[indexPath.row];
    
    
    
    cell.rightBtn.tag = indexPath.row;
    [cell.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:NO];
    
}




#pragma mark - action
-(void)rightBtnClick:(UIButton *)sender
{
    NSInteger index= sender.tag;
    NSLog(@"%zi",sender.tag);
    
    if(pickerShow)
    {
        [pickerShow removeFromSuperview];
        pickerShow = nil;
    }
    
    selectIndex = index;
    
    StepNumPickerView *picker=[[StepNumPickerView alloc]initWithFrame:CGRectMake((k_screenWidth-240)/2., k_screenHeight, 240, 191)];
    [picker setPickerViewStepFrom:@"17"];//默认
    [picker setPickerViewStepTo:@"21"];//默认
    pickerShow = picker;
    [self.mainVC.view addSubview:picker];
    
    UILabel *nameLab =[[UILabel alloc] initWithFrame:CGRectMake(0, -33, picker.width, 33)];
    nameLab.text = _todayArray[index];
    nameLab.textAlignment = NSTextAlignmentCenter;
    nameLab.textColor = WHITE_COLOR;
    nameLab.backgroundColor = colorWith01;
    [picker addSubview:nameLab];
    
    
    // 确定按钮
    picker.commitBtn.frame=CGRectMake(0, picker.height, picker.width, 35);
    picker.height +=35;
    picker.commitBtn.backgroundColor = colorWith01;
    [picker.commitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [picker.commitBtn addTarget:self action:@selector(pickerClickOK:) forControlEvents:UIControlEventTouchUpInside];
    picker.userInteractionEnabled = YES;
    [picker addSubview:picker.commitBtn];
    
    [UIView animateWithDuration:0.25 animations:^{
        picker.center = self.mainVC.view.center;
    }];
    
}

// 点击特别设定
-(void)tapClick:(id)sender
{
    
    [SHDCSpecialTimeVC gotoMySelf:self.mainVC withSpecialTime:self.specialTime];
    
}


//时间选择器 点击确定
-(void)pickerClickOK:(UIButton *)sender
{
    NSLog(@"picker %@:00 - %@:00",pickerShow.StepFrom,pickerShow.StepTo);
    [self updateTime];
    
    pickerShow.hidden = YES;
}



#pragma mark -  data


-(void)setSpecialTime:(NSString *)specialTime
{
    _specialTime = specialTime;
    self.specialView.timeLabel.text = specialTime;
}

-(void)updateTime
{
    [MBHud showInView:self.mainVC.view withTitle: NSLocalizedString(@"请稍等...", nil)];

    
    NSDictionary *param=@{@"doctorId":DOCTORID ,
                          @"weekFlag":[NSString stringWithFormat:@"%zi",selectIndex +1],//weekFlag
                          @"timePart":@"1",//时间段
                          @"beginTime":[NSString stringWithFormat:@"%@",pickerShow.StepFrom],
                          @"endTime":[NSString stringWithFormat:@"%@",pickerShow.StepTo]
                          };
    
    [AFHTTPClient postJSONPath:SHINTERFACE_updateCallTime httpHost:sexHealthTestIP parameters:param success:^(id responseObject) {
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        NSLog(@"设置时间=%@",dic);
        
        
        //刷新本地数据
        [self.timeArray replaceObjectAtIndex:selectIndex withObject:[NSString stringWithFormat:@"%@:00~%@:00",pickerShow.StepFrom,pickerShow.StepTo]];
        
        [self reloadData];
        
        [MBHud removeFromView:self.mainVC.view];
        
        [pickerShow removeFromSuperview];
        pickerShow = nil;
        
    } fail:^{
        [MBHud removeFromView:self.mainVC.view];

        
        [pickerShow removeFromSuperview];
        pickerShow = nil;
    }];
    
    
}




@end
