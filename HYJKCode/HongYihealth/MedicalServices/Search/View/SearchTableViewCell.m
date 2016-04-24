//
//  SearchTableViewCell.m
//  搜索以及纪录保存
//
//  Created by shown on 16/1/8.
//  Copyright (c) 2016年 shown. All rights reserved.
//

#import "SearchTableViewCell.h"

@implementation SearchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initView];
    }
    return self;
}

- (void)initView {
    
    _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MAKEOF5(12), MAKEOF5(12), MAKEOF5(39.5), MAKEOF5(39.5))];
    _headImageView.image = [UIImage imageNamed:@"search_head"];
    _headImageView.layer.cornerRadius = _headImageView.width/2.;
    _headImageView.layer.masksToBounds = YES;
    _headImageView.layer.borderColor = colorWith05.CGColor;
    _headImageView.layer.borderWidth = 1.;
    _headImageView.clipsToBounds = YES;
    _headImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_headImageView];
    
    //姓名
    _nameLab = [[UILabel alloc] init];
    _nameLab.font = FONT_WITH_SIZE(MAKEOF5(13));
    _nameLab.textColor = RGBCOLOR16(0x262626);
    [self.contentView addSubview:_nameLab];
    
//    //职称
//    _jobLab = [[UILabel alloc] init];
//    _jobLab.font = FONT_WITH_SIZE(MAKEOF5(11));
//    _jobLab.textColor = RGBCOLOR16(0x272727);
//    [self.contentView addSubview:_jobLab];
    
    //医院名以及科室
    _hospitalNameLab = [[UILabel alloc] init];
    _hospitalNameLab.font = _nameLab.font;
    _hospitalNameLab.textColor = _nameLab.textColor;
    _hospitalNameLab.numberOfLines = 0;
    [self.contentView addSubview:_hospitalNameLab];
    
    //介绍（价格）
    _introduceLab = [[UILabel alloc] init];
    _introduceLab.font = _nameLab.font;
    _introduceLab.textColor = RGBCOLOR16(0x2fcc87);
//    _introduceLab.numberOfLines = 2;
    [self.contentView addSubview:_introduceLab];
    
    // 原价
    _market_priceLab = [[UILabel alloc] init];
    _market_priceLab.font = _nameLab.font;
    _market_priceLab.textColor = RGBCOLOR16(0x8e8e8e);
    [self.contentView addSubview:_market_priceLab];
    
    //星星
    _starView = [[UIView alloc] init];
    [self.contentView addSubview:_starView];
    
    //是否可预约
    _icon = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - MAKEOF5(39) - MAKEOF5(12), 0, MAKEOF5(39), MAKEOF5(23))];
    _icon.image = [UIImage imageNamed:@"about_n"];
    [self.contentView addSubview:_icon];
    
    //分割线
    _line = [[UILabel alloc] init];
    _line.backgroundColor = colorWith05;
    [self.contentView addSubview:_line];
}

- (void)theDataWithModel:(ConsultingModel *)model {
    
    //头像
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:model.doctoeHead] placeholderImage:DEFAULT_AVATAR];
    
    //姓名
    if (model.doctorName && ![model.doctorName isEqualToString:@"<null>"]) {
        _nameLab.text = model.doctorName;
    }
    CGSize size = [NSString getTextMultilineContent:_nameLab.text withFont:_nameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    _nameLab.frame = CGRectMake(_headImageView.right + MAKEOF5(12), _headImageView.top, size.width, size.height);
    
//    //职称
//    _jobLab.text = [NSString stringWithFormat:@"%@  %@",model.doctorJobName,model.job2Str];
//    size = [NSString getTextMultilineContent:_jobLab.text withFont:_jobLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
//    _jobLab.frame = CGRectMake(_nameLab.right + MAKEOF5(6), _nameLab.bottom - size.height, size.width, size.height);
    
    //医院名
    _hospitalNameLab.text = [NSString stringWithFormat:@"%@",model.doctor_hospital];
    size = [NSString getTextMultilineContent:_hospitalNameLab.text withFont:_hospitalNameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    _hospitalNameLab.frame = CGRectMake(_nameLab.left, _nameLab.bottom + MAKEOF5(6), size.width, size.height);
    
    //价格
    _introduceLab.text = model.shop_price;
    size = [NSString getTextMultilineContent:_introduceLab.text withFont:_introduceLab.font withSize:CGSizeMake(SCREEN_WIDTH - _headImageView.right - MAKEOF5(35), MAXFLOAT)];
//    CGSize size2 = [NSString getTextMultilineContent:@"中间值" withFont:_introduceLab.font withSize:CGSizeMake(SCREEN_WIDTH - _headImageView.right - MAKEOF5(24), MAXFLOAT)];
    _introduceLab.frame = CGRectMake(_nameLab.left, _hospitalNameLab.bottom + MAKEOF5(6), size.width, size.height);
    
    // 优惠前价格
    if (model.market_price) {
        self.market_priceLab.text = model.market_price;
        
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.market_priceLab.text];
        [attrStr addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, self.market_priceLab.text.length)];
        self.market_priceLab.attributedText = attrStr;
        CGSize size2 = CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT);
        CGSize labSize = [self.market_priceLab sizeThatFits:size2];
        self.market_priceLab.frame = CGRectMake(self.introduceLab.right + MAKEOF5(5), self.introduceLab.top, labSize.width, labSize.height);
    }
    
    if ([model.isAbout intValue] == 0) {
        _icon.image = [UIImage imageNamed:@"about_p"];
    } else {
        _icon.image = [UIImage imageNamed:@"about_n"];
    }
    
    for (int i = 0; i < 5; i++) {
        UIImageView *starImageView = [[UIImageView alloc] initWithFrame:CGRectMake((7)*i, 0, MAKEOF5(6), MAKEOF5(5))];
        if (i < [model.starNum intValue]) {
            starImageView.image = [UIImage imageNamed:@"start_p"];
        } else {
            starImageView.image = [UIImage imageNamed:@"start_n"];
        }
        [_starView addSubview:starImageView];
    }
    
    _starView.frame = CGRectMake(0, _headImageView.bottom + MAKEOF5(6), MAKEOF5(25), MAKEOF5(5));
    _starView.centerX = _headImageView.centerX;
    
    _line.frame = CGRectMake(0, _introduceLab.bottom + MAKEOF5(12), SCREEN_WIDTH, MAKEOF5(1));
    
    self.height = _line.bottom;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
