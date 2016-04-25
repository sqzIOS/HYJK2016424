//
//  DoctorDetailsTableViewHeadView.m
//
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能：医师详情头部视图

#import "DoctorDetailsTableViewHeadView.h"

@implementation DoctorDetailsTableViewHeadView

- (instancetype)initWithFrame:(CGRect)frame Model:(ConsultingModel *)model Type:(DoctorDetailsVCType)type{
    if (self = [super initWithFrame:frame]) {
        self.type = type;
        self.model = model;
        [self initView];
    }
    return self;
}

- (void)initView {
    //头像
    self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MAKEOF5(12), MAKEOF5(12), MAKEOF5(61), MAKEOF5(60.5))];
    self.headImageView.layer.cornerRadius = _headImageView.width/2.;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.borderColor = colorWith05.CGColor;
    self.headImageView.layer.borderWidth = 1.;
    self.headImageView.clipsToBounds = YES;
    self.headImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_model.doctoeHead]] placeholderImage:DEFAULT_AVATAR];
    [self addSubview:self.headImageView];
    
    //关注
    self.attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.attentionBtn.frame = CGRectMake(SCREEN_WIDTH - MAKEOF5(12) - MAKEOF5(38), _headImageView.top, MAKEOF5(38), MAKEOF5(52));
    [self.attentionBtn setImage:[UIImage imageNamed:@"unattention"] forState:UIControlStateNormal];
    [self.attentionBtn addTarget:self action:@selector(attentionBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.attentionBtn];
//    _attentionBtn.centerY = _headImageView.centerY;
    if (self.type == ForPhysical) {
        _attentionBtn.hidden = YES;
    }
    
    //姓名
    self.nameLab = [[UILabel alloc] init];
    self.nameLab.font = FONT_WITH_SIZE(MAKEOF5(13));
    self.nameLab.textColor = RGBCOLOR16(0x262626);
    self.nameLab.numberOfLines = 0;
    [self addSubview:self.nameLab];
    if (_model.doctorName) {
        self.nameLab.text = _model.doctorName;
    } else {
        self.nameLab.text = @"";
    }
    CGSize size = [NSString getTextMultilineContent:self.nameLab.text withFont:self.nameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.nameLab.frame = CGRectMake(_headImageView.right + MAKEOF5(12), _headImageView.top + MAKEOF5(3), size.width, size.height);
    
    //    //职称
    //    self.jobLab = [[UILabel alloc] init];
    //    self.jobLab.font = FONT_WITH_SIZE(MAKEOF5(12));
    //    self.jobLab.textColor = RGBCOLOR16(0x272727);
    //    [self addSubview:self.jobLab];
    //    if (self.type == ForServer) {
    //        if (_model.doctorJobName) {
    //            self.jobLab.text = _model.doctorJobName;
    //        } else {
    //            self.jobLab.text = @"";
    //        }
    //    } else {
    //        if (_model.content) {
    //            self.jobLab.text = _model.content;
    //        } else {
    //            self.jobLab.text = @"";
    //        }
    //    }
    //    size = [NSString getTextMultilineContent:self.jobLab.text withFont:self.jobLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    //    self.jobLab.frame = CGRectMake(_nameLab.left, _nameLab.bottom + MAKEOF5(5), size.width, size.height);
    //
    //    //职称2:教授
    //    self.jobLab2 = [[UILabel alloc] init];
    //    self.jobLab2.font = FONT_WITH_SIZE(MAKEOF5(12));
    //    self.jobLab2.textColor = RGBCOLOR16(0x272727);
    //    [self addSubview:self.jobLab2];
    //    if (_model.doctorJobName) {
    //        self.jobLab2.text = @"教授";
    //    } else {
    //        self.jobLab2.text = @"";
    //    }
    //    size = [NSString getTextMultilineContent:self.jobLab2.text withFont:self.jobLab2.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    //    self.jobLab2.frame = CGRectMake(_jobLab.right + MAKEOF5(5), _jobLab.top, size.width, size.height);
    
    //医院
    self.hospitalLab = [[UILabel alloc] init];
    self.hospitalLab.font = FONT_WITH_SIZE(MAKEOF5(12));
    self.hospitalLab.textColor = RGBCOLOR16(0x272727);
    self.hospitalLab.numberOfLines = 0;
    [self addSubview:self.hospitalLab];
    if (self.type == ForServer) {
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
    size = [NSString getTextMultilineContent:self.hospitalLab.text withFont:self.hospitalLab.font withSize:CGSizeMake(_attentionBtn.left - MAKEOF5(6) - _nameLab.left, MAXFLOAT)];
    self.hospitalLab.frame = CGRectMake(_nameLab.left, _nameLab.bottom + MAKEOF5(10), size.width, size.height);
    
    //科室
    self.deparmentLab = [[UILabel alloc] init];
    self.deparmentLab.font = FONT_WITH_SIZE(MAKEOF5(12));
    self.deparmentLab.textColor = RGBCOLOR16(0x272727);
    [self addSubview:self.deparmentLab];
    if (_model.doctorDeparment) {
        self.deparmentLab.text = _model.doctorDeparment;
    } else {
        self.deparmentLab.text = @"";
    }
    size = [NSString getTextMultilineContent:self.deparmentLab.text withFont:self.deparmentLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.deparmentLab.frame = CGRectMake(_hospitalLab.right + MAKEOF5(5), _hospitalLab.top, size.width, size.height);
    
    //分割线
    self.line = [[UIView alloc] initWithFrame:CGRectMake(0, _headImageView.bottom + MAKEOF5(12), SCREEN_WIDTH, MAKEOF5(10))];
    self.line.backgroundColor = colorWith05;
    [self addSubview:self.line];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(MAKEOF5(12), _line.bottom + MAKEOF5(10), MAKEOF5(13.5), MAKEOF5(12.5))];
    icon.image = [UIImage imageNamed:@"introduction"];
    [self addSubview:icon];
    
    size = [NSString getTextMultilineContent:@"项目简介" withFont:FONT_WITH_SIZE(MAKEOF5(13)) withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(icon.right + MAKEOF5(6), _line.bottom + MAKEOF5(10), size.width, size.height)];
    lab1.text = @"项目简介";
    lab1.textColor = RGBCOLOR16(0x54dfa2);
    lab1.font = FONT_WITH_SIZE(MAKEOF5(13));
    [self addSubview:lab1];
    lab1.centerY = icon.centerY;
    
    //分割线
    self.line = [[UIView alloc] initWithFrame:CGRectMake(0, icon.bottom + MAKEOF5(10), SCREEN_WIDTH, MAKEOF5(1))];
    self.line.backgroundColor = colorWith05;
    [self addSubview:self.line];
    
    //简介
    self.introduceLab = [[UILabel alloc] init];
    self.introduceLab.font = FONT_WITH_SIZE(MAKEOF5(12));
    self.introduceLab.textColor = RGBCOLOR16(0x535353);
    self.introduceLab.numberOfLines = 0;
    [self addSubview:self.introduceLab];
    if (_model.doctorIntroduce) {
        self.introduceLab.text = _model.doctorIntroduce;
    } else {
        self.introduceLab.text = @"";
    }
    self.introduceLab.frame = CGRectMake(MAKEOF5(12), _line.bottom + MAKEOF5(10), SCREEN_WIDTH - MAKEOF5(24), MAKEOF5(100));
    
    //分割线
    self.line = [[UIView alloc] initWithFrame:CGRectMake(0, _introduceLab.bottom + MAKEOF5(10), SCREEN_WIDTH, MAKEOF5(1))];
    self.line.backgroundColor = colorWith05;
    [self addSubview:self.line];
    
    //展开按钮
    self.unfoldBtn = [[CTBtn alloc] init];
    self.unfoldBtn.frame = CGRectMake(0, _line.bottom, SCREEN_WIDTH, MAKEOF5(40));
    [self.unfoldBtn addTarget:self action:@selector(unfoldBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.unfoldBtn];
    
    self.unfoldBtn.btnTitle.text = @"展开";
    self.unfoldBtn.btnTitle.textColor = RGBCOLOR16(0x999999);
    self.unfoldBtn.btnTitle.font = FONT_WITH_SIZE(MAKEOF5(13));
    size = [NSString getTextMultilineContent:self.unfoldBtn.btnTitle.text withFont:self.unfoldBtn.btnTitle.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.unfoldBtn.btnTitle.frame = CGRectMake(_unfoldBtn.width/2. - size.width, _unfoldBtn.height/2. - size.height/2., size.width, size.height);
    
    self.unfoldBtn.btnIcon.image = [UIImage imageNamed:@"unfold"];
    self.unfoldBtn.btnIcon.frame = CGRectMake(_unfoldBtn.btnTitle.right + MAKEOF5(5), _unfoldBtn.height/2. - MAKEOF5(5)/2., MAKEOF5(8.5), MAKEOF5(5));
    
    
    self.line2 = [[UIView alloc] initWithFrame:CGRectMake(0, _unfoldBtn.bottom, SCREEN_WIDTH, MAKEOF5(10))];
    self.line2.backgroundColor = colorWith05;
    [self addSubview:self.line2];
    
    //评价
    self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(MAKEOF5(12), _line2.bottom + MAKEOF5(10), MAKEOF5(13.5), MAKEOF5(12.5))];
    self.icon.image = [UIImage imageNamed:@"evaluate"];
    [self addSubview:self.icon];
    
    size = [NSString getTextMultilineContent:@"评价" withFont:FONT_WITH_SIZE(MAKEOF5(13)) withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.lab = [[UILabel alloc] initWithFrame:CGRectMake(_icon.right + MAKEOF5(6), _line2.bottom + MAKEOF5(10), size.width, size.height)];
    self.lab.text = @"评价";
    self.lab.textColor = RGBCOLOR16(0x54dfa2);
    self.lab.font = FONT_WITH_SIZE(MAKEOF5(13));
    [self addSubview:self.lab];
    self.lab.centerY = self.icon.centerY;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - MAKEOF5(12) - MAKEOF5(7), 0, MAKEOF5(7), MAKEOF5(11))];
    self.imageView .image = [UIImage imageNamed:@"jiantou"];
    [self addSubview:self.imageView ];
    self.imageView .centerY = _lab.centerY;
    
    //分割线
    self.line3 = [[UIView alloc] initWithFrame:CGRectMake(0, _lab.bottom + MAKEOF5(10), SCREEN_WIDTH, MAKEOF5(1))];
    self.line3.backgroundColor = colorWith05;
    [self addSubview:self.line3];
    
    self.height = self.line3.bottom;
    
}
/**
 *  关注
 */
- (void)attentionBtnAction {
    //    _isSelected = !_isSelected;
    if (_detailsBlock) {
        _detailsBlock();
    }
}
/**
 *  展开
 */
- (void)unfoldBtnAction {
    _isSelectedWithUnfoldBtn = !_isSelectedWithUnfoldBtn;
    if (_isSelectedWithUnfoldBtn) {
        _unfoldBtn.btnTitle.text = @"收起";
        CGSize size = [NSString getTextMultilineContent:_introduceLab.text withFont:self.introduceLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
        self.introduceLab.height = size.height;
    } else {
        _unfoldBtn.btnTitle.text = @"展开";
        self.introduceLab.height = MAKEOF5(100);
    }
    [self changViewHeight];
}

- (void)changViewHeight {
    self.line.top = _introduceLab.bottom + MAKEOF5(10);
    self.unfoldBtn.top = _line.bottom;
    self.line2.top = _unfoldBtn.bottom;
    self.icon.top = _line2.bottom + MAKEOF5(10);
    self.lab.centerY = self.icon.centerY;
    self.imageView .centerY = _lab.centerY;
    self.line3.top = _lab.bottom + MAKEOF5(10);
    
    self.height = self.line3.bottom;
    
    [self.delegate changeHeight];
}

- (void)refreshIntrodueLab:(NSString *)str {
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    //    attrStr = [attrStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.introduceLab.attributedText = attrStr;
    self.introduceLab.text = [self.introduceLab.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    CGSize size = [NSString getTextMultilineContent:self.introduceLab.text withFont:self.introduceLab.font withSize:CGSizeMake(self.introduceLab.width, MAXFLOAT)];
    if (size.height > 100) {
        _unfoldBtn.hidden = NO;
        //        self.unfoldBtn.top = _line.bottom;
        _unfoldBtn.height = MAKEOF5(40);
    } else {
        _unfoldBtn.hidden = YES;
        _unfoldBtn.height = 0;
        //        self.unfoldBtn.top = _line.bottom;
    }
    self.line2.top = _unfoldBtn.bottom;
    self.icon.top = _line2.bottom + MAKEOF5(10);
    self.lab.centerY = self.icon.centerY;
    self.imageView .centerY = _lab.centerY;
    self.line3.top = _lab.bottom + MAKEOF5(10);
    self.height = self.line3.bottom;
    [self.delegate changeHeight];
}

- (void)changeCollected:(NSString *)collected {
    if (collected && [collected intValue] == 1) {
        [self.attentionBtn setImage:[UIImage imageNamed:@"attention"] forState:UIControlStateNormal];
    } else {
        [self.attentionBtn setImage:[UIImage imageNamed:@"unattention"] forState:UIControlStateNormal];
    }
}

@end
