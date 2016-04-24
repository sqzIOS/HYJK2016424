//
//  DoctorDetailsVC.m
//  
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能：医师详情

#import "DoctorDetailsVC.h"
#import "SuerOrderVC.h"
#import "TFHpple.h"
#import "TFHppleElement.h"
#import "UserOperation.h"

@interface DoctorDetailsVC ()<HeadViewDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) DoctorDetailsTableView *tableView;

@property (nonatomic, strong) DoctorDetailsTableViewHeadView *headView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UIButton *selectTaBtn;    //选ta按钮

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, assign) int pageApp;  //分页

@end

@implementation DoctorDetailsVC

- (instancetype)initWithType:(DoctorDetailsVCType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTopUpiew];
    
    [self initData];
}

/**
 *  设置导航栏
 */
- (void)setTopUpiew {
    if (self.type == ForServer) {
        self.titleStr = @"医师详情";
    } else {
        self.titleStr = @"体检详情";
    }
    self.isNeedBack = YES;

    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.frame = CGRectMake(SCREEN_WIDTH - 50, 20,50,44);
    [rightBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:rightBtn];
}

- (void)rightBtnAction {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"微信好友分享" otherButtonTitles:@"微信朋友圈分享", nil];
    [sheet showInView:self.view];
    return;
}

#pragma UIActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        WXMediaMessage *message = [WXMediaMessage message];
        message.title = [NSString stringWithFormat:@"我是%@,在弘医健康等你来预约我!",_model.doctorName];
        message.description = [NSString stringWithFormat:@"我是%@,在弘医健康等你来预约我!",_model.doctorName];
        UIImageView *img = [[UIImageView alloc] init];
        [img sd_setImageWithURL:[NSURL URLWithString:_model.doctoeHead] placeholderImage:DEFAULT_AVATAR];
        [message setThumbImage:img.image];
        
        WXWebpageObject *webpageObject = [WXWebpageObject object];
        webpageObject.webpageUrl = @"www.hyyl.cc";
        message.mediaObject = webpageObject;
        
        SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        req.scene = WXSceneSession; //分享到哪里
        [WXApi sendReq:req];
    }else if (buttonIndex == 1) {
        WXMediaMessage *message = [WXMediaMessage message];
        message.title = [NSString stringWithFormat:@"我是%@,在弘医健康等你来预约我!",_model.doctorName];
        message.description = [NSString stringWithFormat:@"我是%@,在弘医健康等你来预约我!",_model.doctorName];
        UIImageView *img = [[UIImageView alloc] init];
        [img sd_setImageWithURL:[NSURL URLWithString:_model.doctoeHead] placeholderImage:DEFAULT_AVATAR];
        [message setThumbImage:img.image];
        
        WXWebpageObject *webpageObject = [WXWebpageObject object];
        webpageObject.webpageUrl = @"www.hyyl.cc";
        message.mediaObject = webpageObject;
        
        SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        req.scene = WXSceneTimeline; //分享到哪里
        [WXApi sendReq:req];
    }
}

/**
 *  初始化数据
 */
- (void)initData {
//    _model.doctorIntroduce = @"长期从事外科临床医疗、教学、科研和医院管理工作。主持、参与完成省部级获奖科研10余项，在国际、国内专业学术期刊发表论文20余篇，主持编著论著1部。目前承担甘肃省科技重大专项项目和甘肃省自然科学基金项目3项。2005被确定为甘肃省“555”创新人才工程人选， 2009年被确定为甘肃省领军人才工程第一层次人选，2010被确定为享受国务院特殊津贴专家长期从事外科临床医疗、教学、科研和医院管理工作。主持、参与完成省部级获奖科研10余项，在国际、国内专业学术期刊发表论文20余篇，主持编著论著1部。目前承担甘肃省科技重大专项项目和甘肃省自然科学基金项目3项。2005被确定为甘肃省“555”创新人才工程人选， 2009年被确定为甘肃省领军人才工程第一层次人选，2010被确定为享受国务院特殊津贴专家";
    
//    NSArray *arr = @[
//                     @{@"nickName":@"教***", @"time":@"2015-04-09", @"disease":@"食道癌", @"content":@"医者仁心，万分感谢"},
//                     @{@"nickName":@"教***", @"time":@"2015-04-09", @"disease":@"食道癌", @"content":@"医者仁心，万分感谢"},
//                     @{@"nickName":@"教***", @"time":@"2015-04-09", @"disease":@"食道癌", @"content":@"医者仁心，万分感谢"},
//                     @{@"nickName":@"教***", @"time":@"2015-04-09", @"disease":@"食道癌", @"content":@"医者仁心，万分感谢"},
//                     @{@"nickName":@"教***", @"time":@"2015-04-09", @"disease":@"食道癌", @"content":@"医者仁心，万分感谢"}];
//    for (NSDictionary *dic in arr) {
//        UserEvaluateModel *model = [[UserEvaluateModel alloc] initWithDic:dic];
//        [self.dataArr addObject:model];
//    }

    [self initView];
    
    _pageApp = 1;
    
    [self requestDataWithGoods];
    
    [self requestDataWithGoodsDesc];
    
    [self requestDataWithComments];
}
/**
 *  初始化视图
 */
- (void)initView {
    if (_tableView == nil) {
        _tableView = [[DoctorDetailsTableView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT - MAKEOF5(42) - STAR_Y) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.tableHeaderView = self.headView;
        
        [_tableView addHeaderWithTarget:self action:@selector(headRefresh)];
        
        [_tableView addFooterWithTarget:self action:@selector(footRefresh)];
        
        [self.view addSubview:self.selectTaBtn];
    }
    _tableView.dataArr = _dataArr;
    [_tableView reloadData];
}

#pragma mark --- network request
/**
 *  获取医生详情
 */
- (void)requestDataWithGoods {

    [UserOperation getSession:^(NSDictionary *session) {
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"goods_id":[NSString stringWithFormat:@"%@",_model.goods_id]
                                  };
        
        [AFHTTPClient postJSONPath:HONGYI_goods httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
            NSDictionary *dic = dict[@"data"];
            if (dic.count > 0) {
                _model.brand_id = [NSString stringWithFormat:@"%@",dic[@"brand_id"]];
                _model.cat_id = [NSString stringWithFormat:@"%@",dic[@"cat_id"]];
                _model.click_count = [NSString stringWithFormat:@"%@",dic[@"click_count"]];
                _model.collected = [NSString stringWithFormat:@"%@",dic[@"collected"]];
                [_headView changeCollected:_model.collected];
            }
            
        } fail:^{
            
        }];
    }];
}
/**
 *  创建关注请求
 */
- (void)requestWithCollect {
    
    [UserOperation getSession:^(NSDictionary *session) {
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"goods_id":[NSString stringWithFormat:@"%@",_model.goods_id]
                                  };
        [AFHTTPClient postJSONPath:HONGYI_user_collect_create httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dic = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dic[@"status"][@"succeed"] intValue] == 1) {
                _model.collected = @"1";
                [_headView changeCollected:_model.collected];
            }
            
        } fail:^{
            
        }];
    }];
}
/**
 *  取消关注
 */
- (void)requestWithUncollect {
    [UserOperation getSession:^(NSDictionary *session) {
//        sessionDic = session;
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"goods_id":[NSString stringWithFormat:@"%@",_model.goods_id]
                                  };
        [AFHTTPClient postJSONPath:HONGYI_user_collect_delete httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dic = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dic[@"status"][@"succeed"] intValue] == 1) {
                _model.collected = @"0";
                [_headView changeCollected:_model.collected];
            }
            
        } fail:^{
            
        }];
    }];
}

/**
 *  获取医生详情描述
 */
- (void)requestDataWithGoodsDesc {
    
    NSDictionary *tempDic = @{
                              @"goods_id":[NSString stringWithFormat:@"%@",_model.goods_id],
                              @"SESSION":@{@"uid":@"sid"}
                              };
    [AFHTTPClient postJSONPath:HONGYI_goods_desc httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
        
        //可以直接用 responseObject 也可以使用字符串operation.responseString
        NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
        NSString *str = dict[@"data"];
        _model.doctorIntroduce = [NSString stringWithFormat:@"%@",str];
        
        [_headView refreshIntrodueLab:_model.doctorIntroduce];
        
    } fail:^{
        
    }];
    
}

/**
 *  获取医生评价
 */
- (void)requestDataWithComments {
    
    NSDictionary *tempDic = @{
                              @"goods_id":[NSString stringWithFormat:@"%@",_model.goods_id],
                              @"PAGINATION":@{@"page":[NSString stringWithFormat:@"%zi",_pageApp], @"count":@"10"}
                              };
    [AFHTTPClient postJSONPath:HONGYI_comments httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
        
        NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
        NSArray *arr = dict[@"data"];
        
        if (_pageApp == 1) {
            [self.dataArr removeAllObjects];
        }
        if (arr.count > 0) {
            for (NSDictionary *dic in arr) {
                UserEvaluateModel *model = [[UserEvaluateModel alloc] init];
                model.attitude_rank = [NSString stringWithFormat:@"%@",dic[@"attitude_rank"]];
                model.author = [NSString stringWithFormat:@"%@",dic[@"author"]];
                model.content = [NSString stringWithFormat:@"%@",dic[@"content"]];
                model.disease_types = [NSString stringWithFormat:@"%@",dic[@"disease_types"]];
                model.effect_rank = [NSString stringWithFormat:@"%@",dic[@"effect_rank"]];
                model.idStr = [NSString stringWithFormat:@"%@",dic[@"id"]];
                model.rank = [NSString stringWithFormat:@"%@",dic[@"rank"]];
                model.recommend_rank = [NSString stringWithFormat:@"%@",dic[@"recommend_rank"]];
                [self.dataArr addObject:model];
            }
            _tableView.dataArr = [[NSMutableArray alloc] initWithArray:_dataArr];
            [_tableView reloadData];
        }
        [self endRefresh];
    } fail:^{
        [self endRefresh];
    }];
    
}
/**
 *  创建预约
 */
- (void)requestData {
    [UserOperation getSession:^(NSDictionary *session) {
        [MBHud showInView:self.view withTitle:@"请稍等..."];
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"goods_id":[NSString stringWithFormat:@"%@",_model.goods_id],
                                  @"number":@"1"
                                  };
        [AFHTTPClient postJSONPath:HONGYI_cart_create httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dict[@"status"][@"succeed"] intValue] == 1) {
                SuerOrderVC *vc = nil;
                if (self.type == ForServer) {
                    vc = [[SuerOrderVC alloc] initWithType:ForWithServerOrder];
                } else {
                    vc = [[SuerOrderVC alloc] initWithType:ForWithPhysicalOrder];
                }
                vc.model = _model;
                [self.navigationController pushViewController:vc animated:YES];
                _selectTaBtn.enabled = YES;
            }
            [MBHud removeFromView:self.view];
            
        } fail:^{
            [MBHud removeFromView:self.view];
            
        }];
    }];
}


#pragma mark --- get

- (DoctorDetailsTableViewHeadView *)headView {
    if (_headView == nil) {
        _headView = [[DoctorDetailsTableViewHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MAKEOF5(103)) Model:_model Type:self.type];
        _headView.delegate = self;
        __weak typeof(self)weakSelf = self;
        _headView.detailsBlock = ^() {
            if ([weakSelf.model.collected intValue] == 1) {
                [weakSelf requestWithUncollect];
            } else {
                [weakSelf requestWithCollect];
            }
        };
    }
    return _headView;
}

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _dataArr;
}

- (UIButton *)selectTaBtn {
    if (_selectTaBtn == nil) {
        _selectTaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectTaBtn.frame = CGRectMake(0, SCREEN_HEIGHT - MAKEOF5(42), SCREEN_WIDTH, MAKEOF5(42));
        [_selectTaBtn setBackgroundImage:[UIImage imageNamed:@"ta"] forState:UIControlStateNormal];
        [_selectTaBtn addTarget:self action:@selector(selectTaBtnAction) forControlEvents:UIControlEventTouchUpInside];
        if (self.type == ForPhysical) {
            [_selectTaBtn setBackgroundImage:[UIImage imageNamed:@"order_submit_p"] forState:UIControlStateNormal];
        }
    }
    return _selectTaBtn;
}

#pragma mark --- refresh
/**
 *  下拉刷新
 */
-(void)headRefresh
{
    _pageApp = 1;
    [self requestDataWithComments];
}
/**
 *  上拉刷新
 */
-(void)footRefresh
{
    _pageApp += 1;
    if (_dataArr.count % 10 == 0) {
        [self requestDataWithComments];
    }
    [_tableView footerEndRefreshing];
}

- (void)endRefresh {
    [_tableView headerEndRefreshing];
    [_tableView footerEndRefreshing];
}

#pragma mark --- action

- (void)selectTaBtnAction {

    _selectTaBtn.enabled = NO;
    [self requestData];
}

- (void)changeHeight {
   self.tableView.tableHeaderView = self.headView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
