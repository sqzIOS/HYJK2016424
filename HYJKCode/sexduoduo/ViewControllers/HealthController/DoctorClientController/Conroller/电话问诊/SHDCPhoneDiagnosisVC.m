//
//  SHDCPhoneDiagnosisVC.m
//  sexduoduo
//
//  Created by shown on 15/9/22.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  电话问诊 4-3

#import "SHDCPhoneDiagnosisVC.h"

#import "SHDCPhoDiaHeadView.h"
#import "SHDCOrderAnswerView.h"
#import "SHDCServiceCateView.h"
#import "SHDCOrderPhoView.h"
#import "SHDCMyPhoneView.h"

@interface SHDCPhoneDiagnosisVC ()

@end

@implementation SHDCPhoneDiagnosisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
    [self initData];
    
    [self setTopNavView];
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
    titleImgV.text = @"电话问诊";
    [navView addSubview:titleImgV];
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    leftBtn.tag=1000;
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_Nav_left) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
    
    
    
}
- (void)initView
{
    self.view.backgroundColor=[UIColor whiteColor];
    self.view.frame=CGRectMake(APP_SPACE(0), APP_SPACE(0), SCREEN_WIDTH, SCREEN_HEIGHT+120);
    //************
    //表头
    SHDCPhoDiaHeadView *hView=[[SHDCPhoDiaHeadView alloc]init];
    hView.frame=CGRectMake(APP_SPACE(0), APP_SPACE(64), SCREEN_WIDTH, APP_SPACE(90));
    //预约接听号码
    [self.view addSubview:hView];
    SHDCOrderAnswerView *orView=[[SHDCOrderAnswerView alloc]init];
    orView.frame=CGRectMake(APP_SPACE(0), hView.bottom, SCREEN_WIDTH, APP_SPACE(75));
    //服务类别
    SHDCServiceCateView *seView=[[SHDCServiceCateView alloc]init];
    seView.frame=CGRectMake(APP_SPACE(0), orView.bottom, SCREEN_WIDTH, APP_SPACE(75));
    [self.view addSubview:seView];
    //预约去电时间
    [self.view addSubview:orView];
    SHDCOrderPhoView *oView=[[SHDCOrderPhoView alloc]init];
    oView.frame=CGRectMake(APP_SPACE(0), seView.bottom, SCREEN_WIDTH, APP_SPACE(75));
    [self.view addSubview:oView];
    //我的去电时间
    SHDCMyPhoneView *myView=[[SHDCMyPhoneView alloc]init];
    myView.frame=CGRectMake(APP_SPACE(0), oView.bottom, SCREEN_WIDTH, APP_SPACE(75));
    [self.view addSubview:myView];
    //*************
    //退回按钮
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(APP_SPACE(5), SCREEN_HEIGHT-APP_SPACE(86), 36, 36);
    backBtn.backgroundColor=colorWith07;
    backBtn.layer.cornerRadius=18;
    backBtn.font=Font_Small;
    [backBtn setTitle:@"退回" forState:UIControlStateNormal];
    [backBtn setTitleColor:colorWithLYWhite forState:UIControlStateNormal];
    backBtn.tag=1002;
    [backBtn addTarget:self action:@selector(bt_section_click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    //按钮
    //分割线
    //确定预约时间
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-APP_SPACE(45), SCREEN_WIDTH, 1)];
    image.backgroundColor=colorWith05;
    [self.view addSubview:image];
    
    UIButton *yesBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    yesBtn.frame=CGRectMake(0, SCREEN_HEIGHT-APP_SPACE(44), SCREEN_WIDTH, APP_SPACE(44));
    yesBtn.backgroundColor=[UIColor whiteColor];
    //4-3-0 确定预约时间 4-3-1 以退回 4-3-2 已确定预约
    [yesBtn setTitle:@"确定预约时间" forState:UIControlStateNormal];
    [yesBtn setTitleColor:colorWith01 forState:UIControlStateNormal];
    yesBtn.tag=1001;
    [yesBtn addTarget:self action:@selector(bt_section_click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yesBtn];
    
}
#pragma mark- Data数据存储
- (void)initData
{
    NSDictionary *dic=@{@"counselId":@"402890234fcf1f1d014fcf9f71460000",@"status":@"0",@"doctorTime":@"0"};
    
    [AFHTTPClient getJSONPath:SHINTERFACE_gettelTimeConsultation httpHost:sexHealthDoctorIP params:dic success:^(id json) {
        NSLog(@"电话咨询详情成功－－－－－－》%@",json);
    } fail:^{
        NSLog(@"电话咨询详情失败－－－－－－");
    }];

}
#pragma mark- click点击事件
- (void)bt_Nav_left
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bt_section_click:(UIButton *)sender
{
    
}
@end
