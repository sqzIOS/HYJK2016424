//
//  SHNearbyDoctorVC.m
//  SexHealth
//
//  Created by ly1992 on 15/6/25.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHNearbyDoctorVC.h"
#import "SHMydoctorModel.h"
#import "SHMyDoctorTableView.h"
#import "MBHud.h"
#import "MyCLController.h"
@interface SHNearbyDoctorVC ()
//医师列表
@property (strong,nonatomic) SHMyDoctorTableView *tableView;
//医师列表 Model
@property (strong,nonatomic) SHMydoctorModel *model;
//
@property (strong,nonatomic) NSMutableArray *tvData;
@end

@implementation SHNearbyDoctorVC
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
    
    [self initData];
    
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
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(160-92/3., 30, 92*2/3., 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"医师";
    [navView addSubview:titleImgV];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(278, 25 , 32, 32);
    [rightBtn setImage:[UIImage imageNamed:@"health_map"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 1000;
    [navView addSubview:rightBtn];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
}
- (void)initView
{
    CGRect frame = CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT-STAR_Y);
    self.tableView = [[SHMyDoctorTableView alloc]initWithTableViewWithFrame:frame withVC:self withType:1];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    // 1.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
}
#pragma mark ---Data
- (void)initData
{
    if (_tvData == nil) {
        _tvData = [[NSMutableArray alloc]init];
    }
    _model = [SHMydoctorModel loadLocalDataForDoctorModel];
    if (_model && _model.datasource && _model.datasource.count > 0) {
        [self handleRemoteDataForDoc:_model];
    }
    //    if (!_docModel.hadload) {
    //        [self requestRemoteData:_docModel type:0];
    //    }
    [self requestData];
}
#pragma mark ---网络请求
-(void)requestData
{
    [MBHud showInView:self.view withTitle:@"加载中..."];
    MyCLController *mylocation = [MyCLController sharedInstance];
    [mylocation startUpdateLocation];
    
    NSDictionary *docDic=@{@"pageApp":@"1",
                           @"pageSizeApp":@"10",
                           @"lng":mylocation.longitudeStr ? mylocation.longitudeStr :@"0",
                           @"lat":mylocation.latitudeStr ? mylocation.latitudeStr :@"0"};
    [AFHTTPClient postJSONPath:SHINTERFACE_selectDoctorArea httpHost:sexHealthIP parameters:docDic success:^(id responseObject) {
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        NSLog(@"附近医师%@---》附近医师",dic);
        if (dic[@"success"] && [dic[@"success"] intValue ]==1)
        {
            NSArray *array=dic[@"datasource"];
            NSMutableArray *docArray=[[NSMutableArray alloc] init];
            for (int i=0; i<array.count; i++) {
                SHMydoctorInfo *info = [[SHMydoctorInfo alloc]init];
                
                info.nearbyArea = [NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"area"]];
                info.nearbyDistance =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"distance"]];
                info.nearbyDoctorId =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"doctorId"]];
                info.nearbyDoctorPostl =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"doctorPost"]];
                info.nearbyHeadimgurl =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"headimgurl"]];
                info.nearbyIntroduce =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"introduce"]];
                info.nearbyName =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"name"]];
                info.nearbyPopularity =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"popularity"]];
                [docArray addObject:info];
            }
            
            self.tableView.docData=docArray;
        }
        
        
        
        [MBHud removeFromView:self.view];
    } fail:^{
        [MBHud removeFromView:self.view];
    }];
}
#pragma mark ---数据处理
-(void)handleRemoteDataForDoc:(SHMydoctorModel*)model
{
    [_tvData removeAllObjects];
    [_tvData addObjectsFromArray:model.datasource];
    self.tableView.docData = _tvData;
}

/**
 远程读取数据
 type:0表示正常请求,1表示下拉,2表示上拉
 **/
-(void)requestRemoteDataFordoc:(SHMydoctorModel*)reqModel type:(NSUInteger)type
{
    if (type == 0) {
        [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    }
    BOOL flag = NO;
    if (type == 0 || type == 1) {
        flag = YES;
    }
    [SHMydoctorModel loadRemoteDataForDoctorModel:reqModel flag:flag cb:^(BOOL isOK, SHMydoctorModel *model) {
        if (isOK) {
            [self handleRemoteDataForDoc:model];
        }
        if (type == 0) {
            [MBHud removeFromView:self.view];
        } else if (type == 1) {
           
        } else if (type == 2) {
            
        }
    }];
}

#pragma mark ---action 事件
- (void)bt_action_right
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bt_action_event:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
//        [SHDoctorMapVC gotoMySelf:self];
    }
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
    [self.tableView headerEndRefreshing];
}
-(void)footRereshingEnd
{
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self.tableView footerEndRefreshing];
}

#pragma mark ---didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc
{
    if (pvc == nil) {
        return;
    }
    SHNearbyDoctorVC* vc = [[SHNearbyDoctorVC alloc]init];
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}

@end
