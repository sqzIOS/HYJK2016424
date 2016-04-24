//
//  SHHealthVC.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHHealthVC.h"
#import "SHHealthScrollView.h"
#import "SHMyDoctorVC.h"
#import "MyCLController.h"
#import "SHProblemDetailVC.h"
@interface SHHealthVC ()
//scrollView 展示界面
@property (nonatomic,strong) SHHealthScrollView *scrollView;

@end

@implementation SHHealthVC
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTopNavView];
    
    [self initView];
    
    
    
//    [[SHLocationManager shareInstance] startUpdateLocation];
    
    [[MyCLController sharedInstance] startUpdateLocation];
    
    
}

#pragma mark ---UI
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
    //
    UIImageView *titleImgV = [[UIImageView alloc] initWithFrame:CGRectMake(160-92/3., 30, 92*2/3., 38*2/3.)];
    [titleImgV setImage:[UIImage imageNamed:@"navigation_health.png"]];
    [navView addSubview:titleImgV];
    
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(278, 25 , 32, 32);
    //    [rightBtn setTitle:@"next" forState:UIControlStateNormal];
    //    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"health_mine.png"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(bt_action_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:rightBtn];
    
}


- (void)initView
{
    CGRect frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49);
    self.scrollView = [[SHHealthScrollView alloc]initWithMineScrollView:nil withFrame:frame withVC:self];
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    
    
    // 1.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.scrollView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
}


#pragma mark - 网络数据请求


-(void)headerRereshing
{
    
    [self.scrollView refrashData];
    [self performSelector:@selector(hearderRereshingEnd) withObject:nil afterDelay:0.2];
}

-(void)hearderRereshingEnd
{
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self.scrollView headerEndRefreshing];
}


-(void)requestDate
{
    
}


#pragma mark ---action 事件
- (void)bt_action_right
{
    
    IS_Doctor = !IS_Doctor;
    
    [_scrollView refreshView];
    return;
    
    [SHMyDoctorVC gotoMySelf:self];
    
    
//    SHHistoryModel *model=[SHHistoryModel loadLocalDataForHistoryModel];
//    [SHProblemDetailVC gotoMySelf:self withModel:model.datasource.firstObject];
}
#pragma mark ---didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
