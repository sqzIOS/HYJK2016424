//
//  SHDCPhoDiaFirstVC.m
//  sexduoduo
//
//  Created by shown on 15/9/23.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  电话问诊4-1

#import "SHDCPhoDiaFirstVC.h"

#import "SHDCPhoDiaHeadView.h"
#import "SHDCOrderAnswerView.h"
#import "SHDCServiceCateView.h"
#import "SHDCOrderPhoView.h"

#import "SHDCPhoDiaSecVC.h"
@interface SHDCPhoDiaFirstVC ()

@end

@implementation SHDCPhoDiaFirstVC

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
    //************
    //表头
    SHDCPhoDiaHeadView *hView=[[SHDCPhoDiaHeadView alloc]init];
    hView.frame=CGRectMake(APP_SPACE(0), APP_SPACE(64), SCREEN_WIDTH, APP_SPACE(90));
    [self.view addSubview:hView];
    //预约接听号码
    SHDCOrderAnswerView *orView=[[SHDCOrderAnswerView alloc]init];
    orView.frame=CGRectMake(APP_SPACE(0), hView.bottom, SCREEN_WIDTH, APP_SPACE(75));
    [self.view addSubview:orView];
    //服务类别
    SHDCServiceCateView *seView=[[SHDCServiceCateView alloc]init];
    seView.frame=CGRectMake(APP_SPACE(0), orView.bottom, SCREEN_WIDTH, APP_SPACE(75));
    [self.view addSubview:seView];
    //预约去电时间
    SHDCOrderPhoView *oView=[[SHDCOrderPhoView alloc]init];
    oView.frame=CGRectMake(APP_SPACE(0), seView.bottom, SCREEN_WIDTH, APP_SPACE(75));
    [self.view addSubview:oView];

    //按钮
    //分割线
    //确定预约时间
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-APP_SPACE(45), SCREEN_WIDTH, 1)];
    image.backgroundColor=colorWith05;
    [self.view addSubview:image];
    
    UIButton *yesBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    yesBtn.frame=CGRectMake(0, SCREEN_HEIGHT-APP_SPACE(44), SCREEN_WIDTH, APP_SPACE(44));
    yesBtn.backgroundColor=[UIColor whiteColor];
    [yesBtn setTitle:@"确定预约时间" forState:UIControlStateNormal];
    [yesBtn setTitleColor:colorWith01 forState:UIControlStateNormal];
    [yesBtn addTarget:self action:@selector(bt_section_click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yesBtn];

}
- (void)initData
{
    [self requestData];
}
- (void)requestData
{
    NSDictionary *dic=@{@"counselId":@"402890234fcf1f1d014fcf9f71460000"};
    
    [AFHTTPClient getJSONPath:SHINTERFACE_getteldetailConsultation httpHost:sexHealthDoctorIP params:dic success:^(id json) {
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
    SHDCPhoDiaSecVC *vc=[[SHDCPhoDiaSecVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
+(void)gotoMySelf:(id)pvc
{
    if (pvc == nil) {
        return;
    }
    SHDCPhoDiaFirstVC* vc = [[SHDCPhoDiaFirstVC alloc]init];
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}
@end
