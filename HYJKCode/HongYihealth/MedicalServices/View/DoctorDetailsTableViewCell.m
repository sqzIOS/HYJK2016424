//
//  DoctorDetailsTableViewCell.m
//  
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能:医师详情tableViewCell

#import "DoctorDetailsTableViewCell.h"

@implementation DoctorDetailsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initView];
    }
    return self;
}

- (void)initView {
    
    self.nickNameLab = [[UILabel alloc] init];
    self.nickNameLab.textColor = RGBCOLOR16(0x262626);
    self.nickNameLab.font = FONT_WITH_SIZE(MAKEOF5(13));
    [self.contentView addSubview:self.nickNameLab];
    
    //时间
    self.timeLab = [[UILabel alloc] init];
    self.timeLab.font = FONT_WITH_SIZE(MAKEOF5(10));
    self.timeLab.textColor = RGBCOLOR16(0x999999);
//    [self.contentView addSubview:self.timeLab];
    
    //疾病
    self.diseaseLab = [[UILabel alloc] init];
    self.diseaseLab.font  = _timeLab.font;
    self.diseaseLab.textColor = _nickNameLab.textColor;
    [self.contentView addSubview:self.diseaseLab];
    
    //分数
    self.gradeLab1 = [[UILabel alloc] init];
    self.gradeLab1.font = FONT_WITH_SIZE(MAKEOF5(5));
    //    self.gradeLab1.text = @"⭐️⭐️⭐️⭐️⭐️";
    [self.contentView addSubview:self.gradeLab1];
    
    self.gradeLab2 = [[UILabel alloc] init];
    self.gradeLab2.font = _gradeLab1.font;
//    self.gradeLab2.text = @"⭐️⭐️⭐️⭐️⭐️";
    [self.contentView addSubview:self.gradeLab2];
    
    self.gradeLab3 = [[UILabel alloc] init];
    self.gradeLab3.font = _gradeLab1.font;
//    self.gradeLab3.text = @"⭐️⭐️⭐️⭐️⭐️";
    [self.contentView addSubview:self.gradeLab3];
    
    //内容
    self.contentLab = [[UILabel alloc] init];
    self.contentLab.textColor = _nickNameLab.textColor;
    self.contentLab.font = _nickNameLab.font;
    self.contentLab.numberOfLines = 0;
    [self.contentView addSubview:self.contentLab];
    
    //
    self.lab1 = [[UILabel alloc] init];
    self.lab1.font = self.timeLab.font;
    self.lab1.textColor = _timeLab.textColor;
    self.lab1.text = @"治疗疾病: ";
    [self.contentView addSubview:self.lab1];
    
    self.lab2 = [[UILabel alloc] init];
    self.lab2.font = self.timeLab.font;
    self.lab2.textColor = _timeLab.textColor;
    self.lab2.text = @"医生态度 ";
    [self.contentView addSubview:self.lab2];
    
    self.lab3 = [[UILabel alloc] init];
    self.lab3.font = self.timeLab.font;
    self.lab3.textColor = _timeLab.textColor;
    self.lab3.text = @"治疗效果 ";
    [self.contentView addSubview:self.lab3];
    
    self.lab4 = [[UILabel alloc] init];
    self.lab4.font = self.timeLab.font;
    self.lab4.textColor = _timeLab.textColor;
    self.lab4.text = @"总推荐数 ";
    [self.contentView addSubview:self.lab4];
    
    self.line = [[UIView alloc] init];
    self.line.backgroundColor = colorWith05;
    [self.contentView addSubview:self.line];
    
}

- (void)theDataWithModel:(UserEvaluateModel *)model {
    
    if (model.author) {
        self.nickNameLab.text = [NSString stringWithFormat:@"%@评价",model.author];
    } else {
        self.nickNameLab.text = @"";
    }
    CGSize size = [NSString getTextMultilineContent:self.nickNameLab.text withFont:self.nickNameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.nickNameLab.frame = CGRectMake(MAKEOF5(12), MAKEOF5(12), size.width, size.height);
    
//    if (model.time) {
//        self.timeLab.text = model.time;
//    } else {
//        self.timeLab.text = @"";
//    }
//    size = [NSString getTextMultilineContent:self.timeLab.text withFont:self.timeLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
//    self.timeLab.frame = CGRectMake(_nickNameLab.right + MAKEOF5(6), _nickNameLab.bottom - size.height, size.width, size.height);
    
    size = [NSString getTextMultilineContent:self.lab1.text withFont:self.lab1.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.lab1.frame = CGRectMake(_nickNameLab.left, _nickNameLab.bottom + MAKEOF5(12), size.width, size.height);
    
    if (model.disease_types) {
        self.diseaseLab.text = model.disease_types;
    } else {
        self.diseaseLab.text = @"";
    }
    size = [NSString getTextMultilineContent:self.diseaseLab.text withFont:self.diseaseLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.diseaseLab.frame = CGRectMake(_lab1.right, _lab1.top, size.width, size.height);
    
    size = [NSString getTextMultilineContent:self.lab2.text withFont:self.lab2.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.lab2.frame = CGRectMake(_lab1.left, _lab1.bottom + MAKEOF5(12), size.width, size.height);
    
//    size = [NSString getTextMultilineContent:self.gradeLab1.text withFont:self.gradeLab1.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.gradeLab1.frame = CGRectMake(_lab2.right, _lab2.top + _lab2.height/2. - MAKEOF5(8)/2., MAKEOF5(45), MAKEOF5(8));
    if (self.gradeLab1.subviews.count > 0) {
        [self.gradeLab1 removeAllSubviews];
    }
    for (int i = 0; i < 5; i++) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(i * MAKEOF5(9), 0, MAKEOF5(8), MAKEOF5(8))];
        if ([model.attitude_rank intValue] > i) {
            imgV.image = [UIImage imageNamed:@"rank_p"];
        } else {
            imgV.image = [UIImage imageNamed:@"rank_n"];
        }
        [self.gradeLab1 addSubview:imgV];
    }
    
    
    CGFloat x = MAKEOF5(16);
    self.lab3.frame = CGRectMake(_gradeLab1.right + x, _lab2.top, _lab2.width, _lab2.height);
    self.gradeLab2.frame = CGRectMake(_lab3.right, _gradeLab1.top, _gradeLab1.width, _gradeLab1.height);
    if (self.gradeLab2.subviews.count > 0) {
        [self.gradeLab2 removeAllSubviews];
    }
    for (int i = 0; i < 5; i++) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(i * MAKEOF5(9), 0, MAKEOF5(8), MAKEOF5(8))];
        if ([model.effect_rank intValue] > i) {
            imgV.image = [UIImage imageNamed:@"rank_p"];
        } else {
            imgV.image = [UIImage imageNamed:@"rank_n"];
        }
        [self.gradeLab2 addSubview:imgV];
    }
    
    self.lab4.frame = CGRectMake(_gradeLab2.right + x, _lab2.top, _lab2.width, _lab2.height);
    self.gradeLab3.frame = CGRectMake(_lab4.right, _gradeLab1.top, _gradeLab1.width, _gradeLab1.height);
    if (self.gradeLab3.subviews.count > 0) {
        [self.gradeLab3 removeAllSubviews];
    }
    for (int i = 0; i < 5; i++) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(i * MAKEOF5(9), 0, MAKEOF5(8), MAKEOF5(8))];
        if ([model.recommend_rank intValue] > i) {
            imgV.image = [UIImage imageNamed:@"rank_p"];
        } else {
            imgV.image = [UIImage imageNamed:@"rank_n"];
        }
        [self.gradeLab3 addSubview:imgV];
    }
//    ⭐️
    
    //内容
    if (model.content) {
        self.contentLab.text = model.content;
    } else {
        self.contentLab.text = @"";
    }
    size = [NSString getTextMultilineContent:self.contentLab.text withFont:self.contentLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
    self.contentLab.frame = CGRectMake(_nickNameLab.left, _lab2.bottom + MAKEOF5(12), size.width, size.height);
    
    self.line.frame = CGRectMake(0, _contentLab.bottom + MAKEOF5(12), SCREEN_WIDTH, MAKEOF5(1));
    
    self.height = self.line.bottom;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
