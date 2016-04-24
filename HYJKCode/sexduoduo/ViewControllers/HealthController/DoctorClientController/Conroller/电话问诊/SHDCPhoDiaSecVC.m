//
//  SHDCPhoDiaSecVC.m
//  sexduoduo
//
//  Created by shown on 15/9/23.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCPhoDiaSecVC.h"

#import "SHDCOrderPhoView.h"
#import "SHDCMyPhoneView.h"

#import "SHDCPhoneDiagnosisVC.h"
@interface SHDCPhoDiaSecVC ()

@end

@implementation SHDCPhoDiaSecVC

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
    //预约去电时间
    SHDCOrderPhoView *oView=[[SHDCOrderPhoView alloc]init];
    oView.frame=CGRectMake(APP_SPACE(0), APP_SPACE(64), SCREEN_WIDTH, APP_SPACE(75));
    [self.view addSubview:oView];
    //我的去电时间
    SHDCMyPhoneView *myView=[[SHDCMyPhoneView alloc]init];
    myView.frame=CGRectMake(APP_SPACE(0), oView.bottom, SCREEN_WIDTH, APP_SPACE(75));
    [self.view addSubview:myView];
    //表尾
    UIView *fView=[[UIView alloc]initWithFrame:CGRectMake(APP_SPACE(0), myView.bottom+APP_SPACE(15), SCREEN_WIDTH, SCREEN_HEIGHT)];
    fView.backgroundColor=colorWith05;
    [self.view addSubview:fView];
    //备注
    UILabel *beiLabel=[[UILabel alloc]initWithFrame:CGRectMake(APP_SPACE(10), APP_SPACE(10), 60, 20)];
    beiLabel.backgroundColor=colorWith05;
    beiLabel.text=@"备注:";
    beiLabel.font=Font_Middle;
    [fView addSubview:beiLabel];
    //备注详情
    UILabel *beiDatailLab=[[UILabel alloc]initWithFrame:CGRectMake(APP_SPACE(10), beiLabel.bottom, SCREEN_WIDTH-APP_SPACE(20), 100)];
    beiDatailLab.text=@"你的去电时间设定成功后，都会恢复好地方佛对方会接到提醒，并且在指定时间你大概会有更多接收到一条短信提醒你若你未在时间范围内获得很大范围内去电，则用户有权对你的服务进行丢的好低档货投诉";
    beiDatailLab.backgroundColor=colorWith05;
    beiDatailLab.font=Font_Small;
    beiDatailLab.numberOfLines=4;
    [fView addSubview:beiDatailLab];
    //按钮
    //分割线
    //确定预约时间
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-APP_SPACE(45), SCREEN_WIDTH, 1)];
    image.backgroundColor=colorWith05;
    [self.view addSubview:image];
    
    UIButton *yesBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    yesBtn.frame=CGRectMake(0, SCREEN_HEIGHT-APP_SPACE(44), SCREEN_WIDTH, APP_SPACE(44));
    yesBtn.backgroundColor=[UIColor whiteColor];
    [yesBtn setTitle:@"确定修改" forState:UIControlStateNormal];
    [yesBtn setTitleColor:colorWith01 forState:UIControlStateNormal];
    [yesBtn addTarget:self action:@selector(bt_section_click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yesBtn];
    
}
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
- (void)bt_section_click
{
    ////确定预约时间
    SHDCPhoneDiagnosisVC *vc=[[SHDCPhoneDiagnosisVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
