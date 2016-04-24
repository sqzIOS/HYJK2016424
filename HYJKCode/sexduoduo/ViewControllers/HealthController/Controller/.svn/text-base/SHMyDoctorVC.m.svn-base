//
//  SHMyDoctorVC.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHMyDoctorVC.h"
#import "SHMyDoctorTableView.h"
#import "SHMydoctorModel.h"
#import "MBHud.h"
#import "MyCLController.h"

@interface SHMyDoctorVC () <UIScrollViewDelegate>
//scrollView 背景展示
@property (nonatomic,strong) UIScrollView *scrollView;
//slide 滑动
@property (strong,nonatomic) UIImageView *slideImageView;
//医师列表
@property (strong,nonatomic) SHMyDoctorTableView *doctorTableView;
//服务历史
@property (strong,nonatomic) SHMyDoctorTableView *historyTableView;
//医师列表 Model
@property (strong,nonatomic) SHMydoctorModel *docModel;
//
@property (strong,nonatomic) NSMutableArray *docData;
//服务历史
@property (strong,nonatomic) SHHistoryModel *hisModel;
@property (strong,nonatomic) NSMutableArray *hisData;
@end

@implementation SHMyDoctorVC

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
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,self.view.frame.size.width, 64)];
    [self.view addSubview:navView];
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"个人中心";
    [navView addSubview:titleImgV];
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_left) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
    
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame= CGRectMake(navView.frame.size.width-50, 30, 25, 25);
    [rightBtn setImage:[UIImage imageNamed:@"massage_undefined"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(bt_action_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:rightBtn];
    
    
}
- (void)initView
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 64, SCREEN_WIDTH/2 - 0.5, APP_SPACE(35));
    leftBtn.backgroundColor = colorWithClear;
    
    leftBtn.tag = 1000;
    [leftBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    //
    UILabel *leftLalbel = [[UILabel alloc]init];
    leftLalbel.backgroundColor = colorWithClear;
    leftLalbel.textColor = colorWith01;
    leftLalbel.text = NSLocalizedString(@"医师列表", nil);
    leftLalbel.font = Font_Large;
    CGSize size = [LYGlobalDefine getTextContent:leftLalbel.text withFont:leftLalbel.font];
    leftLalbel.frame = CGRectMake( (leftBtn.width - size.width)/2, (leftBtn.height - size.height)/2, size.width, size.height);
    [leftBtn addSubview:leftLalbel];
    //分割线
    UIImageView *lineImageView = [UIImageView imageViewLineWithX:SCREEN_WIDTH/2 - 0.5 withY:APP_SPACE(66) withWidth:1 withHeight:APP_SPACE(31)];
    [self.view addSubview:lineImageView];
    //
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(SCREEN_WIDTH/2 + 0.5, 64, SCREEN_WIDTH/2 - 0.5, APP_SPACE(35));
    rightBtn.backgroundColor =colorWithClear;
    rightBtn.tag = 1001;
    [rightBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];
    //
    UILabel *rightLalbel = [[UILabel alloc]init];
    rightLalbel.backgroundColor = colorWithClear;
    rightLalbel.textColor = colorWith01;
    rightLalbel.text = NSLocalizedString(@"服务历史", nil);
    rightLalbel.font = Font_Large;
    size = [LYGlobalDefine getTextContent:rightLalbel.text withFont:rightLalbel.font];
    rightLalbel.frame = CGRectMake((rightBtn.width - size.width)/2, (rightBtn.height - size.height)/2, size.width, size.height);
    [rightBtn addSubview:rightLalbel];
    //分割线
    lineImageView = [UIImageView imageViewLineWithX:0 withY:APP_SPACE(99) withWidth:SCREEN_WIDTH withHeight:1];
    [self.view addSubview:lineImageView];
    //slide
    _slideImageView = [[UIImageView alloc]init];
    _slideImageView.backgroundColor = colorWith01;
    _slideImageView.frame = CGRectMake(0, APP_SPACE(99), SCREEN_WIDTH/2, 1);
    [self.view addSubview:_slideImageView];
    //UIScrollView
    //NSInteger height = SCREEN_HEIGHT;
   // NSInteger statusH = APP_STATUS;
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _slideImageView.bottom, SCREEN_WIDTH, self.view.frame.size.height-_slideImageView.bottom)];
    _scrollView.backgroundColor = colorWithClear;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, 0);
    //UITableView
    _doctorTableView = [[SHMyDoctorTableView alloc]initWithTableViewWithFrame:CGRectMake(0, 0, _scrollView.width, _scrollView.height) withVC:self withType:1];
    _doctorTableView.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:_doctorTableView];
    //
    _historyTableView = [[SHMyDoctorTableView alloc]initWithTableViewWithFrame:CGRectMake(SCREEN_WIDTH, 0, _scrollView.width, _scrollView.height) withVC:self withType:2];
    _historyTableView.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:_historyTableView];
    
    //分割线
    //特约VIP服务  按钮
    UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, _scrollView.frame.size.height-45, _scrollView.frame.size.width, 1)];
    imageV.backgroundColor=colorWith05;
    [_scrollView addSubview:imageV];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(self.view.frame.size.width, _scrollView.frame.size.height-44, _scrollView.frame.size.width, 44);
    [button setTitle:@"特约VIP服务" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:92/255.0f green:214/255.0f blue:186/255.0f alpha:1] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(bt_action__VIP) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:button];
}

#pragma mark ---Data
- (void)initData
{
    if (_docData == nil) {
        _docData = [[NSMutableArray alloc]init];
    }
    _docModel = [SHMydoctorModel loadLocalDataForDoctorModel];
    if (_docModel && _docModel.datasource && _docModel.datasource.count > 0) {
        [self handleRemoteDataForDoctor:_docModel];
    }
    //    if (!_docModel.hadload) {
    //        [self requestRemoteData:_docModel type:0];
    //    }
    
    [self requestData];
    
    if (_hisData == nil) {
        _hisData = [[NSMutableArray alloc]init];
    }
    _hisModel = [SHHistoryModel loadLocalDataForHistoryModel];
    if (_hisModel && _hisModel.datasource && _hisModel.datasource.count > 0) {
        [self handleRemoteDataForHistory:_hisModel];
    }
    //    if (!_docModel.hadload) {
    //        [self requestRemoteData:_docModel type:0];
    //    }
    
    

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
//        NSLog(@"附近医师%@---》附近医师",dic);
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
            
            self.doctorTableView.docData=docArray;
        }
        
        
        
        [MBHud removeFromView:self.view];
    } fail:^{
        [MBHud removeFromView:self.view];
    }];
    
    
    
    //========服务历史
    [AFHTTPClient postJSONPath:SHINTERFACE_getQuestionList httpHost:sexHealthIP parameters:nil success:^(id responseObject) {
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        NSLog(@"服务历史%@---》服务历史",dic);
        if (dic[@"success"] && [dic[@"success"] intValue ]==1)
        {
//            NSArray *array=dic[@"datasource"];
//            NSMutableArray *docArray=[[NSMutableArray alloc] init];
//            for (int i=0; i<array.count; i++) {
//                SHMydoctorInfo *info = [[SHMydoctorInfo alloc]init];
//                
//                info.nearbyArea = [NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"area"]];
//                info.nearbyDistance =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"distance"]];
//                info.nearbyDoctorId =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"doctorId"]];
//                info.nearbyDoctorPostl =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"doctorPost"]];
//                info.nearbyHeadimgurl =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"headimgurl"]];
//                info.nearbyIntroduce =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"introduce"]];
//                info.nearbyName =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"name"]];
//                info.nearbyPopularity =[NSString stringWithFormat:@"%@",dic[@"datasource"][i][@"popularity"]];
//                [docArray addObject:info];
//            }
//            
//            self.doctorTableView.docData=docArray;
        }
        
        
        
        [MBHud removeFromView:self.view];
    } fail:^{
        [MBHud removeFromView:self.view];
    }];
    
    
    
    
    
    
}

#pragma mark ---数据处理
-(void)handleRemoteDataForDoctor:(SHMydoctorModel*)model
{
    [_docData removeAllObjects];
    [_docData addObjectsFromArray:model.datasource];
    self.doctorTableView.docData = _docData;
}

/**
 远程读取数据
 type:0表示正常请求,1表示下拉,2表示上拉
 **/
-(void)requestRemoteDataForDoctor:(SHMydoctorModel*)reqModel type:(NSUInteger)type
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
            [self handleRemoteDataForDoctor:model];
        }
        if (type == 0) {
            [MBHud removeFromView:self.view];
        } else if (type == 1) {
            
        } else if (type == 2) {
           
        }
    }];
}
//
-(void)handleRemoteDataForHistory:(SHHistoryModel*)model
{
    [_hisData removeAllObjects];
    [_hisData addObjectsFromArray:model.datasource];
    self.historyTableView.hisData = _hisData;
}

/**
 远程读取数据
 type:0表示正常请求,1表示下拉,2表示上拉
 **/
-(void)requestRemoteDataForHistory:(SHHistoryModel*)reqModel type:(NSUInteger)type
{
    if (type == 0) {
        [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    }
    BOOL flag = NO;
    if (type == 0 || type == 1) {
        flag = YES;
    }
    [SHHistoryModel loadRemoteDataForHistoryModel:reqModel flag:flag cb:^(BOOL isOK, SHHistoryModel *model) {
        if (isOK) {
            [self handleRemoteDataForHistory:model];
        }
        if (type == 0) {
            [MBHud removeFromView:self.view];
        } else if (type == 1) {
            
        } else if (type == 2) {
            
        }
    }];
}

#pragma  mark ---action 事件
- (void)bt_action_left
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bt_action_right
{
    
}
- (void)bt_action_event:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        [UIView animateWithDuration:0.2 animations:^{
             _slideImageView.left = 0;
             _scrollView.contentOffset = CGPointMake(0, 0);
        }];
    } else if(index == 1001) {
        [UIView animateWithDuration:0.2 animations:^{
            _slideImageView.left = SCREEN_WIDTH/2;
            _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        }];
    }
}
- (void)bt_action__VIP
{
    //跳转到vip服务界面
}

#pragma mark ---UIScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/SCREEN_WIDTH;
    [UIView animateWithDuration:0.2 animations:^{
        _slideImageView.left = SCREEN_WIDTH/2 * index;
    }];
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
    SHMyDoctorVC* vc = [[SHMyDoctorVC alloc]init];
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}
@end
