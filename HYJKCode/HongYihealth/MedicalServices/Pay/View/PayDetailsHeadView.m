//
//  PayDetailsHeadView.m
//  
//
//  Created by 刘朝涛 on 16/1/6.
//
//  功能：预约详情headView

#import "PayDetailsHeadView.h"

@implementation PayDetailsHeadView

- (instancetype)initWithFrame:(CGRect)frame Type:(PayHeadViewType)type{
    if (self = [super initWithFrame:frame]) {
        self.type = type;
        [self initView];
    }
    return self;
}

- (void)initView {
    
    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"预约单号";
    lab.font = FONT_WITH_SIZE(MAKEOF5(13));
    CGSize size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    lab.frame = CGRectMake(MAKEOF5(12), MAKEOF5(12), size.width, size.height);
    [self addSubview:lab];
    
    //单号
    self.orderNumLab = [[UILabel alloc] init];
    self.orderNumLab.font = FONT_WITH_SIZE(MAKEOF5(13));
    self.orderNumLab.textColor = RGBCOLOR16(0x171717);
    self.orderNumLab.text = @"";
    size = [NSString getTextMultilineContent:self.orderNumLab.text withFont:self.orderNumLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.orderNumLab.frame = CGRectMake(lab.right + MAKEOF5(12), lab.top, size.width, size.height);
    [self addSubview:self.orderNumLab];
    
    //
    lab = [[UILabel alloc] init];
    lab.text = @"当前状态";
    lab.font = FONT_WITH_SIZE(MAKEOF5(13));
    size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    lab.frame = CGRectMake(MAKEOF5(12), self.orderNumLab.bottom + MAKEOF5(6), size.width, size.height);
    [self addSubview:lab];
    
    //当前状态
    self.stateLab = [[UILabel alloc] init];
    self.stateLab.font = self.orderNumLab.font;
    self.stateLab.textColor = RGBCOLOR16(0x2fcc87);
    self.stateLab.text = @"";
    size = [NSString getTextMultilineContent:self.stateLab.text withFont:self.stateLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.stateLab.frame = CGRectMake(lab.right + MAKEOF5(12), lab.top, size.width, size.height);
    [self addSubview:self.stateLab];
    
    //bgview1
    self.bgView1 = [[UIView alloc] initWithFrame:CGRectMake(0, lab.bottom + MAKEOF5(12), SCREEN_WIDTH, MAKEOF5(50))];
    self.bgView1.backgroundColor = WHITE_COLOR;
    [self addSubview:self.bgView1];
    
    self.doctorNameLab = [[UILabel alloc] init];
    if (self.type == ForWithServerOrder) {
        self.doctorNameLab.text =@"";
    } else {
        self.doctorNameLab.text =@"";
    }
    self.doctorNameLab.font = FONT_BOLD_WITH_SIZE(MAKEOF5(13));
    size = [NSString getTextMultilineContent:self.doctorNameLab.text withFont:self.doctorNameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.doctorNameLab.frame = CGRectMake(MAKEOF5(12), MAKEOF5(12), size.width, size.height);
    [self.bgView1 addSubview:self.doctorNameLab];
    
//    self.doctorJob1Lab = [[UILabel alloc] init];
//    if (self.type == ForWithServerOrder) {
//        self.doctorJob1Lab.text = @"主任医师";
//    } else {
//        self.doctorJob1Lab.text = @"";
//    }
//    self.doctorJob1Lab.font = FONT_WITH_SIZE(MAKEOF5(13));
//    self.doctorJob1Lab.textColor = RGBCOLOR16(0x1c1c1c);
//    size = [NSString getTextMultilineContent:self.doctorJob1Lab.text withFont:self.doctorJob1Lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
//    self.doctorJob1Lab.frame = CGRectMake(self.doctorNameLab.right + MAKEOF5(12), self.doctorNameLab.top, size.width, size.height);
//    [self.bgView1 addSubview:self.doctorJob1Lab];
//    
//    self.doctorJob2Lab = [[UILabel alloc] init];
//    if (self.type == ForWithServerOrder) {
//        self.doctorJob2Lab.text = @"教授";
//    } else {
//        self.doctorJob2Lab.text = @"";
//    }
//    self.doctorJob2Lab.font = FONT_WITH_SIZE(MAKEOF5(13));
//    self.doctorJob2Lab.textColor = RGBCOLOR16(0x1c1c1c);
//    size = [NSString getTextMultilineContent:self.doctorJob2Lab.text withFont:self.doctorJob2Lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
//    self.doctorJob2Lab.frame = CGRectMake(self.doctorJob1Lab.right + MAKEOF5(6), self.doctorNameLab.top, size.width, size.height);
//    [self.bgView1 addSubview:self.doctorJob2Lab];
    
    //医院名
    self.hospitalNameLab = [[UILabel alloc] init];
    if (self.type == ForWithServerOrder) {
        self.hospitalNameLab.text = @"";
    } else {
        self.hospitalNameLab.text = @"";
    }
    self.hospitalNameLab.textColor = self.doctorJob1Lab.textColor;
    self.hospitalNameLab.font = self.doctorJob1Lab.font;
    self.hospitalNameLab.numberOfLines = 0;
    size = [NSString getTextMultilineContent:self.hospitalNameLab.text withFont:self.hospitalNameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.hospitalNameLab.frame = CGRectMake(self.doctorNameLab.left, self.doctorNameLab.bottom + MAKEOF5(12), size.width, size.height);
    [self.bgView1 addSubview:self.hospitalNameLab];
    
//    //科室
//    self.deparmentLab = [[UILabel alloc] init];
//    if (self.type == ForWithServerOrder) {
//        self.deparmentLab.text = @"胸外科";
//    } else {
//        self.deparmentLab.text = @"";
//    }
//    self.deparmentLab.font = self.hospitalNameLab.font;
//    self.deparmentLab.textColor = self.hospitalNameLab.textColor;
//    size = [NSString getTextMultilineContent:self.deparmentLab.text withFont:self.deparmentLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
//    self.deparmentLab.frame = CGRectMake(self.hospitalNameLab.right + MAKEOF5(6), self.hospitalNameLab.top, size.width, size.height);
//    [self.bgView1 addSubview:self.deparmentLab];
//    
//    //医院地址
//    self.hospitalAddressLab = [[UILabel alloc] init];
//    if (self.type == ForWithServerOrder) {
//        self.hospitalAddressLab.text = @"福建省福州市鼓楼区新权路29号";
//    } else {
//        self.hospitalAddressLab.text = @"翔舞体检中心";
//    }
//    self.hospitalAddressLab.textColor = colorWith04;
//    self.hospitalAddressLab.font = self.deparmentLab.font;
//    size = [NSString getTextMultilineContent:self.hospitalAddressLab.text withFont:self.hospitalAddressLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
//    self.hospitalAddressLab.frame = CGRectMake(self.hospitalNameLab.left, self.hospitalNameLab.bottom + MAKEOF5(12), size.width, size.height);
//    [self.bgView1 addSubview:self.hospitalAddressLab];
    
    //订单时间
    self.timeLab = [[UILabel alloc] init];
    self.timeLab.text = @"";
    self.timeLab.font = FONT_WITH_SIZE(MAKEOF5(11));
    self.timeLab.textColor = colorWith03;
    size = [NSString getTextMultilineContent:self.timeLab.text withFont:self.timeLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.timeLab.frame = CGRectMake(self.hospitalNameLab.left, self.hospitalNameLab.bottom + MAKEOF5(12), size.width, size.height);
    [self.bgView1 addSubview:self.timeLab];
    
    self.bgView1.height = self.timeLab.bottom + MAKEOF5(12);
    
    //bgView2
    self.bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.bgView1.bottom + MAKEOF5(21), SCREEN_WIDTH, MAKEOF5(50))];
    self.bgView2.backgroundColor = WHITE_COLOR;
    [self addSubview:self.bgView2];
    
    //姓名
    lab = [[UILabel alloc] init];
    lab.text = @"姓名";
    lab.font = FONT_WITH_SIZE(MAKEOF5(13));
    size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    lab.frame = CGRectMake(MAKEOF5(12), MAKEOF5(12), size.width, size.height);
    [self.bgView2 addSubview:lab];
    
    self.userNameLab = [[UILabel alloc] init];
    self.userNameLab.text = @"";
    self.userNameLab.textColor = self.doctorJob1Lab.textColor;
    self.userNameLab.font = self.doctorJob1Lab.font;
    size = [NSString getTextMultilineContent:self.userNameLab.text withFont:self.userNameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.userNameLab.frame = CGRectMake(lab.right + MAKEOF5(36), lab.top, size.width, size.height);
    [self.bgView2 addSubview:self.userNameLab];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(self.userNameLab.left, lab.bottom + MAKEOF5(12), SCREEN_WIDTH - self.userNameLab.left, MAKEOF5(1))];
    line.backgroundColor = colorWith05;
    [self.bgView2 addSubview:line];
    
    //电话
    lab = [[UILabel alloc] init];
    lab.text = @"手机号";
    lab.font = FONT_WITH_SIZE(MAKEOF5(13));
    size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    lab.frame = CGRectMake(MAKEOF5(12), line.bottom + MAKEOF5(12), size.width, size.height);
    [self.bgView2 addSubview:lab];
    
    self.userPhoneLab = [[UILabel alloc] init];
    self.userPhoneLab.text = @"";
    self.userPhoneLab.textColor = self.doctorJob1Lab.textColor;
    self.userPhoneLab.font = self.doctorJob1Lab.font;
    size = [NSString getTextMultilineContent:self.userPhoneLab.text withFont:self.userPhoneLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.userPhoneLab.frame = CGRectMake(line.left, lab.top, size.width, size.height);
    [self.bgView2 addSubview:self.userPhoneLab];
    
    self.bgView2.height = self.userPhoneLab.bottom + MAKEOF5(12);
    
    //bgView3
    self.bgView3 = [[UIView alloc] init];
    self.bgView3.backgroundColor = colorWithClear;
    [self addSubview:self.bgView3];
    
    lab = [[UILabel alloc] init];
    lab.text = @"如需帮助，请拨打客服电话: ";
    lab.font = FONT_WITH_SIZE(MAKEOF5(10));
    size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
    lab.frame = CGRectMake(0, 0, size.width, size.height);
    [self.bgView3 addSubview:lab];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"400-9655-525" forState:UIControlStateNormal];
    btn.titleLabel.font = lab.font;
    [btn setTitleColor:RGBCOLOR16(0x32cb9d) forState:UIControlStateNormal];
    size = [NSString getTextMultilineContent:btn.titleLabel.text withFont:btn.titleLabel.font withSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
    btn.frame = CGRectMake(lab.right, lab.top, size.width, size.height);
    [btn addTarget:self action:@selector(callPhone:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView3 addSubview:btn];
    
    self.bgView3.frame = CGRectMake(SCREEN_WIDTH/2. - (lab.width + btn.width)/2., self.bgView2.bottom + MAKEOF5(21), lab.width + btn.width, lab.height);
    
    //去支付
    self.goPayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.goPayBtn.frame = CGRectMake(MAKEOF5(12),self.bgView3.bottom + MAKEOF5(20), SCREEN_WIDTH - MAKEOF5(23), MAKEOF5(40));
    self.goPayBtn.backgroundColor = colorWith01;
    [self.goPayBtn setTitle:@"去支付" forState:UIControlStateNormal];
    [self.goPayBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    self.goPayBtn.titleLabel.font = FONT_WITH_SIZE(MAKEOF5(15));
    [self.goPayBtn addTarget:self action:@selector(goPayBtnAction) forControlEvents:UIControlEventTouchUpInside];
    self.goPayBtn.hidden = YES;
    [self addSubview:self.goPayBtn];
    
    //确认
    self.sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sureBtn.frame = CGRectMake(MAKEOF5(12),self.bgView3.bottom + MAKEOF5(20), SCREEN_WIDTH - MAKEOF5(23), MAKEOF5(40));
    self.sureBtn.backgroundColor = colorWith01;
    [self.sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [self.sureBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    self.sureBtn.titleLabel.font = FONT_WITH_SIZE(MAKEOF5(15));
    [self.sureBtn addTarget:self action:@selector(sureBtnAction) forControlEvents:UIControlEventTouchUpInside];
    self.sureBtn.hidden = YES;
    [self addSubview:self.sureBtn];
    
    //去评价
    self.goEvaluationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.goEvaluationBtn.frame = CGRectMake(MAKEOF5(12),self.bgView3.bottom + MAKEOF5(20), SCREEN_WIDTH - MAKEOF5(23), MAKEOF5(40));
    self.goEvaluationBtn.backgroundColor = colorWith01;
    [self.goEvaluationBtn setTitle:@"评价" forState:UIControlStateNormal];
    [self.goEvaluationBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    self.goEvaluationBtn.titleLabel.font = FONT_WITH_SIZE(MAKEOF5(15));
    [self.goEvaluationBtn addTarget:self action:@selector(goEvaluationBtnAction) forControlEvents:UIControlEventTouchUpInside];
    self.goEvaluationBtn.hidden = YES;
    [self addSubview:self.goEvaluationBtn];
    
    //取消订单
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelBtn.frame = CGRectMake(MAKEOF5(12),self.goPayBtn.bottom + MAKEOF5(10), SCREEN_WIDTH - MAKEOF5(23), MAKEOF5(40));
    self.cancelBtn.backgroundColor = ORANGE_COLOR;
    [self.cancelBtn setTitle:@"取消预约" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    self.cancelBtn.titleLabel.font = FONT_WITH_SIZE(MAKEOF5(15));
    [self.cancelBtn addTarget:self action:@selector(cancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
    self.cancelBtn.hidden = YES;
    [self addSubview:self.cancelBtn];
    
    self.height = self.cancelBtn.bottom + MAKEOF5(12);
}

- (void)refreshHeadView:(OrderModel *)model {
    self.orderNumLab.text = model.order_sn;
    CGSize size = [NSString getTextMultilineContent:self.orderNumLab.text withFont:self.orderNumLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.orderNumLab.width = size.width;
    self.orderNumLab.height = size.height;
    
    self.stateLab.text = model.order_status_name;
    size = [NSString getTextMultilineContent:self.stateLab.text withFont:self.stateLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.stateLab.width = size.width;
    self.stateLab.height = size.height;
    
    self.doctorNameLab.text = model.goodsName;
    size = [NSString getTextMultilineContent:self.doctorNameLab.text withFont:self.doctorNameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.doctorNameLab.frame = CGRectMake(MAKEOF5(12), MAKEOF5(12), size.width, size.height);
    
    self.hospitalNameLab.text = model.doctor_hospital;
    size = [NSString getTextMultilineContent:self.hospitalNameLab.text withFont:self.hospitalNameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.hospitalNameLab.frame = CGRectMake(self.doctorNameLab.left, self.doctorNameLab.bottom + MAKEOF5(12), size.width, size.height);
    
    self.timeLab.text = model.yuyue_time;
    size = [NSString getTextMultilineContent:self.timeLab.text withFont:self.timeLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.timeLab.frame = CGRectMake(self.hospitalNameLab.left, self.hospitalNameLab.bottom + MAKEOF5(12), size.width, size.height);
    
    self.userNameLab.text = model.userName;
    size = [NSString getTextMultilineContent:self.userNameLab.text withFont:self.userNameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.userNameLab.width = size.width;
    self.userNameLab.height = size.height;

    self.userPhoneLab.text = model.userPhone;
    size = [NSString getTextMultilineContent:self.userPhoneLab.text withFont:self.userPhoneLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.userPhoneLab.width = size.width;
    self.userPhoneLab.height = size.height;
    
    self.bgView1.height = self.timeLab.bottom + MAKEOF5(12);
    self.bgView2.top = self.bgView1.bottom + MAKEOF5(21);
    self.bgView2.height = self.userPhoneLab.bottom + MAKEOF5(12);
    self.bgView3.top = self.bgView2.bottom + MAKEOF5(21);
    self.height = self.bgView3.bottom + MAKEOF5(12);
    
    NSRange range = [self.stateLab.text rangeOfString:@"未付款"];
    
    if (range.location != NSNotFound) {
        self.goPayBtn.hidden = NO;
        self.cancelBtn.hidden = NO;
        self.goPayBtn.top = self.bgView3.bottom + MAKEOF5(20);
        self.cancelBtn.top = self.goPayBtn.bottom + MAKEOF5(10);
        self.height = self.cancelBtn.bottom + MAKEOF5(12);
    } else {
        self.goPayBtn.hidden = YES;
        self.cancelBtn.hidden = YES;
    }
    
    range = [self.stateLab.text rangeOfString:@"就诊中"];
    if (range.location != NSNotFound) {
        self.sureBtn.hidden = NO;
        self.sureBtn.top = self.bgView3.bottom + MAKEOF5(20);
        self.height = self.cancelBtn.bottom + MAKEOF5(12);
    } else {
        self.height = self.bgView3.bottom + MAKEOF5(12);
        self.sureBtn.hidden = YES;
    }
    
    range = [self.stateLab.text rangeOfString:@"已就诊"];
    if (range.location != NSNotFound) {
        self.goEvaluationBtn.hidden = NO;
        self.goEvaluationBtn.top = self.bgView3.bottom + MAKEOF5(20);
        self.height = self.goEvaluationBtn.bottom + MAKEOF5(12);
    } else {
        self.goEvaluationBtn.hidden = YES;
        self.height = self.bgView3.bottom + MAKEOF5(12);
    }
    
    range = [self.stateLab.text rangeOfString:@"已取消"];
    if (range.location != NSNotFound) {
        self.goEvaluationBtn.hidden = YES;
        self.goPayBtn.hidden = YES;
        self.cancelBtn.hidden = YES;
        self.sureBtn.hidden = YES;
    }
    
    if (self.height < SCREEN_HEIGHT) {
        self.height = SCREEN_HEIGHT;
    }
}

#pragma mark ---btn action
- (void)callPhone:(UIButton *)sender {
    NSLog(@"打电话");
    if (_delegate) {
        [_delegate telprompt:(sender.titleLabel.text)];
    }
}
//去支付
- (void)goPayBtnAction {
    if (_delegate) {
        [_delegate goPay];
    }
}
//确认
- (void)sureBtnAction {
    if (_delegate) {
        [_delegate sureOrder];
    }
}
//去评价
- (void)goEvaluationBtnAction {
    if (_delegate) {
        [_delegate goEvaluation];
    }
}
//取消订单
- (void)cancelBtnAction {
    if (_delegate) {
        [_delegate cancel];
    }
}

@end
