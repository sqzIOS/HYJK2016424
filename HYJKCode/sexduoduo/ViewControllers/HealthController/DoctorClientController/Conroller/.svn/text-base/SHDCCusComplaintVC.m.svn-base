//
//  SHDCCusComplaintVC.m
//  sexduoduo
//
//  Created by shown on 15/9/21.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  客诉 5-0

#import "SHDCCusComplaintVC.h"
#import "SHDCCusCompCell.h"
#import "SHDCAppealVC.h"
@interface SHDCCusComplaintVC ()

@end

@implementation SHDCCusComplaintVC

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
     UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"客诉";
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
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}
- (void)initData
{
    NSDictionary *dic=@{@"doctorId":DOCTORID,@"pageApp":@"1",@"pageSizeApp":@"0"};
    
    [AFHTTPClient getJSONPath:SHINTERFACE_getLookConsultation httpHost:sexHealthDoctorIP params:dic success:^(id json) {
        
            
            //可以直接用 responseObject 也可以使用字符串operation.responseString
            NSString *str=[[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
            
            //可以对字符串 提前做些处理 比如删除换行符 之类的
            NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
            
            NSDictionary* dictResponse = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
            
            NSLog(@"医师查看客诉失败 = %@ -->医师查看客诉 ",dictResponse);
        
    } fail:^{
        NSLog(@"17、医师查看客诉失败－－－－－－");
    }];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showUserInfoCellIdentifier = @"SHDCCusCompCell";
    SHDCCusCompCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell) {
        cell = [[SHDCCusCompCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
    }
    
    cell.contentLabel.text=@"用户AAA给了不满意，并投诉了";
    cell.timeLabel.text=@"08-02  19:00~21:00";
    
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHDCAppealVC *vc=[[SHDCAppealVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)bt_Nav_left
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
