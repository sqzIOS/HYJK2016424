//
//  SHNearbyHospitalVC.m
//  SexHealth
//
//  Created by ly1992 on 15/6/25.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHNearbyHospitalVC.h"
//#import "SHMapVC.h"
#import "SHNearbyHospitalModel.h"
#import "SHNearbyHospitalTableView.h"
#import "MBHud.h"
#import "MyCLController.h"
@interface SHNearbyHospitalVC ()

@property (nonatomic,strong)SHNearbyHospitalModel *model;

@property (nonatomic,strong)NSMutableArray *tvData;

@property (nonatomic,strong) SHNearbyHospitalTableView *tableView;

@end

@implementation SHNearbyHospitalVC

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
#pragma mark ---UI
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
    titleImgV.text = @"医院";
    [navView addSubview:titleImgV];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(278, 25 , 32, 32);
    [rightBtn setImage:[UIImage imageNamed:@"health_map"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 1000;
    [navView addSubview:rightBtn];
    
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
    
    
    
}
- (void)initView
{
    CGRect frame = CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT-STAR_Y);
    self.tableView = [[SHNearbyHospitalTableView alloc]initWithHospitalTableViewWithFrame:frame withVC:self];
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
    _model = [SHNearbyHospitalModel loadLocalDataForHospitalModel];
    if (_model && _model.datasource && _model.datasource.count > 0) {
        [self handleRemoteDataForHospital:_model];
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
    MyCLController *mylocation=[MyCLController sharedInstance];
    [mylocation startUpdateLocation];
    
    NSDictionary *tempDic=@{@"pageApp":@"1",
                           @"pageSizeApp":@"10",
                            @"lng":mylocation.longitudeStr ? mylocation.longitudeStr :@"0",
                            @"lat":mylocation.latitudeStr ? mylocation.latitudeStr :@"0"};
    [AFHTTPClient postJSONPath:SHINTERFACE_getNearbyHospitalList httpHost:sexHealthIP parameters:tempDic success:^(id responseObject) {
        
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        NSLog(@"附近医院%@---》附近医院",dic);
        
        if (dic[@"success"] && [dic[@"success"] intValue ]==1) {
            
            NSArray *array=dic[@"datasource"];
            
            NSMutableArray *tempArray=[[NSMutableArray alloc] init];
            for (int i=0; i<array.count; i++) {
                SHNearbyHospitalInfo *info=[[SHNearbyHospitalInfo alloc] init];
                
                info.iconStr= [NSString stringWithFormat:@"%@", dic[@"datasource"][i][@"headimgurl"]];
                info.nameStr= [NSString stringWithFormat:@"%@", dic[@"datasource"][i][@"name"]];
                info.idStr = [NSString stringWithFormat:@"%@", dic[@"datasource"][i][@"hospitaId"]];
                info.addressStr = [NSString stringWithFormat:@"%@", dic[@"datasource"][i][@"address"]];
                info.contentStr = [NSString stringWithFormat:@"%@", dic[@"datasource"][i][@"introduce"]];
                [tempArray addObject:info];
                

            }
            
            self.tableView.tvData = tempArray;
//            model.datasource = [[NSMutableArray alloc] initWithArray:array];

        }
        [MBHud removeFromView:self.view];
        
    } fail:^{
        [MBHud removeFromView:self.view];
    }];
}

#pragma mark ---数据处理
-(void)handleRemoteDataForHospital:(SHNearbyHospitalModel*)model
{
    [_tvData removeAllObjects];
    [_tvData addObjectsFromArray:model.datasource];
    self.tableView.tvData = _tvData;
}

/**
 远程读取数据
 type:0表示正常请求,1表示下拉,2表示上拉
 **/
-(void)requestRemoteDataForHospital:(SHNearbyHospitalModel*)reqModel type:(NSUInteger)type
{
    if (type == 0) {
        [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    }
    BOOL flag = NO;
    if (type == 0 || type == 1) {
        flag = YES;
    }
    [SHNearbyHospitalModel loadRemoteDataForHospitalModel:reqModel flag:flag cb:^(BOOL isOK, SHNearbyHospitalModel *model) {
        if (isOK) {
            [self handleRemoteDataForHospital:model];
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
//        [SHMapVC gotoMySelf:self];
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc
{
    if (pvc == nil) {
        return;
    }
    SHNearbyHospitalVC* vc = [[SHNearbyHospitalVC alloc]init];
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}

@end
