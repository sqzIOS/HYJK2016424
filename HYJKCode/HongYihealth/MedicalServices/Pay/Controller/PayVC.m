//
//  PayVC.m
//  
//
//  Created by 刘朝涛 on 16/1/4.
//
//  功能：支付

#import "PayVC.h"
#import "UserOperation.h"
#import <AlipaySDK/AlipaySDK.h>


@interface PayVC ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) PayHeadView *headView;

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIView *bgView2;

@property (nonatomic, strong) UIView *bgImageView;

//@property (nonatomic, strong) UILabel *lab;

@end

@implementation PayVC

- (instancetype)initWithType:(PayHeadViewType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTopUpiew];
    
    [self initView];
    
    [self initData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(paySuccess) name:NOTIFICATION_PAY_SUCCESS object:nil];
}
/**
 *  设置导航栏
 */
- (void)setTopUpiew {
    
    self.titleStr = @"支付";
    self.isNeedBack = YES;
}

- (void)initData {
    
}

- (void)initView {
    [self.view addSubview:self.tableView];
    [self.navigationController.view addSubview:self.bgView];
}

- (void)paySuccess {
    Method0fPaymentVC *vc = [[Method0fPaymentVC alloc] initwithType:self.type];
    vc.orderID = _orderModel.oderID;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --- 网络请求
//提交订单
- (void)requestData {
    [UserOperation getSession:^(NSDictionary *session) {
        [MBHud showInView:self.view withTitle:@"请稍等..."];
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"pay_id":[NSString stringWithFormat:@"%@", _orderModel.pay_id],
                                  @"shipping_id":[NSString stringWithFormat:@"%@",_orderModel.shipping_id],
                                  @"yuyue_time":[NSString stringWithFormat:@"%@",_orderModel.yuyue_time]
                                  };
        [AFHTTPClient postJSONPath:HONGYI_flow_done httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dict[@"status"][@"succeed"] intValue] == 1) {
                _orderModel.oderID = [NSString stringWithFormat:@"%@",dict[@"data"][@"order_id"]];
                [_headView changeBtnBg:YES];
            }
            else
            {
                [ShareFunction showAlertWithText:dict[@"status"][@"error_desc"]];
            }
            [MBHud removeFromView:self.view];
        } fail:^{
            [MBHud removeFromView:self.view];
        }];
    }];
}
/**
 *  支付宝支付
 */
- (void)requestDataOrderPayWithAlipay {
//    
//        Method0fPaymentVC *vc = [[Method0fPaymentVC alloc] initwithType:self.type];
//        vc.orderID = _orderModel.oderID;
//        [self.navigationController pushViewController:vc animated:YES];
//        return;
    
    [UserOperation getSession:^(NSDictionary *session) {
        [MBHud showInView:self.view withTitle:@"请稍等..."];
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"order_id":[NSString stringWithFormat:@"%@", _orderModel.oderID]
                                  //                                  @"order_id":@"176"
                                  };
        [AFHTTPClient postJSONPath:HONGYI_order_pay httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dict[@"status"][@"succeed"] intValue] == 1) {
                
                appType = ALIXPAY_RET;
                
                NSDictionary *dic = [dict objectForKey:@"data"][@"pay_online"];
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
                //                orderString = [NSString stringWithFormat:@"%@&return_url=%@",orderString,dic[@"return_url"]];
                
                //                partner="2088101568358171"&seller_id="xxx@alipay.com"&out_trade_no="0819145412-6177"&subject="测试"&body="测试测试"&total_fee="0.01"&notify_url="http://notify.msp.hk/notify.htm"&service="mobile.securitypay.pay"&payment_type="1"&_input_charset="utf-8"&it_b_pay="30m"&sign="lBBK%2F0w5LOajrMrji7DUgEqNjIhQbidR13GovA5r3TgIbNqv231yC1NksLdw%2Ba3JnfHXoXuet6XNNHtn7VE%2BeCoRO1O%2BR1KugLrQEZMtG5jmJIe2pbjm%2F3kb%2FuGkpG%2BwYQYI51%2BhA3YBbvZHVQBYveBqK%2Bh8mUyb7GM1HxWs9k4%3D"&sign_type="RSA"
                
                [[AlipaySDK defaultService] payOrder:orderString fromScheme:AlipayAppScheme callback:^(NSDictionary *resultDic) {
                    
                    NSLog(@"支付宝 支付返回参数 =%@",resultDic);
                    [MBHud removeFromView:self.view];
                    //
                    if (resultDic[@"resultStatus"]  && [resultDic[@"resultStatus"] integerValue]==9000) {
                        
                        [ShareFunction showToast:@"支付成功" inSuperview:self.view];
                        
                        Method0fPaymentVC *vc = [[Method0fPaymentVC alloc] initwithType:self.type];
                        vc.orderID = _orderModel.oderID;
                        [self.navigationController pushViewController:vc animated:YES];
                        
                    }else{
                        [ShareFunction showToast:@"支付失败" inSuperview:self.view];
                    }
                }];
            }
            [MBHud removeFromView:self.view];
        } fail:^{
            [MBHud removeFromView:self.view];
        }];
    }];
}
/**
 *  微信支付
 */
- (void)requestDataOrderPayWeixin {
    [UserOperation getSession:^(NSDictionary *session) {
        [MBHud showInView:self.view withTitle:@"请稍等..."];
        NSDictionary *tempDic = @{
                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
                                  @"order_id":[NSString stringWithFormat:@"%@", _orderModel.oderID]
                                  //                                  @"order_id":@"176"
                                  };
        [AFHTTPClient postJSONPath:HONGYI_order_pay httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
            
            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
            if ([dict[@"status"][@"succeed"] intValue] == 1) {
                
                appType = WEXin_AliPay;
                
                NSDictionary *dic = [dict objectForKey:@"data"][@"pay_online"];
                NSMutableString *stamp  = [dic objectForKey:@"time"];
                //调起微信支付
                PayReq* req             = [[PayReq alloc] init];
                req.openID              = [dic objectForKey:@"appid"];
                req.partnerId           = [dic objectForKey:@"mch_id"];
                req.prepayId            = [dic objectForKey:@"prepay_id"];
                req.nonceStr            = [dic objectForKey:@"nonce_str"];
                req.timeStamp           = stamp.intValue;
//                req.package             = dic[@"trade_type"];
                req.package             = @"Sign=WXPay";

                req.sign                = [dic objectForKey:@"sign"];
                
                
                BOOL isOK = [WXApi sendReq:req];
                NSLog(@"%d",isOK);
            }
            [MBHud removeFromView:self.view];
        } fail:^{
            [MBHud removeFromView:self.view];
        }];
    }];
}

#pragma mark --- btn action
- (void)tapAction {
    _bgView.hidden = YES;
}

- (void)btnAction{
    _bgView.hidden = YES;
}

- (void)ctBtnAction:(CTBtn *)sender {
    _bgView.hidden = YES;
    switch (sender.tag) {
        case 1000:
        {
            NSDictionary *dict = _paymentArr[0];
            _orderModel.pay_id = dict[@"pay_id"];
            [_headView.payBtn setTitle:@"支付宝支付" forState:UIControlStateNormal];
            CGSize size = [NSString getTextMultilineContent:_headView.payBtn.titleLabel.text withFont:_headView.payBtn.titleLabel.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
            _headView.payBtn.left = SCREEN_WIDTH - size.width - MAKEOF5(12);
            _headView.payBtn.width = size.width;
            [self requestData];
        }
            break;
        case 1001:
        {
            NSDictionary *dict = _paymentArr[1];
            _orderModel.pay_id = dict[@"pay_id"];
            [_headView.payBtn setTitle:@"微信支付" forState:UIControlStateNormal];
            CGSize size = [NSString getTextMultilineContent:_headView.payBtn.titleLabel.text withFont:_headView.payBtn.titleLabel.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
            _headView.payBtn.left = SCREEN_WIDTH - size.width - MAKEOF5(12);
            _headView.payBtn.width = size.width;
            [self requestData];
        }
            break;
        case 1002:
        {
            UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"暂未开通该服务" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alter show];
        }
            break;
        default:
            break;
    }
}

#pragma mark --- get

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT - STAR_Y) style:UITableViewStylePlain];
        _tableView.backgroundColor = colorWith05;
        _tableView.tableHeaderView = self.headView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (PayHeadView *)headView {
    if (_headView == nil) {
        _headView = [[PayHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) Controller:self Type:self.type Model:_orderModel];
        __weak typeof(self)weakSelf = self;
        _headView.headBlock = ^(){
            weakSelf.bgView.hidden = NO;
        };
        
        _headView.submitBlock = ^() {
            if ([weakSelf.orderModel.pay_id intValue] == 1) {
                [weakSelf requestDataOrderPayWithAlipay];
            } else if ([weakSelf.orderModel.pay_id intValue] == 6) {
                [weakSelf requestDataOrderPayWeixin];
            }
        };
    }
    return _headView;
}

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bgView.backgroundColor = colorWithClear;
        _bgView.hidden = YES;
        
        [_bgView addSubview:self.bgView2];
        
        [_bgView addSubview:self.bgImageView];
    }
    return _bgView;
}

- (UIView *)bgView2 {
    if (_bgView2 == nil) {
        _bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bgView2.backgroundColor = BLACK_COLOR;
        _bgView2.alpha = 0.4f;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [_bgView2 addGestureRecognizer:tap];
    }
    return _bgView2;
}

- (UIView *)bgImageView {
    if (_bgImageView == nil) {
        _bgImageView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2. - MAKEOF5(217)/2., MAKEOF5(152), MAKEOF5(217), MAKEOF5(130.5))];
        _bgImageView.backgroundColor = WHITE_COLOR;
        _bgImageView.layer.cornerRadius = 5;
        _bgImageView.layer.masksToBounds = YES;
        _bgImageView.userInteractionEnabled = YES;
        
        UILabel *lab = [[UILabel alloc] init];
        lab.text = @"选择支付方式";
        lab.textAlignment = NSTextAlignmentCenter;
        lab.textColor = WHITE_COLOR;
        lab.backgroundColor = RGBCOLOR(71, 197, 116);
        lab.font = FONT_WITH_SIZE(MAKEOF5(12));
        //        CGSize size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        //        lab.frame = CGRectMake(_bgImageView.width/2. - size.width/2., MAKEOF5(13), size.width, size.height);
        lab.frame = CGRectMake(0, 0, _bgImageView.width, MAKEOF5(40));
        [_bgImageView addSubview:lab];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(MAKEOF5(12), 0, MAKEOF5(13.5), MAKEOF5(13));
        [btn setImage:[UIImage imageNamed:@"goBack"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        [_bgImageView addSubview:btn];
        btn.centerY = lab.centerY;
        
        CTBtn *btn1 = [[CTBtn alloc] init];
        btn1.frame = CGRectMake(0, lab.bottom, _bgImageView.width, MAKEOF5(45));
        btn1.btnIcon.frame = CGRectMake(MAKEOF5(20), btn1.height/2. - MAKEOF5(21.5)/2., MAKEOF5(21), MAKEOF5(21.5));
        btn1.btnIcon.image = [UIImage imageNamed:@"zhifubao_pay"];
        btn1.btnTitle.text = @"支付宝支付";
        btn1.btnTitle.font = FONT_WITH_SIZE(MAKEOF5(12));
        CGSize size = [NSString getTextMultilineContent:btn1.btnTitle.text withFont:btn1.btnTitle.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        btn1.btnTitle.frame = CGRectMake(btn1.btnIcon.right + MAKEOF5(12), btn1.height/2. - size.height/2., size.width, size.height);
        [btn1 addTarget:self action:@selector(ctBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn1.tag = 1000;
        [_bgImageView addSubview:btn1];

        CTBtn *btn2 = [[CTBtn alloc] init];
        btn2.frame = CGRectMake(0, btn1.bottom + MAKEOF5(0.5), _bgImageView.width, MAKEOF5(45));
        btn2.btnIcon.frame =  CGRectMake(MAKEOF5(20), btn2.height/2. - MAKEOF5(19.5)/2., MAKEOF5(22.5), MAKEOF5(19.5));
        btn2.btnIcon.image = [UIImage imageNamed:@"weixin_pay"];
        btn2.btnTitle.text = @"微信支付";
        btn2.btnTitle.font = FONT_WITH_SIZE(MAKEOF5(12));
        size = [NSString getTextMultilineContent:btn2.btnTitle.text withFont:btn2.btnTitle.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        btn2.btnTitle.frame = CGRectMake(btn2.btnIcon.right + MAKEOF5(12), btn2.height/2. - size.height/2., size.width, size.height);
        [btn2 addTarget:self action:@selector(ctBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn2.tag = 1001;
        [_bgImageView addSubview:btn2];
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(MAKEOF5(10), btn1.bottom, btn1.width - MAKEOF5(10), MAKEOF5(0.5))];
        line.backgroundColor = colorWith05;
        [_bgImageView addSubview:line];
        //
        //        CTBtn *btn3 = [[CTBtn alloc] init];
        //        btn3.frame = CGRectMake(0, btn2.bottom, _bgImageView.width, MAKEOF5(45));
        //        btn3.btnIcon.frame = CGRectMake(MAKEOF5(20), btn3.height/2. - MAKEOF5(16.5)/2., MAKEOF5(25.5), MAKEOF5(16.5));
        //        btn3.btnIcon.image = [UIImage imageNamed:@"yinlian_pay"];
        //        btn3.btnTitle.text = @"银联支付";
        //        btn3.btnTitle.font = FONT_WITH_SIZE(MAKEOF5(12));
        //        size = [NSString getTextMultilineContent:btn3.btnTitle.text withFont:btn3.btnTitle.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        //        btn3.btnTitle.frame = CGRectMake(btn3.btnIcon.right + MAKEOF5(12), btn3.height/2. - size.height/2., size.width, size.height);
        //        [btn3 addTarget:self action:@selector(ctBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        //        btn3.tag = 1002;
        //        [_bgImageView addSubview:btn3];
    }
    return _bgImageView;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_PAY_SUCCESS object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
