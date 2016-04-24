//
//  Method0fPaymentVC.m
//  
//
//  Created by 刘朝涛 on 16/1/4.
//
//  功能：提交成功

#import "Method0fPaymentVC.h"

@interface Method0fPaymentVC ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation Method0fPaymentVC

- (instancetype)initwithType:(PayHeadViewType)type {
    if (self == [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTopUpiew];
    
    [self initView];
}
/**
 *  设置导航栏
 */
- (void)setTopUpiew {
    
    self.titleStr = @"提交成功";
    self.isNeedBack = YES;
}

- (void)initView {
    [self.view addSubview:self.bgView];
    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"我们将尽快为你确认预约结果";
    lab.textColor = RGBCOLOR16(0x65cbaf);
    lab.font = FONT_WITH_SIZE(MAKEOF5(13));
    lab.textAlignment = NSTextAlignmentCenter;
    CGSize size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
    lab.frame = CGRectMake(0, _bgView.top - MAKEOF5(12) - size.height, SCREEN_WIDTH, size.height);
    [self.view addSubview:lab];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2. - MAKEOF5(110)/2., lab.top - MAKEOF5(24) - MAKEOF5(109.5), MAKEOF5(110), MAKEOF5(109.5))];
    icon.image = [UIImage imageNamed:@"order_icon"];
    [self.view addSubview:icon];
    
    UIButton *goHomeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goHomeBtn.frame = CGRectMake(SCREEN_WIDTH/2. - MAKEOF5(114.5), _bgView.bottom + MAKEOF5(30), MAKEOF5(104.5), MAKEOF5(36));
    [goHomeBtn setImage: [UIImage imageNamed:@"go_home"] forState:UIControlStateNormal];
    [goHomeBtn addTarget:self action:@selector(goHomeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goHomeBtn];
    
    UIButton *seeOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    seeOrderBtn.frame = CGRectMake(goHomeBtn.right + MAKEOF5(20), goHomeBtn.top, MAKEOF5(104.5), MAKEOF5(36));
    [seeOrderBtn setImage: [UIImage imageNamed:@"see_order"] forState:UIControlStateNormal];
    [seeOrderBtn addTarget:self action:@selector(seeOrderBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:seeOrderBtn];
}


- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        
        UILabel *lab = [[UILabel alloc] init];
        lab.text = @"如需帮助，请拨打客服电话: ";
        lab.font = FONT_WITH_SIZE(MAKEOF5(10));
        CGSize size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
        lab.frame = CGRectMake(0, 0, size.width, size.height);
        [_bgView addSubview:lab];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"400-9655-525" forState:UIControlStateNormal];
        btn.titleLabel.font = lab.font;
        [btn setTitleColor:RGBCOLOR16(0x32cb9d) forState:UIControlStateNormal];
        size = [NSString getTextMultilineContent:btn.titleLabel.text withFont:btn.titleLabel.font withSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
        btn.frame = CGRectMake(lab.right, lab.top, size.width, size.height);
        [btn addTarget:self action:@selector(callPhone:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:btn];
        
        _bgView.frame = CGRectMake(SCREEN_WIDTH/2. - (lab.width + btn.width)/2., SCREEN_HEIGHT/2. - lab.height/2., lab.width + btn.width, lab.height);
    }
    return _bgView;
}

#pragma mark ---btn action
- (void)callPhone:(UIButton *)sender {
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",sender.titleLabel.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

- (void)goHomeBtnAction {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)seeOrderBtnAction {
   
    PayDetailsVC *vc = [[PayDetailsVC alloc] initWithType:self.type];
    vc.orderID = self.orderID;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
