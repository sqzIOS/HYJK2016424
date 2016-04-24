//
//  PayHeadView.m
//  
//
//  Created by 刘朝涛 on 16/1/4.
//
//  功能:支付headView

#import "PayHeadView.h"

@implementation PayHeadView

- (instancetype)initWithFrame:(CGRect)frame Controller:(UIViewController *)vc Type:(PayHeadViewType)type Model:(OrderModel *)model{
    if (self = [super initWithFrame:frame]) {
        self.type = type;
        self.backgroundColor = colorWithClear;
        self.mainVC = vc;
        [self initView:model];
    }
    return self;
}

- (void)initView:(OrderModel *)model {
    
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
    self.orderNumLab.text = @"2150828007917";
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
    self.stateLab.text = @"待支付";
    size = [NSString getTextMultilineContent:self.stateLab.text withFont:self.stateLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.stateLab.frame = CGRectMake(lab.right + MAKEOF5(12), lab.top, size.width, size.height);
    [self addSubview:self.stateLab];
    
    //bgview1
    self.bgView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MAKEOF5(50))];
    self.bgView1.backgroundColor = WHITE_COLOR;
    [self addSubview:self.bgView1];
    
    self.doctorNameLab = [[UILabel alloc] init];
//    if (self.type == ForWithServerOrder) {
//        self.doctorNameLab.text =@"陈椿";
//    } else {
//        self.doctorNameLab.text =@"女公务员套餐";
//    }
    self.doctorNameLab.text = model.goodsName;
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
//    if (self.type == ForWithServerOrder) {
//        self.hospitalNameLab.text = @"福建医科大学附属协和医院";
//    } else {
//        self.hospitalNameLab.text = @"女性公务群体";
//    }
    self.hospitalNameLab.text = model.doctor_hospital;
    self.hospitalNameLab.textColor = self.doctorJob1Lab.textColor;
    self.hospitalNameLab.font = self.doctorJob1Lab.font;
    self.hospitalNameLab.numberOfLines = 0;
    size = [NSString getTextMultilineContent:self.hospitalNameLab.text withFont:self.hospitalNameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.hospitalNameLab.frame = CGRectMake(self.doctorNameLab.left, self.doctorNameLab.bottom + MAKEOF5(12), size.width, size.height);
    [self.bgView1 addSubview:self.hospitalNameLab];
    
    //科室
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

    //医院地址
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
    self.timeLab.text = model.yuyue_time;
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
    self.userNameLab.text = model.userName;
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
    self.userPhoneLab.text = model.userPhone;
    self.userPhoneLab.textColor = self.doctorJob1Lab.textColor;
    self.userPhoneLab.font = self.doctorJob1Lab.font;
    size = [NSString getTextMultilineContent:self.userPhoneLab.text withFont:self.userPhoneLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.userPhoneLab.frame = CGRectMake(line.left, lab.top, size.width, size.height);
    [self.bgView2 addSubview:self.userPhoneLab];
    
    self.bgView2.height = self.userPhoneLab.bottom + MAKEOF5(12);
    
    //bgView3
    self.bgView3 = [[UIView alloc] initWithFrame:CGRectMake(0, self.bgView2.bottom + MAKEOF5(21), SCREEN_WIDTH, MAKEOF5(50))];
    self.bgView3.backgroundColor = WHITE_COLOR;
    [self addSubview:self.bgView3];
    
    //支付方式
    lab = [[UILabel alloc] init];
    lab.text = @"支付方式";
    lab.font = FONT_WITH_SIZE(MAKEOF5(13));
    size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    lab.frame = CGRectMake(MAKEOF5(12), MAKEOF5(12), size.width, size.height);
    [self.bgView3 addSubview:lab];
    
    self.payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.payBtn addTarget:self action:@selector(payBtnAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.payBtn setImage:[UIImage imageNamed:@"pay_selected"] forState:UIControlStateNormal];
    self.payBtn.titleLabel.font = FONT_WITH_SIZE(QZMake(13));
    [self.payBtn setTitle:@"选择" forState:UIControlStateNormal];
    [self.payBtn setTitleColor:colorWith01 forState:UIControlStateNormal];
    [self.bgView3 addSubview:self.payBtn];
    size = [NSString getTextMultilineContent:self.payBtn.titleLabel.text withFont:self.payBtn.titleLabel.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.payBtn.frame = CGRectMake(SCREEN_WIDTH - size.width - MAKEOF5(12), QZMake(25) - size.height/2, size.width, size.height);
    self.payBtn.centerY = lab.centerY;

    
    line = [[UIView alloc] initWithFrame:CGRectMake(self.userNameLab.left, lab.bottom + MAKEOF5(12), SCREEN_WIDTH - self.userNameLab.left, MAKEOF5(1))];
    line.backgroundColor = colorWith05;
    [self.bgView3 addSubview:line];
    
    lab = [[UILabel alloc] init];
    lab.text = @"支付金额";
    lab.font = FONT_WITH_SIZE(MAKEOF5(13));
    size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    lab.frame = CGRectMake(MAKEOF5(12),line.bottom + MAKEOF5(12), size.width, size.height);
    [self.bgView3 addSubview:lab];
    
    self.priceLab = [[UILabel alloc] init];
    self.priceLab.textColor = RGBCOLOR16(0x2fcc87);
    self.priceLab.text = model.shop_price;
    self.priceLab.font = FONT_WITH_SIZE(MAKEOF5(11));
    size = [NSString getTextMultilineContent:self.priceLab.text withFont:self.priceLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.priceLab.frame = CGRectMake(SCREEN_WIDTH - size.width - MAKEOF5(14),0, size.width, size.height);
    [self.bgView3 addSubview:self.priceLab];
    self.priceLab.centerY = lab.centerY;
    
    self.bgView3.height = lab.bottom + MAKEOF5(12);
    
    self.submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submitBtn.frame = CGRectMake(MAKEOF5(12), self.bgView3.bottom + MAKEOF5(42), SCREEN_WIDTH - MAKEOF5(24), MAKEOF5(43.5));
    [self.submitBtn setBackgroundImage:[UIImage imageNamed:@"pay_n"] forState:UIControlStateNormal];
    [self.submitBtn addTarget:self action:@selector(submitBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.submitBtn];
    
    self.height = self.submitBtn.bottom + MAKEOF5(12);
}
/**
 *  选择支付方式
 */
- (void)payBtnAction {
 
    if (_headBlock) {
        _headBlock();
    }
}

/**
 *  提交订单
 */
- (void)submitBtnAction {
    if (_isOK) {
//        Method0fPaymentVC *vc = [[Method0fPaymentVC alloc] initwithType:self.type];
//        [self.mainVC.navigationController pushViewController:vc animated:YES];
        if (_submitBlock) {
            _submitBlock();
        }
    } else {
        [ShareFunction showToast:@"请选择支付方式"];
    }
}

- (void)changeBtnBg:(BOOL)isOK{
    _isOK = isOK;
    if (isOK) {
        [self.submitBtn setBackgroundImage:[UIImage imageNamed:@"pay_p"] forState:UIControlStateNormal];
    }
}

@end
