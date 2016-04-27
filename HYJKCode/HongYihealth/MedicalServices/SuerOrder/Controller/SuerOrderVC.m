//
//  SuerOrderVC.m
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能：订单确认

#import "SuerOrderVC.h"
#import "UserOperation.h"
#import "SettingDetailController.h"
#import "AddressEditController.h"

@interface SuerOrderVC ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *shopArr;  //医师地址

@property (nonatomic, strong) NSMutableArray *paymentArr;   //支付方式

@end

@implementation SuerOrderVC

- (instancetype)initWithType:(PayHeadViewType)type {
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
    
    self.titleStr = @"确认订单";
    self.isNeedBack = YES;
}

- (void)initData {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificatinAction:) name:NOTIFICATION_ADDRESS object:nil];
    
    // 设置了默认地址通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hadSetAddress) name:@"hadSetAddress" object:nil];
    
    //病例
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificatinAction2:) name:NOTIFICATION_BINGLI object:nil];
    
    [self initView];
        
    [self requestData];
}


- (void)hadSetAddress
{
    [self requestData];
}

- (void)initView {
    [self.view addSubview:self.tableView];
}

#pragma mark --- 网络请求
- (void)requestData {
    
    [UserOperation getSession:^(NSDictionary *session) {
        [MBHud showInView:self.view withTitle:@"请稍等..."];
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  };
        [AFHTTPClient postJSONPath:HONGYI_flow_checkOrder httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dict[@"status"][@"succeed"] intValue] == 1) {
                _headView.orderModel.userName = [NSString stringWithFormat:@"%@",dict[@"data"][@"consignee"][@"consignee"]];
                _headView.orderModel.userPhone = [NSString stringWithFormat:@"%@",dict[@"data"][@"consignee"][@"tel"]];
                self.paymentArr = dict[@"data"][@"payment_list"];
                self.shopArr = dict[@"data"][@"shipping_list"];
                
//                _headView.paymentArr = self.paymentArr;
                _headView.shopArr = self.shopArr;
                
                // 判断是否有默认病例
                [UserOperation hasDefaultPatientCase:^(NSString *case_id) {
                    if (case_id) {
                        [_headView changeBingLi:YES];
                    }
                    [MBHud removeFromView:self.view];

                }];

            } else {
                [ShareFunction showToast:dict[@"status"][@"error_desc"]];
                self.view.userInteractionEnabled = NO;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.view.userInteractionEnabled = YES;
                    AddressEditController *controller = [AddressEditController controllerWithAddressID:nil];
                    controller.comeFromeSureOrder = YES;
                    [self.navigationController pushViewController:controller animated:YES];
                });
                [MBHud removeFromView:self.view];
            }
            
        } fail:^{
            
            [MBHud removeFromView:self.view];
            
        }];
    }];
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT - STAR_Y) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = colorWith05;
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}

- (SuerOrderHeadView *)headView {
    if (_headView == nil) {
        _headView = [[SuerOrderHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0) Model:_model Controller:self Type:self.type];
        _headView.delegate = self;
    }
    return _headView;
}

- (NSMutableArray *)shopArr {
    if (_shopArr == nil) {
        _shopArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _shopArr;
}

- (NSMutableArray *)paymentArr {
    if (_paymentArr == nil) {
        _paymentArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _paymentArr;
}

#pragma mark --- delegate

- (void)gotoPayVC:(int)type {

    if (type == 1) {
        PayVC *vc = [[PayVC alloc] init];
        vc.orderModel = _headView.orderModel;
        vc.paymentArr = self.paymentArr;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (type == 2) {
        SettingDetailController *controller = [SettingDetailController settingDetailControllerWithTitle:@"用户协议"];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (void)changeHeight {
    self.tableView.tableHeaderView = self.headView;
}

- (void)notificatinAction:(NSNotification *)notification {
    NSDictionary *dic = notification.userInfo;
    NSString *str = dic[@"hospitalName"];
    NSString *idStr = dic[@"idStr"];
    _model.address = str;
    [_headView changeValueWithAddress:str ID:idStr];
}

- (void)notificatinAction2:(NSNotification *)notification {
    NSDictionary *dic = notification.userInfo;
    BOOL isOK = [dic[@"yitianxie"] boolValue];
    [_headView changeBingLi:isOK];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  移除通知
 */
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_ADDRESS object:nil];
}

@end
