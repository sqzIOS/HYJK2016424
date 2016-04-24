//
//  SHTreatmentVC.m
//  sexduoduo
//
//  Created by shown on 15/9/6.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHTreatmentVC.h"
#import "SHTreatmentView.h"
@interface SHTreatmentVC ()

@property (nonatomic,strong)SHTreatmentView *treatmentVC;

@end

@implementation SHTreatmentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self setTopNavView];
    [self initView];
}
#pragma mark- UI界面
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,self.view.frame.size.width, 64)];
    [self.view addSubview:navView];
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"性偏离";
    [navView addSubview:titleImgV];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_right:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = 1000;
    [navView addSubview:leftBtn];
}
- (void)initView
{
    _treatmentVC=[[SHTreatmentView alloc]init];
    _treatmentVC.frame=CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT);
    //_treatmentVC.backgroundColor=[UIColor blueColor];
    [self.view addSubview:_treatmentVC];
}


#pragma mark-touch点击时间
- (void)bt_action_right:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}
@end
