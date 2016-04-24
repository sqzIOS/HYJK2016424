//
//  SHDCReturnVC.m
//  sexduoduo
//
//  Created by shown on 15/9/21.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  退回 4-4-1

#import "SHDCReturnVC.h"
#import "SHDCHeadView.h"
#import "SHDCFootView.h"
@interface SHDCReturnVC ()

@end

@implementation SHDCReturnVC

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
    titleImgV.text = @"退回";
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
    
    SHDCHeadView *headVC=[[SHDCHeadView alloc]init];
    headVC.frame=CGRectMake(0, 0, SCREEN_WIDTH, 200);
    [self.view addSubview:headVC];
    
    SHDCFootView *fView=[[SHDCFootView alloc]init];
    fView.frame=CGRectMake(APP_SPACE(0), headVC.bottom+APP_SPACE(10), SCREEN_WIDTH, SCREEN_HEIGHT);
    fView.backgroundColor=colorWith05;
    [self.view addSubview:fView];
    
    //分割线
    //确定退回——————按钮
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-APP_SPACE(45), SCREEN_WIDTH, 1)];
    image.backgroundColor=colorWith04;
    [self.view addSubview:image];
    
    UIButton *yesBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    yesBtn.frame=CGRectMake(0, SCREEN_HEIGHT-APP_SPACE(44), SCREEN_WIDTH, APP_SPACE(44));
    yesBtn.backgroundColor=[UIColor whiteColor];
    [yesBtn setTitle:@"确定退回" forState:UIControlStateNormal];
    [yesBtn setTitleColor:colorWith01 forState:UIControlStateNormal];
    yesBtn.tag=1001;
    [yesBtn addTarget:self action:@selector(bt_section_left) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yesBtn];
    
}
- (void)initData
{
    
}
- (void)bt_Nav_left
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)bt_section_left
{
    //确定退回;
}
@end
