//
//  SHDiagnoseCell.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHDiagnoseCell.h"

@implementation SHDiagnoseCell
- (void)awakeFromNib {
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        //
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.size = CGSizeMake(SCREEN_WIDTH, kDiagnoseCellHeight);
        //图标
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.iconImageView.frame = CGRectMake(APP_SPACE(10), (kDiagnoseCellHeight - APP_SPACE(70))/2, APP_SPACE(70), APP_SPACE(70));
        self.iconImageView.backgroundColor = [UIColor clearColor];
        self.iconImageView.layer.cornerRadius = 2.0f;
        self.iconImageView.layer.masksToBounds = YES;
        self.iconImageView.layer.borderColor = RGBCOLOR(212,201,203).CGColor;
        self.iconImageView.layer.borderWidth = 2.0f;
        [self.contentView addSubview:self.iconImageView];
        //分割线
        self.lineImageView = [UIImageView imageViewLineWithX:0 withY:kDiagnoseCellHeight - 0.5 withWidth:self.width withHeight:1];
        [self.contentView addSubview:self.lineImageView];
        //标题
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = Font_Large_bold;
        self.titleLabel.textColor = colorWith02;
        [self.contentView addSubview:self.titleLabel];
        //内容
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.font = Font_Middle;
        self.contentLabel.textColor = colorWith03;
        [self.contentView addSubview:self.contentLabel];
        //时间
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.font = Font_Small;
        self.timeLabel.textColor = colorWith04;
        [self.contentView addSubview:self.timeLabel];
    }
    return self;
    
}
/**
 *  数据
 */
- (void)initTableViewCellModel:(SHDiagnoseModel *)model
{
    
}
@end
