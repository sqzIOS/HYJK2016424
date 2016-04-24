//
//  SHDCinterlocutionDetailVC.m
//  sexduoduo
//
//  Created by shown on 15/9/15.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  "问答详情" 1-1

#import "SHDCinterlocutionDetailVC.h"

@interface SHDCinterlocutionDetailVC ()

@end

@implementation SHDCinterlocutionDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self initView];
    
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
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,self.view.frame.size.width, 64)];
    [self.view addSubview:navView];
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"问答详情";
    
    [navView addSubview:titleImgV];
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_Nav_left) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
    //
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame=CGRectMake(navView.frame.size.width-64, 30, 54, 24);
    rightBtn.backgroundColor=colorWith01;
    rightBtn.layer.cornerRadius=10.0;
    rightBtn.tag=1006;
    [rightBtn setTitle:@"记录" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(bt_Nav_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:rightBtn];
}
- (void)initView
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_tableView];
    
    _inputView=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)];
    _inputView.backgroundColor=colorWith04;
    [self.view addSubview:_inputView];
    _inputTextField = [[UITextField alloc]init];
    _inputTextField.frame = CGRectMake(10, 4.5, 250, 35);
    _inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    [_inputView addSubview:_inputTextField];
    _inputTextField.delegate = self;
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(260, 0, 50, 40);
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sendButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_inputView addSubview:button];
    
}
#pragma mark---------
#pragma mark tableView输入框的协议方法
//点击输入框的协议方法
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:7];
    _inputView.center = CGPointMake(160, 480-216-22);
    _tableView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-216);
    [UIView commitAnimations];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:7];
    _inputView.center = CGPointMake(160, 480-22);
    _tableView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-216);
    [UIView commitAnimations];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    return cell;
}

- (void)bt_Nav_left
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bt_Nav_right
{
    //完成问诊;
}
-(void)sendButtonClick
{
    
}

@end

