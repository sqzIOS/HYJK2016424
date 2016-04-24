//
//  PayDetailsVC.m
//  
//
//  Created by 刘朝涛 on 16/1/6.
//
//  功能：预约详情

#import "PayDetailsVC.h"
#import "UserOperation.h"
#import "OrderModel.h"
#import <AlipaySDK/AlipaySDK.h>


@interface PayDetailsVC ()<PayDetailsHeadViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) PayDetailsHeadView *headView;

@property (nonatomic, strong) OrderModel *model;

@end

@implementation PayDetailsVC

- (instancetype)initWithType:(PayHeadViewType)type {
    if (self == [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTopUpiew];
    
    [self initData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(paySuccess2) name:NOTIFICATION_PAY_SUCCESS2 object:nil];
}
/**
 *  设置导航栏
 */
- (void)setTopUpiew {
    
    self.titleStr = @"预约详情";
    self.isNeedBack = YES;
}

- (void)initData {
    [self initView];
    
    [self requestData];
}

- (void)initView {
    [self.view addSubview:self.tableView];
}

- (void)paySuccess2 {
    [self requestData];
}
#pragma mark 网络请求

- (void)requestData {
    
    [UserOperation getSession:^(NSDictionary *session) {
        [MBHud showInView:self.view withTitle:@"请稍等..."];
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"order_id":[NSString stringWithFormat:@"%@", _orderID], //@“156”
                                  };
        [AFHTTPClient postJSONPath:HONGYI_order_info httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dict[@"status"][@"succeed"] intValue] == 1) {
                NSDictionary *dic = dict[@"data"];
                NSString *tempStr = [NSString stringWithFormat:@"%@",dic[@"goods_list"][0][@"name"]];
                if (tempStr.length > 0) {
                    _model = [[OrderModel alloc] init];
                    if ([tempStr hasPrefix:@"vip"]) {
                        _model.goodsName = tempStr;
                        _model.doctor_hospital = tempStr;
                    } else {
                        NSRange range = [tempStr rangeOfString:@" "]; //现获取要截取的字符串位置
                        if (range.length != 0) {
                            NSString *str1 = [tempStr substringToIndex:range.location];
                            _model.goodsName = str1;
                            NSString *str2 = [tempStr substringFromIndex:range.location+1];
                            _model.doctor_hospital = str2;
                        } else {
                            _model.goodsName = tempStr;
                            _model.doctor_hospital = tempStr;
                        }
                    }
                }
                
                _model.yuyue_time = [NSString stringWithFormat:@"%@",dic[@"yuyue_time"]];
                _model.order_sn = [NSString stringWithFormat:@"%@",dic[@"order_sn"]];
                _model.order_status_name = [NSString stringWithFormat:@"%@",dic[@"order_status_name"]];
                _model.userName = [NSString stringWithFormat:@"%@",dic[@"shipping_info"][@"consignee"]];
                _model.userPhone = [NSString stringWithFormat:@"%@",dic[@"shipping_info"][@"tel"]];
                
                [_headView refreshHeadView:_model];
                _tableView.tableHeaderView = _headView;
            }
            [MBHud removeFromView:self.view];
        } fail:^{
            [MBHud removeFromView:self.view];
        }];
    }];
}


#pragma mark --- delegate 
- (void)telprompt:(NSString *)phone {
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

/**
 *  去支付
 */
- (void)goPay {

    [UserOperation getSession:^(NSDictionary *session) {
        [MBHud showInView:self.view withTitle:@"请稍等..."];
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"order_id":[NSString stringWithFormat:@"%@", _orderID]
                                  };
        [AFHTTPClient postJSONPath:HONGYI_order_pay httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dict[@"status"][@"succeed"] intValue] == 1) {
                
                NSDictionary *dic = [dict objectForKey:@"data"][@"pay_online"];
                
                if (dic.allKeys.count > 10) {
                    
                    appType = ALIXPAY_RET;
                    
                    NSString *orderString = nil;
                    orderString = [NSString stringWithFormat:@"partner=\"%@\"",dic[@"partner"]];
                    orderString = [NSString stringWithFormat:@"%@&seller_id=\"%@\"",orderString,dic[@"seller_id"]];
                    orderString = [NSString stringWithFormat:@"%@&out_trade_no=\"%@\"",orderString,dic[@"out_trade_no"]];
                    orderString = [NSString stringWithFormat:@"%@&subject=\"%@\"",orderString,dic[@"subject"]];
                    orderString = [NSString stringWithFormat:@"%@&body=\"%@\"",orderString,dic[@"body"]];
                    orderString = [NSString stringWithFormat:@"%@&total_fee=\"%@\"",orderString,dic[@"total_fee"]];
                    orderString = [NSString stringWithFormat:@"%@&notify_url=\"%@\"",orderString,dic[@"notify_url"]];
                    orderString = [NSString stringWithFormat:@"%@&service=\"%@\"",orderString,dic[@"service"]];
                    orderString = [NSString stringWithFormat:@"%@&payment_type=\"%@\"",orderString,dic[@"payment_type"]];
                    orderString = [NSString stringWithFormat:@"%@&_input_charset=\"%@\"",orderString,dic[@"_input_charset"]];
                    orderString = [NSString stringWithFormat:@"%@&it_b_pay=\"%@\"",orderString,dic[@"it_b_pay"]];
                    orderString = [NSString stringWithFormat:@"%@&return_url=\"%@\"",orderString,dic[@"return_url"]];
                    orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"",orderString,dic[@"sign"]];
                    orderString = [NSString stringWithFormat:@"%@&sign_type=\"RSA\"",orderString];
                    
                    [[AlipaySDK defaultService] payOrder:orderString fromScheme:AlipayAppScheme callback:^(NSDictionary *resultDic) {
                        
                        NSLog(@"支付宝 支付返回参数 =%@",resultDic);
                        [MBHud removeFromView:self.view];
                        //
                        if (resultDic[@"resultStatus"]  && [resultDic[@"resultStatus"] integerValue]==9000) {
                            
                            [self requestData];
                            
                        }else{
                            [ShareFunction showToast:@"支付失败" inSuperview:self.view];
                        }
                    }];
                } else {
                    appType = WEXin_AliPay2;
                    
                    NSMutableString *stamp  = [dic objectForKey:@"time"];
                    //调起微信支付
                    PayReq* req             = [[PayReq alloc] init];
                    req.openID              = [dic objectForKey:@"appid"];
                    req.partnerId           = [dic objectForKey:@"mch_id"];
                    req.prepayId            = [dic objectForKey:@"prepay_id"];
                    req.nonceStr            = [dic objectForKey:@"nonce_str"];
                    req.timeStamp           = stamp.intValue;
                    req.package             = @"Sign=WXPay";
                    req.sign                = [dic objectForKey:@"sign"];

                    BOOL isOK = [WXApi sendReq:req];
                    NSLog(@"%zi",isOK);
                }
            }
            [MBHud removeFromView:self.view];
        } fail:^{
            [MBHud removeFromView:self.view];
        }];
    }];
}
/**
 *  确认
 */
- (void)sureOrder {
    [UserOperation getSession:^(NSDictionary *session) {
        [MBHud showInView:self.view withTitle:@"请稍等..."];
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"order_id":[NSString stringWithFormat:@"%@", _orderID]
                                  };
        [AFHTTPClient postJSONPath:HONGYI_order_affirmReceived httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dict[@"status"][@"succeed"] intValue] == 1) {
                [self requestData];
            }
            [MBHud removeFromView:self.view];
        } fail:^{
            [MBHud removeFromView:self.view];
        }];
    }];
}

/**
 *  去评价
 */
- (void)goEvaluation {
    
}
/**
 *  取消订单
 */
- (void)cancel {
    [UserOperation getSession:^(NSDictionary *session) {
        [MBHud showInView:self.view withTitle:@"请稍等..."];
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"order_id":[NSString stringWithFormat:@"%@", _orderID]
                                  };
        [AFHTTPClient postJSONPath:HONGYI_order_cancel httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dict[@"status"][@"succeed"] intValue] == 1) {
                [self requestData];
            } else {
                [ShareFunction showToast:dict[@"status"][@"error_desc"]];
            }
            [MBHud removeFromView:self.view];
        } fail:^{
            [MBHud removeFromView:self.view];
        }];
    }];
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT - STAR_Y) style:UITableViewStylePlain];
        _tableView.backgroundColor = colorWith05;
        _tableView.tableHeaderView = self.headView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

- (PayDetailsHeadView *)headView {
    if (_headView == nil) {
        _headView = [[PayDetailsHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) Type:self.type];
        _headView.delegate = self;
    }
    return _headView;
}

//- (OrderModel *)model {
//    if (_model == nil) {
//        _model = [[OrderModel alloc] init];
//    }
//    return _model;
//}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_PAY_SUCCESS2 object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
