//
//  SHNearbyHospitalCell.m
//  SexHealth
//
//  Created by ly1992 on 15/6/30.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHNearbyHospitalCell.h"

@implementation SHNearbyHospitalCell

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
        self.size = CGSizeMake(SCREEN_WIDTH, kNearbyHospitalCellHeight);
        //图标
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.iconImageView.frame = CGRectMake(APP_SPACE(10), APP_SPACE(10), APP_SPACE(80), APP_SPACE(80));
        self.iconImageView.backgroundColor = [UIColor clearColor];
        self.iconImageView.layer.borderColor = colorWith05.CGColor;
        self.iconImageView.layer.borderWidth = 2.0f;
        [self.contentView addSubview:self.iconImageView];
        //分割线
        self.lineImageView = [UIImageView imageViewLineWithX:0 withY:kNearbyHospitalCellHeight - 0.5 withWidth:self.width withHeight:1];
        [self.contentView addSubview:self.lineImageView];
        //标题
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = Font_Large_bold;
        self.titleLabel.textColor = colorWith02;
        [self.contentView addSubview:self.titleLabel];
        //地址
        self.addLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.addLabel.backgroundColor = [UIColor clearColor];
        self.addLabel.font = Font_Middle;
        self.addLabel.textColor = colorWith03;
        [self.contentView addSubview:self.addLabel];
        //内容
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.font = Font_Small;
        self.contentLabel.textColor = colorWith04;
        self.contentLabel.numberOfLines = 2;
        [self.contentView addSubview:self.contentLabel];
        //
        self.orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.orderBtn.frame = CGRectMake(APP_SPACE(10), self.iconImageView.bottom + APP_SPACE(5), self.iconImageView.width, APP_SPACE(25));
        self.orderBtn.backgroundColor = colorWith01;
        self.orderBtn.layer.cornerRadius = 2.0f;
        self.orderBtn.layer.masksToBounds = YES;
        self.orderBtn.titleLabel.font = Font_Small;
        [self.orderBtn setTitle:NSLocalizedString(@"预约挂号", nil) forState:UIControlStateNormal];
        [self.orderBtn setTitleColor:colorWithLYWhite forState:UIControlStateNormal];
        [self.contentView addSubview:self.orderBtn];
    }
    return self;
    
}
/**
 *  数据
 */
- (void)initTableViewCellModel:(SHNearbyHospitalInfo *)model
{
    if([model.iconStr hasPrefix:@"http://"])
    {
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.iconStr]];
    }else
        self.iconImageView.image = [UIImage imageNamed:model.iconStr];
    self.titleLabel.text = model.nameStr;
    CGSize size = [LYGlobalDefine getTextContent:self.titleLabel.text withFont:self.titleLabel.font];
    self.titleLabel.frame = CGRectMake(self.iconImageView.right + APP_SPACE(10), self.iconImageView.top, size.width, size.height);
    NSString *addStr = [NSString stringWithFormat:@"地址: %@",model.addressStr];
    self.addLabel.text = addStr;
    size = [LYGlobalDefine getTextContent:self.addLabel.text withFont:self.addLabel.font];
    self.addLabel.frame = CGRectMake(self.titleLabel.left, self.titleLabel.bottom + APP_SPACE(10), size.width, size.height);
    NSString *contentStr = [NSString stringWithFormat:@"介绍: %@",model.contentStr];
    self.contentLabel.text = contentStr;
    self.contentLabel.frame = CGRectMake(self.titleLabel.left, self.addLabel.bottom + APP_SPACE(10), SCREEN_WIDTH - self.titleLabel.left - APP_SPACE(10), APP_SPACE(40));

}
@end
