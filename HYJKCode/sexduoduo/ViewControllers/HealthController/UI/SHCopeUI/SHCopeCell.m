//
//  SHCopeCell.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHCopeCell.h"

@implementation SHCopeCell

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
        self.size = CGSizeMake(SCREEN_WIDTH, kSHCopeCellHeight);
        //图标
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.iconImageView.frame = CGRectMake(APP_SPACE(10), (kSHCopeCellHeight - APP_SPACE(80))/2, APP_SPACE(80), APP_SPACE(80));
        self.iconImageView.backgroundColor = [UIColor clearColor];
        self.iconImageView.layer.cornerRadius = 6.0f;
        self.iconImageView.layer.masksToBounds = YES;
        self.iconImageView.layer.borderColor = RGBCOLOR(212,201,203).CGColor;
        self.iconImageView.layer.borderWidth = 2.0f;
        [self.contentView addSubview:self.iconImageView];
        //分割线
        self.lineImageView = [UIImageView imageViewLineWithX:0 withY:kSHCopeCellHeight - 0.5 withWidth:self.width withHeight:1];
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
- (void)initTableViewCellModel:(SHCopeInfo *)model
{
    if ([model.iconStr hasPrefix:@"http://"]) {
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.iconStr] placeholderImage:nil];
    }else
        self.iconImageView.image = [UIImage imageNamed:model.iconStr];
    
    
    self.titleLabel.text = model.titleStr;
    
    CGSize size = [LYGlobalDefine getTextContent:self.titleLabel.text withFont:self.titleLabel.font];
    self.titleLabel.frame = CGRectMake(self.iconImageView.right + APP_SPACE(10), self.iconImageView.top + APP_SPACE(5), size.width, size.height);
    self.contentLabel.text = model.titleStr;
    
    size = [LYGlobalDefine getTextContent:self.contentLabel.text withFont:self.contentLabel.font];
    self.contentLabel.frame = CGRectMake(self.titleLabel.left, self.titleLabel.bottom + APP_SPACE(5), SCREEN_WIDTH - self.titleLabel.left - APP_SPACE(10), size.height);
    self.timeLabel.text = model.timeStr;
    
    size = [LYGlobalDefine getTextContent:self.titleLabel.text withFont:self.titleLabel.font];
    self.timeLabel.frame = CGRectMake(self.titleLabel.left, self.contentLabel.bottom + APP_SPACE(5), size.width, size.height);
    
}
@end
