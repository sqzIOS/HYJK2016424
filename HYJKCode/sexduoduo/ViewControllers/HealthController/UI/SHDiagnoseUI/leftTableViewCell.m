//
//  leftTableViewCell.m
//  sexduoduo
//
//  Created by shown on 15/9/1.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "leftTableViewCell.h"

@implementation leftTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.size = CGSizeMake(SCREEN_WIDTH, kSHCopeCellHeight);
        //图标
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.iconImageView.frame = CGRectMake(APP_SPACE(k_screenWidth/6.-25), APP_SPACE(10), APP_SPACE(50), APP_SPACE(50));
        [self.contentView addSubview:self.iconImageView];
        
        
        
        //nameLab
        self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, k_screenWidth/3., 26)];
        self.nameLab.backgroundColor=CLEAR_COLOR;
        self.nameLab.textAlignment=NSTextAlignmentCenter;
        self.nameLab.textColor = colorWith02;
        [self.nameLab setFont:[UIFont fontWithName:k_Font size:14]];
        [self.contentView addSubview:self.nameLab];
    }
    return self;
}
@end
