//
//  SHBuyServeVC.m
//  SexHealth
//
//  Created by ly1992 on 15/7/2.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHBuyServeVC.h"
#import "SHHealthButton.h"

#if defined(_ALIPAYSKD_)
#import <AlipaySDK/AlipaySDK.h>
#endif

@interface SHBuyServeVC ()
//
@property (nonatomic,strong) UIView *topView;
//医师 名
@property (nonatomic,strong) UILabel *doctorLabel;
//医师 费用
@property (nonatomic,strong) UILabel *freeLabel;
//选择支付方式
@property (nonatomic,strong) UILabel *selectLabel;
//分割线
@property (nonatomic,strong) UIImageView *lineImageView;
//支付宝方式
@property (nonatomic,strong) SHHealthButton *alipyBtn;
//微信方式
@property (nonatomic,strong) SHHealthButton *weChatBtn;
//银行卡方式
@property (nonatomic,strong) SHHealthButton *bankBtn;
//buy
@property (nonatomic,strong) SHHealthButton *buyBtn;

@end

@implementation SHBuyServeVC
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
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"购买服务";
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
    self.scrollView.backgroundColor = colorWith05;
    if (_topView == nil) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, APP_SPACE(135))];
        _topView.backgroundColor = colorWithLYWhite;
        [self.scrollView addSubview:_topView];
        //
        UIImageView *lineOneImageView = [UIImageView imageViewLineWithX:0 withY:APP_SPACE(10) withWidth:SCREEN_WIDTH withHeight:1];
        [_topView addSubview:lineOneImageView];
        //
        self.doctorLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.doctorLabel.backgroundColor = [UIColor clearColor];
        self.doctorLabel.font = Font_Large;
        self.doctorLabel.textColor = colorWith03;
        [self.topView addSubview:self.doctorLabel];
        //
        self.freeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.freeLabel.backgroundColor = [UIColor clearColor];
        self.freeLabel.font = Font_Large;
        self.freeLabel.textColor = [UIColor redColor];
        [self.topView addSubview:self.freeLabel];
        //
        lineOneImageView = [UIImageView imageViewLineWithX:0 withY:APP_SPACE(60) withWidth:SCREEN_WIDTH withHeight:1];
        [_topView addSubview:lineOneImageView];
        //选择支付发式
        self.selectLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.selectLabel.backgroundColor = [UIColor clearColor];
        self.selectLabel.font = Font_Large;
        self.selectLabel.textColor = colorWith03;
        self.selectLabel.text = NSLocalizedString(@"选择支付方式", nil);
        CGSize size = [LYGlobalDefine getTextContent:self.selectLabel.text withFont:self.selectLabel.font];
        self.selectLabel.frame = CGRectMake(APP_SPACE(10), APP_SPACE(100), size.width, size.height);
        [self.topView addSubview:self.selectLabel];
        //
        lineOneImageView = [UIImageView imageViewLineWithX:0 withY:APP_SPACE(134) withWidth:SCREEN_WIDTH withHeight:1];
        [_topView addSubview:lineOneImageView];
        
        
        
        //支付宝支付
        _alipyBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        _alipyBtn.frame = CGRectMake(0, APP_SPACE(135), SCREEN_WIDTH, APP_SPACE(60));
        _alipyBtn.backgroundColor = colorWithLYWhite;
        [_alipyBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        _alipyBtn.tag = 1000;
        UIImage *image = [UIImage imageNamed:@"health_alipy"];
        _alipyBtn.iconImageView.image = image;
        _alipyBtn.iconImageView.frame = CGRectMake(APP_SPACE(10), (_alipyBtn.height - image.size.height)/2, image.size.width, image.size.height);
        [_alipyBtn addSubview:_alipyBtn.iconImageView];
        _alipyBtn.nameLabel.text = NSLocalizedString(@"支付宝支付", nil);
        _alipyBtn.nameLabel.textColor = colorWith02;
        _alipyBtn.nameLabel.font = Font_Large_bold;
       size = [LYGlobalDefine getTextContent:_alipyBtn.nameLabel.text withFont:_alipyBtn.nameLabel.font];
        _alipyBtn.nameLabel.frame = CGRectMake(_alipyBtn.iconImageView.right + APP_SPACE(10), APP_SPACE(5), size.width, size.height);
        [_alipyBtn addSubview:_alipyBtn.nameLabel];
        _alipyBtn.contentLabel.text = NSLocalizedString(@"推荐安装支付宝客户端的用户使用", nil);
        _alipyBtn.contentLabel.font = Font_Small;
        _alipyBtn.contentLabel.textColor = colorWith03;
        size = [LYGlobalDefine getTextContent:_alipyBtn.contentLabel.text withFont:_alipyBtn.contentLabel.font];
        _alipyBtn.contentLabel.frame = CGRectMake(_alipyBtn.nameLabel.left, _alipyBtn.nameLabel.bottom + APP_SPACE(5), size.width, size.height);
        [_alipyBtn addSubview:_alipyBtn.contentLabel];
        image = [UIImage imageNamed:@"health_hasSelect"];
        _alipyBtn.rightIconImageView.image = image;
        _alipyBtn.rightIconImageView.hidden = YES;
        _alipyBtn.rightIconImageView.frame = CGRectMake(SCREEN_WIDTH -image.size.width - APP_SPACE(10), (_alipyBtn.height - image.size.height)/2, image.size.width, image.size.height);
        [_alipyBtn addSubview:_alipyBtn.rightIconImageView];
        [self.scrollView addSubview:_alipyBtn];
        
        //微信支付
        _weChatBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        _weChatBtn.frame = CGRectMake(0, APP_SPACE(210), SCREEN_WIDTH, APP_SPACE(60));
        _weChatBtn.backgroundColor = colorWithLYWhite;
        [_weChatBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        _weChatBtn.tag = 1001;
        image = [UIImage imageNamed:@"health_wechat"];
        _weChatBtn.iconImageView.image = image;
        _weChatBtn.iconImageView.frame = CGRectMake(APP_SPACE(10), (_weChatBtn.height - image.size.height)/2, image.size.width, image.size.height);
        [_weChatBtn addSubview:_weChatBtn.iconImageView];
        _weChatBtn.nameLabel.text = NSLocalizedString(@"微信支付", nil);
        _weChatBtn.nameLabel.font = Font_Large_bold;
        _weChatBtn.nameLabel.textColor = colorWith02;
        size = [LYGlobalDefine getTextContent:_alipyBtn.nameLabel.text withFont:_alipyBtn.nameLabel.font];
        _weChatBtn.nameLabel.frame = CGRectMake(_alipyBtn.iconImageView.right + APP_SPACE(10), APP_SPACE(5), size.width, size.height);
        [_weChatBtn addSubview:_weChatBtn.nameLabel];
        _weChatBtn.contentLabel.text = NSLocalizedString(@"推荐安装支付宝客户端的用户使用", nil);
        _weChatBtn.contentLabel.font = Font_Small;
        _weChatBtn.contentLabel.textColor = colorWith03;
        size = [LYGlobalDefine getTextContent:_alipyBtn.contentLabel.text withFont:_weChatBtn.contentLabel.font];
        _weChatBtn.contentLabel.frame = CGRectMake(_weChatBtn.nameLabel.left, _weChatBtn.nameLabel.bottom + APP_SPACE(5), size.width, size.height);
        [_weChatBtn addSubview:_weChatBtn.contentLabel];
        image = [UIImage imageNamed:@"health_hasSelect"];
        _weChatBtn.rightIconImageView.image = image;
        _weChatBtn.rightIconImageView.hidden = YES;
        _weChatBtn.rightIconImageView.frame = CGRectMake(SCREEN_WIDTH -image.size.width - APP_SPACE(10), (_weChatBtn.height - image.size.height)/2, image.size.width, image.size.height);
        [_weChatBtn addSubview:_weChatBtn.rightIconImageView];
        [self.scrollView addSubview:_weChatBtn];
        
        //银行卡支付
        _bankBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        _bankBtn.frame = CGRectMake(0, APP_SPACE(285), SCREEN_WIDTH, APP_SPACE(60));
        _bankBtn.backgroundColor = colorWithLYWhite;
        [_bankBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        _bankBtn.tag = 1002;
        image = [UIImage imageNamed:@"health_bank"];
        _bankBtn.iconImageView.image = image;
        _bankBtn.iconImageView.frame = CGRectMake(APP_SPACE(10), (_bankBtn.height - image.size.height)/2, image.size.width, image.size.height);
        [_bankBtn addSubview:_bankBtn.iconImageView];
        _bankBtn.nameLabel.text = NSLocalizedString(@"银行卡支付", nil);
        _bankBtn.nameLabel.font = Font_Large_bold;
        _bankBtn.nameLabel.textColor = colorWith02;
        size = [LYGlobalDefine getTextContent:_alipyBtn.nameLabel.text withFont:_alipyBtn.nameLabel.font];
        _bankBtn.nameLabel.frame = CGRectMake(_alipyBtn.iconImageView.right + APP_SPACE(10), APP_SPACE(5), size.width, size.height);
        [_bankBtn addSubview:_bankBtn.nameLabel];
        _bankBtn.contentLabel.text = NSLocalizedString(@"推荐信用卡持卡人使用", nil);
        _bankBtn.contentLabel.font = Font_Small;
        _bankBtn.contentLabel.textColor = colorWith03;
        size = [LYGlobalDefine getTextContent:_alipyBtn.contentLabel.text withFont:_bankBtn.contentLabel.font];
        _bankBtn.contentLabel.frame = CGRectMake(_bankBtn.nameLabel.left, _bankBtn.nameLabel.bottom + APP_SPACE(5), size.width, size.height);
        [_bankBtn addSubview:_bankBtn.contentLabel];
        image = [UIImage imageNamed:@"health_hasSelect"];
        _bankBtn.rightIconImageView.image = image;
        _bankBtn.rightIconImageView.hidden = YES;
        _bankBtn.rightIconImageView.frame = CGRectMake(SCREEN_WIDTH -image.size.width - APP_SPACE(10), (_bankBtn.height - image.size.height)/2, image.size.width, image.size.height);
        [_bankBtn addSubview:_bankBtn.rightIconImageView];
        [self.scrollView addSubview:_bankBtn];
       
        //立即购买
        _buyBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        _buyBtn.frame = CGRectMake(0, SCREEN_HEIGHT - APP_SPACE(50) , SCREEN_WIDTH, APP_SPACE(50));
        _buyBtn.backgroundColor = colorWithLYWhite;
        [_buyBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        _buyBtn.tag = 1003;
        [self.view addSubview:_buyBtn];
        _buyBtn.nameLabel.text = NSLocalizedString(@"立即购买", nil);
        _buyBtn.nameLabel.font = Font_ExtraLarge_bold;
        _buyBtn.nameLabel.textColor = colorWith01;
        size = [LYGlobalDefine getTextContent:_alipyBtn.nameLabel.text withFont:_alipyBtn.nameLabel.font];
        _buyBtn.nameLabel.frame = CGRectMake((_alipyBtn.width - size.width)/2, APP_SPACE(15), size.width, size.height);
        [_buyBtn addSubview:_buyBtn.nameLabel];
        
    }
    
//    [self refreshData]; 
}

#pragma mark ---Data
- (void)initData
{
    
}

- (void)refreshData
{
    self.doctorLabel.text = @"林大爷医生";
    CGSize size = [LYGlobalDefine getTextContent:self.doctorLabel.text withFont:self.doctorLabel.font];
    self.doctorLabel.frame = CGRectMake(APP_SPACE(10), APP_SPACE(25), size.width, size.height);
    
    self.freeLabel.text = @"99元";
    size = [LYGlobalDefine getTextContent:self.freeLabel.text withFont:self.freeLabel.font];
    self.freeLabel.frame = CGRectMake(SCREEN_WIDTH - size.width - APP_SPACE(15), APP_SPACE(25), size.width, size.height);
}

- (void)submitPay
{
#if defined(_ALIPAYSKD_)
    NSString *appScheme = @"XingDuoDuo";
    [[AlipaySDK defaultService] payOrder:nil fromScheme:appScheme callback:^(NSDictionary *resultDic) {
         NSLog(@"支付宝返回参数 =%@",resultDic);
    }];
#endif
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
        _alipyBtn.rightIconImageView.hidden = NO;
        _weChatBtn.rightIconImageView.hidden = YES;
        _bankBtn.rightIconImageView.hidden = YES;
    } else if(index == 1001) {
        _alipyBtn.rightIconImageView.hidden = YES;
        _weChatBtn.rightIconImageView.hidden = NO;
        _bankBtn.rightIconImageView.hidden = YES;
    } else if(index == 1002) {
        _alipyBtn.rightIconImageView.hidden = YES;
        _weChatBtn.rightIconImageView.hidden = YES;
        _bankBtn.rightIconImageView.hidden = NO;
    } else if(index == 1003) {
        [self submitPay];
    }
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
    SHBuyServeVC* vc = [[SHBuyServeVC alloc]init];
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}
@end
