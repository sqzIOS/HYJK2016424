//
//  SHBuyDoctorPhoneSeverVC.m
//  sexduoduo
//
//  Created by showm on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHBuyDoctorPhoneSeverVC.h"
#import "SHHealthButton.h"
#import "SHBuyServeVC.h"
#import "StepNumPickerView.h"
@interface SHBuyDoctorPhoneSeverVC ()

@end

@implementation SHBuyDoctorPhoneSeverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTopNavView];
    
    [self initView];
    
}



#pragma  mark ---UI
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
    
    
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"购买服务";
    [navView addSubview:titleImgV];
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_left) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
}
- (void)initView
{
    CGFloat height_1 = 44;//医生名称
    CGFloat height_2 = 34;//预约接听号码 接听时间 服务选择 接听时间 的头部
    CGFloat height_line = 0.5;//线高
    
    
    UIFont  *dotorFont = [UIFont fontWithName:k_FontFold size:15];//医生名称font
    UIFont  *fontSection = [UIFont fontWithName:k_Font size:12];
    UIFont  *cellFont = [UIFont fontWithName:k_Font size:15];
    
    UIColor *lineColor = UICOLOR_RGB(200, 200, 200);
    UIColor *dotorColor = UIColorFromRGB(0x333333);
    UIColor *sectionColor = UIColorFromRGB(0x666666);
    UIColor *cellColor = UIColorFromRGB(0x666666);
    
    
    // 区0
    CGFloat begin_y=STAR_Y +12;
    UIView *line1 =[[UIView alloc] initWithFrame:CGRectMake(0, begin_y, k_screenWidth, height_line)];
    line1.backgroundColor = lineColor;
    [self.view addSubview:line1];
    
    UILabel *doctorNameLab=[[UILabel alloc] initWithFrame:CGRectMake(12, line1.bottom, k_screenWidth-24, height_1)];
    doctorNameLab.backgroundColor = CLEAR_COLOR;
    doctorNameLab.text = @"医师名称";
    doctorNameLab.font = dotorFont;
    doctorNameLab.textColor = dotorColor;
    [self.view addSubview:doctorNameLab];
    
    
    // 区1
    UIView *line2 =[[UIView alloc] initWithFrame:CGRectMake(0, doctorNameLab.bottom, k_screenWidth, height_line)];
    line2.backgroundColor = lineColor;
    [self.view addSubview:line2];
    
    UILabel *sectionHeaderLab1=[[UILabel alloc] initWithFrame:CGRectMake(12, line2.bottom, k_screenWidth-24, height_2)];
    sectionHeaderLab1.backgroundColor = CLEAR_COLOR;
    sectionHeaderLab1.text = @"预约接听号码";
    sectionHeaderLab1.font = fontSection;
    sectionHeaderLab1.textColor = sectionColor;
    [self.view addSubview:sectionHeaderLab1];
    
    UIView *line3 =[[UIView alloc] initWithFrame:CGRectMake(0, sectionHeaderLab1.bottom, k_screenWidth, height_line)];
    line3.backgroundColor = lineColor;
    [self.view addSubview:line3];
    
    
    UILabel *section_1_CellLab=[[UILabel alloc] initWithFrame:CGRectMake(12, line3.bottom, k_screenWidth-24, height_1)];
    section_1_CellLab.backgroundColor = CLEAR_COLOR;
    section_1_CellLab.text = @"18559689281";
    section_1_CellLab.font = cellFont;
    section_1_CellLab.textColor = cellColor;
    [self.view addSubview:section_1_CellLab];
    
    
    // 区2
    UIView *line_2_0 =[[UIView alloc] initWithFrame:CGRectMake(0, section_1_CellLab.bottom, k_screenWidth, height_line)];
    line_2_0.backgroundColor = lineColor;
    [self.view addSubview:line_2_0];
    
    UILabel *sectionHeaderLab2=[[UILabel alloc] initWithFrame:CGRectMake(12, line_2_0.bottom, k_screenWidth-24, height_2)];
    sectionHeaderLab2.backgroundColor = CLEAR_COLOR;
    sectionHeaderLab2.text = @"预约接听时间";
    sectionHeaderLab2.font = fontSection;
    sectionHeaderLab2.textColor = sectionColor;
    [self.view addSubview:sectionHeaderLab2];
    
    UIView *line_2_1 =[[UIView alloc] initWithFrame:CGRectMake(0, sectionHeaderLab2.bottom, k_screenWidth, height_line)];
    line_2_1.backgroundColor = lineColor;
    [self.view addSubview:line_2_1];
    
    section_2_CellLab_0=[[UILabel alloc] initWithFrame:CGRectMake(0, line_2_1.bottom, k_screenWidth/2., height_1)];
    section_2_CellLab_0.backgroundColor = CLEAR_COLOR;
    section_2_CellLab_0.textAlignment = NSTextAlignmentCenter;
    section_2_CellLab_0.text = @"2015-07-09";
    section_2_CellLab_0.font = cellFont;
    section_2_CellLab_0.textColor = cellColor;
    [self.view addSubview:section_2_CellLab_0];
    
    section_2_CellLab_1=[[UILabel alloc] initWithFrame:CGRectMake(k_screenWidth/2., line_2_1.bottom, k_screenWidth/2., height_1)];
    section_2_CellLab_1.backgroundColor = CLEAR_COLOR;
    section_2_CellLab_1.textAlignment = NSTextAlignmentCenter;
    section_2_CellLab_1.text = @"17:00~21:00 ";
    section_2_CellLab_1.font = cellFont;
    section_2_CellLab_1.textColor = cellColor;
    [self.view addSubview:section_2_CellLab_1];
    
    UIButton *timeSelectBtn1=[UIButton buttonWithType:0];
    timeSelectBtn1.frame = section_2_CellLab_0.frame;
    timeSelectBtn1.tag = 1002;
    [timeSelectBtn1 addTarget:self action:@selector(serverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:timeSelectBtn1];
    
    UIButton *timeSelectBtn2=[UIButton buttonWithType:0];
    timeSelectBtn2.frame = section_2_CellLab_1.frame;
    timeSelectBtn2.tag = 1003;
    [timeSelectBtn2 addTarget:self action:@selector(serverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:timeSelectBtn2];
    
    // 区3
    UIView *line_3_0 =[[UIView alloc] initWithFrame:CGRectMake(0, section_2_CellLab_0.bottom, k_screenWidth, height_line)];
    line_3_0.backgroundColor = lineColor;
    [self.view addSubview:line_3_0];
    
    UILabel *sectionHeaderLab3=[[UILabel alloc] initWithFrame:CGRectMake(12, line_3_0.bottom, k_screenWidth-24, height_2)];
    sectionHeaderLab3.backgroundColor = CLEAR_COLOR;
    sectionHeaderLab3.text = @"服务选择";
    sectionHeaderLab3.font = fontSection;
    sectionHeaderLab3.textColor = sectionColor;
    [self.view addSubview:sectionHeaderLab3];
    
    UIView *line_3_1 =[[UIView alloc] initWithFrame:CGRectMake(0, sectionHeaderLab3.bottom, k_screenWidth, height_line)];
    line_3_1.backgroundColor = lineColor;
    [self.view addSubview:line_3_1];
    
    UILabel *section_3_CellLab_0=[[UILabel alloc] initWithFrame:CGRectMake(12, line_3_1.bottom, k_screenWidth-24, height_1)];
    section_3_CellLab_0.backgroundColor = CLEAR_COLOR;
    section_3_CellLab_0.text = @"05~15分钟：50元/每次";
    section_3_CellLab_0.font = cellFont;
    section_3_CellLab_0.textColor = cellColor;
    [self.view addSubview:section_3_CellLab_0];
    
    
    //被选中图标1
    serverSelectImage1=[[UIImageView alloc] initWithFrame:CGRectMake(k_screenWidth-40, line_3_1.bottom +14, 16, 16)];
    serverSelectImage1.image = UIImageByName(@"health_hasSelect");
    if (selectServerNum ==0) {
        serverSelectImage1.hidden = NO;
    }else serverSelectImage1.hidden = YES;
    [self.view addSubview:serverSelectImage1];
    
    
    
    UIButton *serverSelectBtn1=[UIButton buttonWithType:0];
    serverSelectBtn1.frame = section_3_CellLab_0.frame;
    serverSelectBtn1.tag = 1000;
    [serverSelectBtn1 addTarget:self action:@selector(serverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:serverSelectBtn1];
    
    
    
    
    UIView *line_3_2 =[[UIView alloc] initWithFrame:CGRectMake(0, section_3_CellLab_0.bottom, k_screenWidth, height_line)];
    line_3_2.backgroundColor = lineColor;
    [self.view addSubview:line_3_2];
    
    UILabel *section_3_CellLab_1=[[UILabel alloc] initWithFrame:CGRectMake(12, line_3_2.bottom, k_screenWidth-24, height_1)];
    section_3_CellLab_1.backgroundColor = CLEAR_COLOR;
    section_3_CellLab_1.text = @"15~30分钟：100元/每次";
    section_3_CellLab_1.font = cellFont;
    section_3_CellLab_1.textColor = cellColor;
    [self.view addSubview:section_3_CellLab_1];
    
    //被选中图标2
    serverSelectImage2=[[UIImageView alloc] initWithFrame:CGRectMake(k_screenWidth-40, line_3_2.bottom +14, 16, 16)];
    serverSelectImage2.image = UIImageByName(@"health_hasSelect");
    if (selectServerNum ==1) {
        serverSelectImage2.hidden = NO;
    }else serverSelectImage2.hidden = YES;
    [self.view addSubview:serverSelectImage2];
    
    UIButton *serverSelectBtn2=[UIButton buttonWithType:0];
    serverSelectBtn2.frame = section_3_CellLab_1.frame;
    serverSelectBtn2.tag = 1001;
    [serverSelectBtn2 addTarget:self action:@selector(serverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:serverSelectBtn2];
    
    UIView *line_3_3 =[[UIView alloc] initWithFrame:CGRectMake(0, section_3_CellLab_1.bottom, k_screenWidth, height_line)];
    line_3_3.backgroundColor = lineColor;
    [self.view addSubview:line_3_3];
    
    
    
    //立即购买
    SHHealthButton *_buyBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
    _buyBtn.frame = CGRectMake(0, SCREEN_HEIGHT - APP_SPACE(50) , SCREEN_WIDTH, APP_SPACE(50));
    _buyBtn.backgroundColor = colorWithLYWhite;
//    _buyBtn.backgroundColor = RED_COLOR;

    [_buyBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
    _buyBtn.tag = 1003;
    _buyBtn.nameLabel.text = NSLocalizedString(@"立即购买", nil);
    _buyBtn.nameLabel.font = Font_ExtraLarge_bold;
    _buyBtn.nameLabel.textColor = colorWith01;
    CGSize size = [LYGlobalDefine getTextContent:_buyBtn.nameLabel.text withFont:_buyBtn.nameLabel.font];
    _buyBtn.nameLabel.frame = CGRectMake((_buyBtn.width - size.width)/2, APP_SPACE(15), size.width, size.height);
    [_buyBtn addSubview:_buyBtn.nameLabel];

    [self.view addSubview:_buyBtn];

}

#pragma  mark ---data

#pragma mark ---action 事件
- (void)bt_action_left
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)bt_action_event:(UIButton *)sender
{
    if (sender.tag==1003) {
        [SHBuyServeVC gotoMySelf:self];

    }
}

// 两个服务选项的选择
-(void)serverBtnClick:(UIButton *)sender
{
    NSInteger tagIndex= sender.tag;
    
    if(tagIndex == 1000)//服务选择
    {
        selectServerNum = 0;
        serverSelectImage1.hidden = NO;
        serverSelectImage2.hidden = YES;
        
    }else if (tagIndex == 1001)
    {
        selectServerNum = 1;
        
        serverSelectImage1.hidden = YES;
        serverSelectImage2.hidden = NO;
        
    }
    
    
    if(tagIndex == 1002)//日期选择
    {
        datePicker =[[UIDatePicker alloc] initWithFrame:CGRectMake(0, k_screenHeight, 0, 0)];
        datePicker.backgroundColor = WHITE_COLOR;
        datePicker.center=self.view.center;
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.minuteInterval = 60;//你可以将分钟表盘设置为以不同时间间隔来显示分钟
        NSDate * minDate = [NSDate allocWithFormatString:@"2015-01-01 00:00:00 -0500"];
        NSDate * maxDate = [NSDate allocWithFormatString:@"2099-01-01 00:00:00 -0500"];
        
        datePicker.layer.borderColor= GRAY_COLOR.CGColor;
        datePicker.minimumDate = minDate;
        datePicker.maximumDate = maxDate;
        
        datePicker.date = minDate;
        
        [ datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
        [self.view addSubview:datePicker];
        
        
        datePicker.backgroundColor = UIColorFromRGB(0xfafafa);

        [UIView animateWithDuration:0.25 animations:^{
            datePicker.center = self.view.center;
        }];
        
//        UIButton * selectBtn=[UIButton buttonWithType:0];
//        [selectBtn setTitle:@"确定" forState:UIControlStateNormal];
//        [selectBtn setTitleColor:colorWith01 forState:UIControlStateNormal];
////        selectBtn.backgroundColor =RED_COLOR;
//        selectBtn.frame = CGRectMake(0, 0, 60, 40);
//        selectBtn.bottom =0;
//        [selectBtn addTarget:self action:@selector(serverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [datePicker addSubview:selectBtn];
        
    }
    
    if(tagIndex == 1003)//时间选择
    {
        StepNumPickerView *picker=[[StepNumPickerView alloc]initWithFrame:CGRectMake((k_screenWidth-240)/2., k_screenHeight, 240, 191)];
        picker.stepLabStr=section_2_CellLab_1;
        [picker setPickerViewStepFrom:@"17"];//默认
        [picker setPickerViewStepTo:@"21"];//默认
        timePicker=picker;
        [self.view addSubview:picker];
        
        [UIView animateWithDuration:0.25 animations:^{
            picker.center = self.view.center;
        }];

    }
}


//日期选择
-(void)dateChanged:(id)sender{
    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate* _date = control.date;
    /*添加你自己响应代码*/
    
    NSLog(@"选中的日期=%@",_date);
    
    NSString *dateTime=[_date description];
    
    section_2_CellLab_0.text =[dateTime substringToIndex:10];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [datePicker removeFromSuperview];
    [timePicker removeFromSuperview];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc
{
    if (pvc == nil ) {
        return;
    }
    
    SHBuyDoctorPhoneSeverVC* vc = [[SHBuyDoctorPhoneSeverVC alloc]init];
    //    vc.model = model;
//    vc.doctorIdStr = idStr;
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
