//
//  ConsultingTableViewCell.m
//
//
//  Created by 刘朝涛 on 16/1/1.
//
//  功能: 咨询TableViewCell

#import "ConsultingTableViewCell.h"

@implementation ConsultingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    [self.contentView addSubview:self.headImageView];
    
    //姓名
    self.nameLab = [[UILabel alloc] init];
    self.nameLab.font = FONT_WITH_SIZE(MAKEOF5(13));
    self.nameLab.tintColor = colorWith02;
    [self.contentView addSubview:self.nameLab];
    
    //    //科室
    //    self.deparmentLab = [[UILabel alloc] init];
    //    self.deparmentLab.font = FONT_WITH_SIZE(MAKEOF5(11));
    //    self.deparmentLab.textColor = RGBCOLOR16(0x8e8e8e);
    //    [self.contentView addSubview:self.deparmentLab];
    //
    //    //职称
    //    self.jobLab = [[UILabel alloc] init];
    //    self.jobLab.font = _deparmentLab.font;
    //    self.jobLab.textColor = RGBCOLOR16(0x8e8e8e);
    //    [self.contentView addSubview:self.jobLab];
    
    //医院
    self.hospitalLab = [[UILabel alloc] init];
    self.hospitalLab.font = FONT_WITH_SIZE(MAKEOF5(13));
    self.hospitalLab.numberOfLines = 0;
    self.hospitalLab.textColor = RGBCOLOR16(0x8e8e8e);
    [self.contentView addSubview:self.hospitalLab];
    
    //价格
    self.priceLab = [[UILabel alloc] init];
    self.priceLab.font = _hospitalLab.font;
    self.priceLab.textColor = RGBCOLOR16(0x2fcc87);
    //    self.priceLab.text = @"¥400/次";
    [self.contentView addSubview:self.priceLab];
    
    // 优惠前价格
    self.market_priceLab = [[UILabel alloc] init];
    self.market_priceLab.font = _hospitalLab.font;
    self.market_priceLab.textColor = RGBCOLOR16(0x8e8e8e);
    [self.contentView addSubview:self.market_priceLab];

}

- (void)theDataWith:(ConsultingModel *)model {
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.doctoeHead]] placeholderImage:DEFAULT_AVATAR];
    
    if (model.doctorName) {
        self.nameLab.text = model.doctorName;
    } else {
        self.nameLab.text = @"";
    }
    CGSize size = [NSString getTextMultilineContent:self.nameLab.text withFont:self.nameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.nameLab.frame = CGRectMake(_headImageView.right + MAKEOF5(12), _headImageView.top, size.width, size.height);
    
    CGFloat Y = MAKEOF5(5);
    //    //科室
    //    if (model.doctorDeparment) {
    //        self.deparmentLab.text = model.doctorDeparment;
    //    } else {
    //        self.deparmentLab.text = @"";
    //    }
    //    size = [NSString getTextMultilineContent:self.deparmentLab.text withFont:self.deparmentLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    //    self.deparmentLab.frame = CGRectMake(_nameLab.left, _nameLab.bottom + Y, size.width, size.height);
    //
    //    //职称
    //    if (model.doctorJobName) {
    //        self.jobLab.text = model.doctorJobName;
    //    } else {
    //        self.jobLab.text = @"";
    //    }
    //    size = [NSString getTextMultilineContent:self.jobLab.text withFont:self.jobLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    //    self.jobLab.frame = CGRectMake(_deparmentLab.right + MAKEOF5(5), _deparmentLab.top, size.width, size.height);
    
    //医院
    if (model.doctor_hospital) {
        self.hospitalLab.text = model.doctor_hospital;
    } else {
        self.hospitalLab.text = @"";
    }
    size = [NSString getTextMultilineContent:self.hospitalLab.text withFont:self.hospitalLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.hospitalLab.frame = CGRectMake(_nameLab.left, _nameLab.bottom + Y, size.width, size.height);
    
    //价格
    if (model.shop_price) {
        self.priceLab.text = model.shop_price;
    } else {
        self.priceLab.text = @"";
    }
    size = [NSString getTextMultilineContent:self.priceLab.text withFont:self.priceLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.priceLab.frame = CGRectMake(_nameLab.left, _hospitalLab.bottom + Y, size.width, size.height);
    
    // 优惠前价格
    if (model.market_price) {
        self.market_priceLab.text = model.market_price;
        
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.market_priceLab.text];
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [attrStr addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, self.market_priceLab.text.length)];
        self.market_priceLab.attributedText = attrStr;
        CGSize size2 = CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT);
        CGSize labSize = [self.market_priceLab sizeThatFits:size2];
        self.market_priceLab.frame = CGRectMake(self.priceLab.right + MAKEOF5(5), self.priceLab.top, labSize.width, labSize.height);
    }
    
    if (self.priceLab.bottom + MAKEOF5(12) < MAKEOF5(84.5)) {
        self.height = MAKEOF5(84.5);
    } else {
        self.height = self.priceLab.bottom + MAKEOF5(12);
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
