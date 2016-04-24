//
//  PhysicalTableViewCell.m
//  
//
//  Created by 刘朝涛 on 16/1/5.
//
//  功能：体检tableView cell

#import "PhysicalTableViewCell.h"

@implementation PhysicalTableViewCell

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
    
    //科室
    self.contentLab = [[UILabel alloc] init];
    self.contentLab.font = FONT_WITH_SIZE(MAKEOF5(13));
    self.contentLab.textColor = RGBCOLOR16(0x8e8e8e);
    [self.contentView addSubview:self.contentLab];
    
    //职称
    self.addressLab = [[UILabel alloc] init];
    self.addressLab.font = self.contentLab.font;
    self.addressLab.textColor = RGBCOLOR16(0x8e8e8e);
    [self.contentView addSubview:self.addressLab];

}

- (void)theDataWithModel:(ConsultingModel *)model {
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.doctoeHead]] placeholderImage:DEFAULT_AVATAR];
    
    if (model.doctorName) {
        self.nameLab.text = model.doctorName;
    } else {
        self.nameLab.text = @"";
    }
    CGSize size = [NSString getTextMultilineContent:self.nameLab.text withFont:self.nameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.nameLab.frame = CGRectMake(_headImageView.right + MAKEOF5(12), _headImageView.top + MAKEOF5(5), size.width, size.height);
    
    CGFloat Y = MAKEOF5(5);
    //内容
    if (model.content) {
        self.contentLab.text = model.content;
    } else {
        self.contentLab.text = @"";
    }
    size = [NSString getTextMultilineContent:self.contentLab.text withFont:self.contentLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.contentLab.frame = CGRectMake(_nameLab.left, _nameLab.bottom + Y, size.width, size.height);
    
    //地址
    if (model.address) {
        self.addressLab.text = model.address;
    } else {
        self.addressLab.text = @"";
    }
    size = [NSString getTextMultilineContent:self.addressLab.text withFont:self.addressLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - _headImageView.right, MAXFLOAT)];
    self.addressLab.frame = CGRectMake(_contentLab.left, _contentLab.bottom + Y, size.width, size.height);
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
