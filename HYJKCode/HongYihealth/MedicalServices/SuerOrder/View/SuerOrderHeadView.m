//
//  SuerOrderHeadView.m
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能：确认订单view

#import "SuerOrderHeadView.h"
#import "PatientListController.h"

@implementation SuerOrderHeadView

- (instancetype)initWithFrame:(CGRect)frame Model:(ConsultingModel *)model Controller:(UIViewController *)vc Type:(PayHeadViewType)type{
    if (self = [super initWithFrame:frame]) {
        _orderModel = [[OrderModel alloc] init];
        self.type = type;
        self.mainVC = vc;
        self.model = model;
        [self initView];
    }
    return self;
}

- (void)initView {
    
    _orderModel.shop_price = _model.shop_price;
    
    self.bgView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MAKEOF5(84.5))];
    self.bgView1.backgroundColor = WHITE_COLOR;
    [self addSubview:self.bgView1];
    
    //头像
    self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MAKEOF5(12), MAKEOF5(12), MAKEOF5(61), MAKEOF5(60.5))];
    self.headImageView.layer.cornerRadius = _headImageView.width/2.;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.borderColor = colorWith05.CGColor;
    self.headImageView.layer.borderWidth = 1.;
    self.headImageView.clipsToBounds = YES;
    self.headImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_model.doctoeHead]] placeholderImage:DEFAULT_AVATAR];
    [self.bgView1 addSubview:self.headImageView];
    
    //姓名
    self.nameLab = [[UILabel alloc] init];
    self.nameLab.font = FONT_WITH_SIZE(MAKEOF5(13));
    self.nameLab.textColor = RGBCOLOR16(0x262626);
    [self.bgView1 addSubview:self.nameLab];
    if (_model.doctorName) {
        self.nameLab.text = _model.doctorName;
    } else {
        self.nameLab.text = @"";
    }
    CGSize size = [NSString getTextMultilineContent:self.nameLab.text withFont:self.nameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.nameLab.frame = CGRectMake(_headImageView.right + MAKEOF5(12), _headImageView.centerY - MAKEOF5(3) - size.height, size.width, size.height);
    _orderModel.goodsName = self.nameLab.text;
    
    //职称
    self.jobLab = [[UILabel alloc] init];
    self.jobLab.font = FONT_WITH_SIZE(MAKEOF5(12));
    self.jobLab.textColor = RGBCOLOR16(0x272727);
    [self.bgView1 addSubview:self.jobLab];
    if (self.type == ForWithServerOrder) {
        if (_model.doctorJobName) {
            self.jobLab.text = _model.doctorJobName;
        } else {
            self.jobLab.text = @"";
        }
    } else {
        if (_model.content) {
            self.jobLab.text = _model.content;
        } else {
            self.jobLab.text = @"";
        }
    }
    size = [NSString getTextMultilineContent:self.jobLab.text withFont:self.jobLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.jobLab.frame = CGRectMake(_nameLab.left, _nameLab.bottom + MAKEOF5(5), size.width, size.height);
    
    //职称2:教授
    self.jobLab2 = [[UILabel alloc] init];
    self.jobLab2.font = FONT_WITH_SIZE(MAKEOF5(12));
    self.jobLab2.textColor = RGBCOLOR16(0x272727);
    [self.bgView1 addSubview:self.jobLab2];
    if (_model.doctorJobName) {
        self.jobLab2.text = @"教授";
    } else {
        self.jobLab2.text = @"";
    }
    size = [NSString getTextMultilineContent:self.jobLab2.text withFont:self.jobLab2.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.jobLab2.frame = CGRectMake(_jobLab.right + MAKEOF5(5), _jobLab.top, size.width, size.height);
    
    //医院
    self.hospitalLab = [[UILabel alloc] init];
    self.hospitalLab.font = FONT_WITH_SIZE(MAKEOF5(12));
    self.hospitalLab.textColor = RGBCOLOR16(0x272727);
    self.hospitalLab.numberOfLines = 0;
    [self.bgView1 addSubview:self.hospitalLab];
    if (self.type == ForWithServerOrder) {
        if (_model.doctor_hospital) {
            self.hospitalLab.text = _model.doctor_hospital;
        } else {
            self.hospitalLab.text = @"";
        }
    } else {
        if (_model.address) {
            self.hospitalLab.text = _model.address;
        } else {
            self.hospitalLab.text = @"";
        }
    }
    size = [NSString getTextMultilineContent:self.hospitalLab.text withFont:self.hospitalLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.hospitalLab.frame = CGRectMake(_nameLab.left, _nameLab.bottom + MAKEOF5(6), size.width, size.height);
    _orderModel.doctor_hospital = self.hospitalLab.text;
    
    //科室
    self.deparmentLab = [[UILabel alloc] init];
    self.deparmentLab.font = FONT_WITH_SIZE(MAKEOF5(12));
    self.deparmentLab.textColor = RGBCOLOR16(0x272727);
    [self.bgView1 addSubview:self.deparmentLab];
    if (_model.doctorDeparment) {
        self.deparmentLab.text = _model.doctorDeparment;
    } else {
        self.deparmentLab.text = @"";
    }
    size = [NSString getTextMultilineContent:self.deparmentLab.text withFont:self.deparmentLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.deparmentLab.frame = CGRectMake(_hospitalLab.right + MAKEOF5(5), _hospitalLab.top, size.width, size.height);
    
    self.bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.bgView1.bottom + MAKEOF5(10), SCREEN_WIDTH, MAKEOF5(105))];
    self.bgView2.backgroundColor = WHITE_COLOR;
    [self addSubview:self.bgView2];
    
    //就诊人病例
    NSArray *arr = @[@"就诊人病例", @"预约日期", @"预约地点"];
    NSArray *arr2 = @[@"未填写", @"选择日期", @"选择地点"];
    for (int i = 0; i < arr.count; i++) {
        CTBtn *btn = [[CTBtn alloc] init];
        btn.tag = 1000 + i;
        btn.frame = CGRectMake(0, _line.bottom, SCREEN_WIDTH, MAKEOF5(34));
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView2 addSubview:btn];
        btn.btnTitle.text = arr[i];
        btn.btnTitle.font = FONT_WITH_SIZE(MAKEOF5(13));
        btn.btnTitle.textColor = RGBCOLOR16(0x262626);
        size = [NSString getTextMultilineContent:btn.btnTitle.text withFont:btn.btnTitle.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        btn.btnTitle.frame = CGRectMake(MAKEOF5(12), btn.height/2. - size.height/2., size.width, size.height);
        
        btn.btnIcon.image = [UIImage imageNamed:@"order_jiantou"];
        btn.btnIcon.frame = CGRectMake(btn.width - MAKEOF5(24), btn.height/2 - MAKEOF5(12)/2., MAKEOF5(7.5), MAKEOF5(12));
        
        btn.btnMinTitle.text = arr2[i];
        btn.btnMinTitle.font = FONT_WITH_SIZE(MAKEOF5(11));
        btn.btnMinTitle.textColor = RGBCOLOR16(0x77d7a9);
        size = [NSString getTextMultilineContent:btn.btnMinTitle.text withFont:btn.btnMinTitle.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        btn.btnMinTitle.frame = CGRectMake(btn.btnIcon.left - MAKEOF5(6) - size.width, btn.height/2. - size.height/2., size.width, size.height);
        
        //分割线
        self.line = [[UIView alloc] initWithFrame:CGRectMake(MAKEOF5(12), btn.bottom, SCREEN_WIDTH - MAKEOF5(24), MAKEOF5(1))];
        self.line.backgroundColor = colorWith05;
        [self.bgView2 addSubview:self.line];

    }
//
    UIButton *ageenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ageenBtn.frame = CGRectMake(MAKEOF5(12), self.bgView2.bottom + MAKEOF5(20), MAKEOF5(18), MAKEOF5(18));
    [ageenBtn setImage:[UIImage imageNamed:@"order_agree_p"] forState:UIControlStateNormal];
    [ageenBtn addTarget:self action:@selector(ageenBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:ageenBtn];
    
    size = [NSString getTextMultilineContent:@"同意弘医健康" withFont:FONT_WITH_SIZE(MAKEOF5(12)) withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(ageenBtn.right + MAKEOF5(12), 0, size.width, size.height)];
    lab.font = FONT_WITH_SIZE(MAKEOF5(12));
    lab.textColor = RGBCOLOR16(0x262626);
    lab.text = @"同意弘医健康";
    [self addSubview:lab];
    lab.centerY = ageenBtn.centerY;
    
    size = [NSString getTextMultilineContent:@"用户协议" withFont:FONT_WITH_SIZE(MAKEOF5(12)) withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    UIButton *userDelegateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userDelegateBtn.frame = CGRectMake(lab.right, 0, size.width, size.height);
    [userDelegateBtn setTitle:@"用户协议" forState:UIControlStateNormal];
    [userDelegateBtn setTitleColor:RGBCOLOR16(0x77d7a9) forState:UIControlStateNormal];
    userDelegateBtn.titleLabel.font = FONT_WITH_SIZE(MAKEOF5(12));
    [userDelegateBtn addTarget:self action:@selector(userDelegateBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:userDelegateBtn];
    userDelegateBtn.centerY = lab.centerY;
    
    //提交订单
    _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _submitBtn.frame = CGRectMake(MAKEOF5(12), ageenBtn.bottom + 20, SCREEN_WIDTH - MAKEOF5(24), MAKEOF5(43));
    [_submitBtn setBackgroundImage:[UIImage imageNamed:@"order_submit_n"] forState:UIControlStateNormal];
    [_submitBtn addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_submitBtn];
    
    self.height = _submitBtn.bottom + MAKEOF5(20);
    
}

#pragma mark --- btn action
/**
 *  同意
 *
 *  @param sender
 */
- (void)ageenBtnAction:(UIButton *)sender {
    _isSelectedWithAgeenBtn = !_isSelectedWithAgeenBtn;
    if (_isSelectedWithAgeenBtn) {
        [sender setImage:[UIImage imageNamed:@"order_agree_n"] forState:UIControlStateNormal];
    } else {
        [sender setImage:[UIImage imageNamed:@"order_agree_p"] forState:UIControlStateNormal];
    }
}
/**
 *  提交
 */
- (void)submitAction {
    if (_isOK_1 && _isOK_2 && _isOK_3) {
        [_delegate gotoPayVC:1];
    } else {
        [ShareFunction showToast:@"请填写病历、时间、地点"];
    }
}
/**
 *  用户协议
 */
- (void)userDelegateBtnAction {
    NSLog(@"用户协议");
    [_delegate gotoPayVC:2];
}
/**
 *  病例、时间、地点
 *
 *  @param sender
 */
- (void)btnAction:(CTBtn *)sender {
    switch (sender.tag) {
        case 1000:
        {
            PatientListController *vc = [[PatientListController alloc] init];
            vc.comeFromeSureOrder = YES;
            [self.mainVC.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1001:
        {
            CalenderVC *vc = [[CalenderVC alloc] init];
            vc.deledate = self;
            [self.mainVC.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1002:
        {
            AddressVC *vc = [[AddressVC alloc] init];
//            if (![sender.btnMinTitle.text isEqualToString:@"选择地点"]) {
//                vc.selectedHospitalName = sender.btnMinTitle.text;
//            }
            vc.shopArr = self.shopArr;
            [self.mainVC.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark --- delegate

- (void)changeBingLi:(BOOL)isOK {
    if (isOK) {
        CTBtn *btn = (CTBtn *)[_bgView2 viewWithTag:1000];
        btn.btnMinTitle.text = @"已填写";
        _isOK_1 = YES;
        CGSize size = [NSString getTextMultilineContent:btn.btnMinTitle.text withFont:btn.btnMinTitle.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        btn.btnMinTitle.frame = CGRectMake(btn.btnIcon.left - MAKEOF5(6) - size.width, btn.height/2. - size.height/2., size.width, size.height);
    } else {
        CTBtn *btn = (CTBtn *)[_bgView2 viewWithTag:1000];
        btn.btnMinTitle.text = @"未填写";
        _isOK_1 = YES;
        CGSize size = [NSString getTextMultilineContent:btn.btnMinTitle.text withFont:btn.btnMinTitle.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        btn.btnMinTitle.frame = CGRectMake(btn.btnIcon.left - MAKEOF5(6) - size.width, btn.height/2. - size.height/2., size.width, size.height);
    }
    [self changeBtnBg];
}

- (void)changeValueWithAddress:(NSString *)hospitalName ID:(NSString *)idStr{
    if (![hospitalName isEqualToString:@"(null)"]) {
        CTBtn *btn = (CTBtn *)[_bgView2 viewWithTag:1002];
        btn.btnMinTitle.text = hospitalName;
        _isOK_3 = YES;
        CGSize size = [NSString getTextMultilineContent:btn.btnMinTitle.text withFont:btn.btnMinTitle.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        btn.btnMinTitle.frame = CGRectMake(btn.btnIcon.left - MAKEOF5(6) - size.width, btn.height/2. - size.height/2., size.width, size.height);
        _orderModel.shipping_id = idStr;
    }
    [self changeBtnBg];
}
/**
 *  改变时间
 *
 *  @param selectTime
 */
- (void)changeTime:(NSString *)selectTime Date:(NSString *)date {
    CTBtn *btn = (CTBtn *)[_bgView2 viewWithTag:1001];
    if (btn) {
        btn.btnMinTitle.text = selectTime;
        CGSize size = [NSString getTextMultilineContent:btn.btnMinTitle.text withFont:btn.btnMinTitle.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        btn.btnMinTitle.frame = CGRectMake(btn.btnIcon.left - MAKEOF5(6) - size.width, btn.height/2. - size.height/2., size.width, size.height);
        _isOK_2 = YES;
        NSRange range = [selectTime rangeOfString:@"-"];
        NSString *str = [selectTime substringToIndex:range.location];
        _orderModel.yuyue_time = [NSString stringWithFormat:@"%@ %@:50",date, str];
    }
    
    [self changeBtnBg];
}

- (void)changeBtnBg {
    if (_isOK_3 && _isOK_2 && _isOK_1) {
        [_submitBtn setBackgroundImage:[UIImage imageNamed:@"order_submit_p"] forState:UIControlStateNormal];
    }
}

@end
