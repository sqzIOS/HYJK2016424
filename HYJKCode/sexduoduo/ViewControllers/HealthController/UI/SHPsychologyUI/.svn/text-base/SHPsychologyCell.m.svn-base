//
//  SHPsychologyCell.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHPsychologyCell.h"

@implementation SHPsychologyCell

- (void)awakeFromNib {
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //
        self.size = CGSizeMake(SCREEN_WIDTH, 0);
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.iconImageView.frame = CGRectMake(APP_SPACE(10), APP_SPACE(15), APP_SPACE(70), APP_SPACE(95));
        self.iconImageView.backgroundColor = [UIColor clearColor];
        self.iconImageView.layer.cornerRadius = 4.0f;
        self.iconImageView.layer.masksToBounds = YES;
        self.iconImageView.layer.borderColor = colorWith04.CGColor;
        self.iconImageView.layer.borderWidth = 2.0f;
        [self.contentView addSubview:self.iconImageView];
        //
        self.callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.callBtn.frame = CGRectMake(APP_SPACE(15), self.iconImageView.bottom + APP_SPACE(5),  self.iconImageView.width - APP_SPACE(10), APP_SPACE(20));
        self.callBtn.backgroundColor = colorWith01;
        [self.callBtn setTintColor:colorWithLYWhite];
        self.callBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.callBtn setTitle:NSLocalizedString(@"电话咨询", nil) forState:UIControlStateNormal];
        [self.contentView addSubview:self.callBtn];
        //
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.nameLabel.backgroundColor = [UIColor clearColor];
        self.nameLabel.font = Font_Large_bold;
        self.nameLabel.textColor = colorWith02;
        [self.contentView addSubview:self.nameLabel];
        //
        self.postLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.postLabel.backgroundColor = [UIColor clearColor];
        self.postLabel.font = Font_Middle;
        self.postLabel.textColor = colorWith01;
        [self.contentView addSubview:self.postLabel];
        //
        self.hospitalLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.hospitalLabel.backgroundColor = [UIColor clearColor];
        self.hospitalLabel.font = Font_Large;
        self.hospitalLabel.textColor = colorWith03;
        [self.contentView addSubview:self.hospitalLabel];
        //
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.font = Font_Small;
        self.contentLabel.textColor = colorWith04;
        self.contentLabel.numberOfLines = 0;
        [self.contentView addSubview:self.contentLabel];
        //
        self.loveImageView = [[UIImageView alloc]initWithFrame:CGRectMake(APP_SPACE(240), APP_SPACE(25), APP_SPACE(60), APP_SPACE(40))];
        self.loveImageView.backgroundColor = [UIColor clearColor];
        self.loveImageView.layer.cornerRadius = 4.0f;
        self.loveImageView.layer.masksToBounds = YES;
        self.loveImageView.layer.borderColor = colorWith04.CGColor;
        self.loveImageView.layer.borderWidth = 2.0f;
        [self.contentView addSubview:self.loveImageView];
        //
        self.lineImageView = [UIImageView imageViewLineWithX:0 withY:0 - 0.5 withWidth:self.width withHeight:1];
        [self.contentView addSubview:self.lineImageView];
        //
        self.lineSubImageView = [UIImageView imageViewLineWithX:0 withY:0 - 0.5 withWidth:self.width withHeight:1];
        self.lineSubImageView.backgroundColor = colorWith01;
        [self.contentView addSubview:self.lineSubImageView];
    }
    return self;
    
}

/**
 *  数据
 */
- (void)initTableCellModel:(SHPsychologyModel *)model
{
    
}
/**
 *  高
 */
+(CGFloat)getTableViewCellModel:(SHPsychologyModel *)model
{
    return 0;
}
@end
