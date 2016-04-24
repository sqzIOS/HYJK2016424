//
//  SHDoctorDetailVC.m
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHDoctorDetailVC.h"
#import "SHDoctorDetailHeaderView.h"
#import "SHDoctorCommentModel.h"
#import "SHDoctorDetailCell.h"
#import "MBHud.h"
#import "SHVIPVC.h"
#import "SHBuyServeVC.h"
#import "SHBuyDoctorPhoneSeverVC.h"

@interface SHDoctorDetailVC ()
//
@property (nonatomic,strong) SHDoctorDetailHeaderView *headerView;
//
@property (nonatomic,strong) SHDoctorCommentModel *commentModel;

@property (nonatomic,strong) NSMutableArray *tvData;


@end

@implementation SHDoctorDetailVC
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
    
    [self initData];

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
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
    
    
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"医师详情";
    [navView addSubview:titleImgV];
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
}
- (void)initView
{
    
    //
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.top = 44;
    //
    CGFloat height = [SHDoctorDetailHeaderView getDoctorDetailHeaderViewHeightWithModel:self.model];
    _headerView = [[SHDoctorDetailHeaderView alloc]init];
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    
    self.tableView.tableHeaderView = _headerView;
    [_headerView refreshDataWithModel:_model];

    //分割线(横线)
    //咨询按钮视图
    UIImageView *image1=[[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-45, SCREEN_WIDTH, 1)];
    image1.backgroundColor=colorWith01;
    [self.view addSubview:image1];
    
    UIView *bottomView=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-44, SCREEN_WIDTH, 44)];
    bottomView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    //左按钮
    UIButton* leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 0, bottomView.frame.size.width/2-0.5, bottomView.frame.size.height);
    [leftBtn setTitle:@"图文咨询40元/每次" forState:UIControlStateNormal];
    [leftBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [leftBtn setTitleColor:colorWith01 forState:UIControlStateNormal];
    leftBtn.tag=2001;
    leftBtn.backgroundColor=[UIColor whiteColor];
    [leftBtn addTarget:self action:@selector(app_consult_click:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:leftBtn];
    //竖分割线
    UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectMake(bottomView.frame.size.width/2-0.5, 3, 1, bottomView.frame.size.height-6)];
    image2.backgroundColor=colorWith01;
    [bottomView addSubview:image2];
    //右按钮
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame=CGRectMake(bottomView.frame.size.width/2+0.5, 1, bottomView.frame.size.width/2-0.5, bottomView.frame.size.height);
    rightBtn.backgroundColor=[UIColor whiteColor];
    [rightBtn setTitle:@"电话咨询10元/分钟" forState:(UIControlStateNormal)];
    [rightBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [rightBtn setTitleColor:colorWith01 forState:UIControlStateNormal];
    rightBtn.tag=2002;
    [rightBtn addTarget:self action:@selector(app_consult_click:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:rightBtn];
    
}

#pragma  mark ---data
- (void)initData
{
    if (_tvData == nil) {
        _tvData = [[NSMutableArray alloc]init];
    }
    _commentModel = [SHDoctorCommentModel loadLocalDataForDoctorCommentModel];
    if (_commentModel && _commentModel.datasource && _commentModel.datasource.count > 0) {
        [self handleRemoteDataForComment:_commentModel];
    }
    //    if (!_docModel.hadload) {
    //        [self requestRemoteData:_docModel type:0];
    //    }
    [self requestFirstData];
}
#pragma mark 网络请求
-(void)requestFirstData
{
    [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    
    NSDictionary *dic=@{@"doctorId":self.doctorIdStr};
    
    [AFHTTPClient postJSONPath:SHINTERFACE_getDoctorDetail httpHost:sexHealthIP parameters:dic success:^(id responseObject)
     {
         
         
         NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
         NSLog(@"医师详情——————%@-------医师详情第二界面",dic);
         self.listArray = [[NSMutableArray alloc] init];
         
         NSDictionary *dasourceDic = dic[@"datasource"];
         if (dic[@"success"] && [dic[@"success"] intValue]==1)
         {
             
             
             SHMydoctorInfo *info=[[SHMydoctorInfo alloc]init];
             info.area = [NSString stringWithFormat:@"%@", dasourceDic[@"area"]];
             info.doctorId = dasourceDic[@"doctorId"];
             info.doctorName = dasourceDic[@"doctorName"];
             info.goodat = dasourceDic[@"goodat"];
             info.headimgurl = dasourceDic[@"headimgurl"];
             info.hopital = dasourceDic[@"hopital"];
             info.hopitalId = dasourceDic[@"hopitalId"];
             info.introduce = dasourceDic[@"introduce"];
             info.isCertification = dasourceDic[@"isCertification"];
             info.lat = dasourceDic[@"lat"];
             info.lng = dasourceDic[@"lng"];
             info.popularity = dasourceDic[@"popularity"];
             info.position = dasourceDic[@"position"];
             
             CGFloat height =[self.headerView refreshDataWithModel:info];
             
             self.headerView.height =height;
             
             self.tableView.tableHeaderView = _headerView;

             
             
             [MBHud removeFromView:self.view];
             
             
         }
     }                  fail:^{
         [MBHud removeFromView:self.view];
     }];
}
#pragma mark ---数据处理
-(void)handleRemoteDataForComment:(SHDoctorCommentModel*)model
{
    [_tvData removeAllObjects];
    [_tvData addObjectsFromArray:model.datasource];
    [self.tableView reloadData];
}

/**
 远程读取数据
 type:0表示正常请求,1表示下拉,2表示上拉
 **/
-(void)requestRemoteDataForComment:(SHDoctorCommentModel*)reqModel type:(NSUInteger)type
{
    if (type == 0) {
        [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    }
    BOOL flag = NO;
    if (type == 0 || type == 1) {
        flag = YES;
    }
    [SHDoctorCommentModel loadRemoteDataForDoctorCommentModel:reqModel flag:flag cb:^(BOOL isOK, SHDoctorCommentModel *model) {
        if (isOK) {
            [self handleRemoteDataForComment:model];
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

- (void)app_consult_click:(UIButton *)sender
{
    if (sender.tag==2001)
    {
        //图文咨询 40元/次
        SHVIPVC *vc=[[SHVIPVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (sender.tag==2002)
    {
        //电话咨询 10元/分钟
        [SHBuyDoctorPhoneSeverVC gotoMySelf:self];
        
    }
}

#pragma mark ---TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tvData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showUserInfoCellIdentifier = @"SHDoctorDetailCell";
    SHDoctorDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell) {
        cell = [[SHDoctorDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
    }
    SHDoctorCommentInfo *info = _tvData[indexPath.row];
    [SHDoctorDetailCell doctorDetailCell:cell withModel:info];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHDoctorCommentInfo *info = _tvData[indexPath.row];
    return [SHDoctorDetailCell doctorDetailCellHeightWithModel:info];
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, APP_SPACE(40));
    headerView.backgroundColor = colorWith05;
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = colorWith03;
    label.font = Font_SuperLarge_bold;
    label.text = NSLocalizedString(@"用户评价", nil);
    CGSize size = [LYGlobalDefine getTextContent:label.text withFont:label.font];
    label.frame = CGRectMake(APP_SPACE(20), (headerView.height - size.height)/2, size.width, size.height);
    [headerView addSubview:label];
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return APP_SPACE(40);
}

#pragma  mark ---didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc withModel:(NSString*)idStr
{
    if (pvc == nil || idStr == nil) {
        return;
    }
    
    SHDoctorDetailVC* vc = [[SHDoctorDetailVC alloc]init];
    //    vc.model = model;
    vc.doctorIdStr = idStr;
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}


@end
