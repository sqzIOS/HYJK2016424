//
//  AddressTableViewCell.m
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能: address tableView cell

#import "AddressTableViewCell.h"

@implementation AddressTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initView];
    }
    return self;
}

- (void)initView {
    
    self.lab = [[UILabel alloc] initWithFrame:CGRectMake(MAKEOF5(12), MAKEOF5(12), SCREEN_WIDTH - MAKEOF5(24), 0)];
    self.lab.textColor = RGBCOLOR16(0x2fcc87);
    self.lab.font = FONT_WITH_SIZE(MAKEOF5(13));
    [self.contentView addSubview:self.lab];
    
    self.addressLab = [[UILabel alloc] init];
    self.addressLab.text = @"福建省福州市鼓楼区新权路29号";
    self.addressLab.font = FONT_WITH_SIZE(MAKEOF5(10));
    self.addressLab.textColor = RGBCOLOR16(0x959494);
    [self.contentView addSubview:self.addressLab];
 
    self.imageView1 = [[UIImageView alloc] init];
    self.imageView1.image = [UIImage imageNamed:@"order_agree_n"];
    [self.contentView addSubview:self.imageView1];
    
    self.line = [[UIView alloc] init];
    self.line.backgroundColor = colorWith05;
    [self.contentView addSubview:self.line];
}

- (void)theDateWith:(AddressModel *)model {
//    if (model.address && ![model.address isEqualToString:@"<null>"]) {
//        self.lab.text = model.address;
//    } else {
//        self.lab.text = @"";
//    }
    CGSize size = [NSString getTextMultilineContent:self.lab.text withFont:self.lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.lab.height = size.height;
    
//    NSString *addressLab = nil;
//    if ([model.country isEqualToString:@"<null>"]) {
//        addressLab = @"";
//    } else {
//        addressLab = model.country;
//    }
//    if ([model.province isEqualToString:@"<null>"]) {
//        addressLab = [NSString stringWithFormat:@"%@%@",addressLab,@""];
//    } else {
//        addressLab = [NSString stringWithFormat:@"%@%@",addressLab,model.province];
//    }
//    if ([model.city isEqualToString:@"<null>"]) {
//        addressLab = [NSString stringWithFormat:@"%@%@",addressLab,@""];
//    } else {
//        addressLab = [NSString stringWithFormat:@"%@%@",addressLab,model.city];
//    }
//    if ([model.district isEqualToString:@"<null>"]) {
//        addressLab = [NSString stringWithFormat:@"%@%@",addressLab,@""];
//    } else {
//        addressLab = [NSString stringWithFormat:@"%@%@",addressLab,model.district];
//    }
//    self.addressLab.text = addressLab;
    size = [NSString getTextMultilineContent:self.addressLab.text withFont:self.addressLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.addressLab.frame = CGRectMake(_lab.left, _lab.bottom + MAKEOF5(5), size.width, size.height);
    
    CGFloat height = MAKEOF5(24) + _lab.height + MAKEOF5(5) + self.addressLab.height;
    self.imageView1.frame =  CGRectMake(SCREEN_WIDTH - MAKEOF5(30), self.line.bottom + height/2. - MAKEOF5(18)/2., MAKEOF5(18), MAKEOF5(18));
//    if (model.isSelected) 
//        self.imageView1.image = [UIImage imageNamed:@"order_agree_p"];
//    } else {
        self.imageView1.image = [UIImage imageNamed:@"order_agree_n"];
//    }
    
    self.line.frame = CGRectMake(0, _addressLab.bottom + MAKEOF5(12), SCREEN_WIDTH, MAKEOF5(1));
    
    self.height = height;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
