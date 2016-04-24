//
//  SHConsultDetailHeadView.m
//  sexduoduo
//
//  Created by shown on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHConsultDetailHeadView.h"
#import "SHConsulting.h"
@interface SHConsultDetailHeadView ()
@property (nonatomic, strong) UIImageView *iv_avatar;
@property (nonatomic, strong) UIButton *btn_sex;
@property (nonatomic, strong) UILabel *lb_date;
@property (nonatomic, strong) UILabel *lb_numAnswer;
@property (nonatomic, strong) UILabel *lb_descItem;
@property (nonatomic, strong) UIButton *btn_descDetail;
@property (nonatomic, strong) UIView *v_bottomDash;
@property (nonatomic, strong) SHConsulting *consult;

@property (nonatomic, assign) int numAnswer;
@end
@implementation SHConsultDetailHeadView
- (instancetype)initWithConsult:(SHConsulting *)consult{
    if (self = [super init]) {
        self.consult = consult;
        [self setupUI];
        self.bounds = CGRectMake(0, 0, SCREEN_WIDTH, self.btn_descDetail.bottom + 10);
    }
    return self;
}
- (void)setupUI
{
    [self addSubview:self.iv_avatar];
    
    self.btn_sex.left = self.iv_avatar.right + 10;
    self.btn_sex.centerY = self.iv_avatar.centerY;
    [self addSubview:self.btn_sex];
    
    self.lb_date.left = self.btn_sex.left;
    self.lb_date.top = self.btn_sex.bottom + 10;
    [self addSubview:self.lb_date];
    
    self.lb_descItem.left = self.iv_avatar.left;
    self.lb_descItem.top = self.iv_avatar.bottom + 10;
    [self addSubview:self.lb_descItem];
    
    self.lb_numAnswer.right = SCREEN_WIDTH - 20;
    self.lb_numAnswer.top = self.iv_avatar.top - 10;
    [self addSubview:self.lb_numAnswer];
    
    self.btn_descDetail.top = self.lb_descItem.bottom + 15;
    [self addSubview:self.btn_descDetail];
    
    self.v_bottomDash.top = self.btn_descDetail.bottom+9;
    [self addSubview:self.v_bottomDash];
}
#pragma mark - UI
- (UIImageView *)iv_avatar{
    if (!_iv_avatar) {
        _iv_avatar = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12, 70, 70)];
        _iv_avatar.backgroundColor = RGBACOLOR(162, 200, 251, 1);
        _iv_avatar.layer.cornerRadius = 70/2.f;
        _iv_avatar.layer.masksToBounds = YES;
        _iv_avatar.layer.borderColor = RGBACOLOR(204, 237, 254, 1).CGColor;
        _iv_avatar.layer.borderWidth = 2;
        
        if (self.consult.headImg && ![self.consult.headImg isKindOfClass:[NSNull class]]) {
            [_iv_avatar sd_setImageWithURL:[NSURL URLWithString:self.consult.headImg]];
        }
        
    }
    return _iv_avatar;
}
- (UIButton *)btn_sex{
    if (!_btn_sex) {
        _btn_sex = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 13)];
        _btn_sex.titleLabel.font = FONT(10);
        [_btn_sex setTitle:[NSString stringWithFormat:@"%d",self.consult.age] forState:UIControlStateNormal];
        [_btn_sex setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn_sex setImageEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 17)];
        [_btn_sex setTitleEdgeInsets:UIEdgeInsetsMake(0, -9, 0, 0)];
        _btn_sex.userInteractionEnabled = NO;
        _btn_sex.layer.cornerRadius = 2;
        _btn_sex.layer.masksToBounds = YES;
        
        if (self.consult.age>99) {
            _btn_sex.width = 40;
            [self.btn_sex setImageEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 25)];
        }
        if ([self.consult.sex isEqualToString:@"男"]) {
            self.btn_sex.backgroundColor = RGBACOLOR(253, 156, 157, 1);
            [self.btn_sex setImage:[[UIImage imageNamed:@"health_woman_flag"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        }else{
            self.btn_sex.backgroundColor = RGBACOLOR(0, 169, 232, 1);
            [self.btn_sex setImage:[[UIImage imageNamed:@"health_man_flag"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        }
    }
    return _btn_sex;
}
- (UILabel *)lb_date{
    if (!_lb_date) {
        _lb_date = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 11)];
        _lb_date.text = [NSString dateFromLongLong:self.consult.createDate dateFormat:@"yyyy-MM-dd HH:mm"];
        _lb_date.font = [UIFont systemFontOfSize:11];
        _lb_date.textColor = colorWith03;
    }
    return _lb_date;
}
- (UILabel *)lb_descItem{
    if (!_lb_descItem) {
        _lb_descItem = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
        _lb_descItem.textColor = colorWith02;
        _lb_descItem.text = @"问题描述";
        _lb_descItem.font = [UIFont systemFontOfSize:18];
    }
    return _lb_descItem;
}
- (UILabel *)lb_numAnswer{
    if (!_lb_numAnswer) {
        _lb_numAnswer = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 115)];
        NSMutableAttributedString *atsNum = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d",self.numAnswer] attributes:@{NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter-CondensedBold" size:35],NSForegroundColorAttributeName:RGBACOLOR(58, 226, 195, 1)}];
        NSMutableAttributedString *atsAnswer = [[NSMutableAttributedString alloc] initWithString:@" 个回答" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGBACOLOR(121, 205, 145, 1)}];
        [atsNum appendAttributedString:atsAnswer];
        _lb_numAnswer.textAlignment = NSTextAlignmentRight;
        _lb_numAnswer.attributedText = atsNum;
    }
    return _lb_numAnswer;
}
- (UIButton *)btn_descDetail{
    if (!_btn_descDetail) {
        CGFloat titleWidth = SCREEN_WIDTH - 20;
        CGRect titleRect = [JFrame getStringFrame:self.consult.content font:FONT(15) width:titleWidth-20];
        CGFloat btnHeight = titleRect.size.height+30;
        CGFloat btnWidth = SCREEN_WIDTH - 10*2;
        
        _btn_descDetail = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, btnWidth, btnHeight)];
        _btn_descDetail.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 5);
        _btn_descDetail.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btn_descDetail.titleLabel.numberOfLines = 0;
        _btn_descDetail.titleLabel.font = FONT(15);
        _btn_descDetail.titleLabel.textAlignment = NSTextAlignmentLeft;
//        [_btn_descDetail setBackgroundImage:[UIImage resizableImage:@"wenbenkuang" top:0.4 andLeft:0.4] forState:UIControlStateNormal];
        [_btn_descDetail setBackgroundImage:[UIImage imageNamed:@"wenbenkuang"] forState:UIControlStateNormal];
        _btn_descDetail.userInteractionEnabled = NO;
        [_btn_descDetail setTitleColor:colorWith02 forState:UIControlStateNormal];
        [_btn_descDetail setTitle:self.consult.content forState:UIControlStateNormal];
    }
    return _btn_descDetail;
}
- (UIView *)v_bottomDash{
    if (!_v_bottomDash) {
        _v_bottomDash = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        _v_bottomDash.backgroundColor = colorWith04;
    }
    return _v_bottomDash;
}
@end
