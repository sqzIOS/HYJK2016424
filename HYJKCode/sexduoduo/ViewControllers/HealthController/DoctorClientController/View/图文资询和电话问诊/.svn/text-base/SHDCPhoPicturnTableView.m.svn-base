//
//  SHDCPhoPicturnTableView.m
//  sexduoduo
//
//  Created by shown on 15/9/24.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCPhoPicturnTableView.h"
#import "SHDCPhoPicturnCell.h"
#import "SHDCPictureText.h"
#import "SHDCPhoDiaFirstVC.h"
@implementation SHDCPhoPicturnTableView


- (id)initWithCopeTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC
{
    
    if(self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        self.frame = frame;
        self.mainVC = VC;
        self.rowHeight = 90;
        
        _dataArray=[[NSMutableArray alloc]initWithCapacity:0];
        [self requestData];
        [self addHeaderWithTarget:self action:@selector(headerRereshing)];
        [self addFooterWithTarget:self action:@selector(footerRereshing)];
    }
    return self;
    
}
- (void)requestData
{
    [MBHud showInView:self withTitle: NSLocalizedString(@"请稍等...", nil)];
    NSDictionary *dic=@{@"pageApp":@"1",@"pageSizeApp":@"0",@"doctorId":@"402890194f77f348014f78c8709e003f"};
    
    [AFHTTPClient getJSONPath:SHINTERFACE_getphoConsultation httpHost:sexHealthDoctorIP params:dic success:^(id json) {
        NSLog(@"图文咨询请求成功－－－－－－－》%@",json);
        [MBHud removeFromView:self];
    } fail:^{
        NSLog(@"图文咨询请求失败－－－－－－－");
        [MBHud removeFromView:self];
    }];
}
#pragma mark ---TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
    //return _dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showUserInfoCellIdentifier = @"SHDCPhoPicturnCell";
    SHDCPhoPicturnCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell)
    {
        cell = [[SHDCPhoPicturnCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
    }
    /*********
     ****数据****
     **************/
    SHDCPictureText *pText=[[SHDCPictureText alloc]init];
    
    cell.headImageView.image=[UIImage imageNamed:@"doctor.png"];
    cell.sexImageView.image=[UIImage imageNamed:@""];
    cell.sexImageView.backgroundColor=[UIColor blueColor];
    cell.ageLabel.text=pText.ageStr;
    cell.contentLabel.text=pText.contentStr;
    cell.timeLabel.text=pText.timeStr;
    cell.answerlabel.text=pText.answerStr;
    cell.completelabel.text=pText.completeStr;
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
    [SHDCPhoDiaFirstVC gotoMySelf:self.mainVC];
}
-(void)headerRereshing
{
    [self performSelector:@selector(hearderRereshingEnd) withObject:nil afterDelay:0.2];
}
-(void)footerRereshing
{
    [self performSelector:@selector(footRereshingEnd) withObject:nil afterDelay:0.2];
}
-(void)hearderRereshingEnd
{
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self headerEndRefreshing];
}
-(void)footRereshingEnd
{
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self footerEndRefreshing];
}

@end
