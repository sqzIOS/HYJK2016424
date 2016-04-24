//
//  SHDCPictureTextCell.m
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCPictureTextCell.h"
#import "SHDCPictureText.h"
@implementation SHDCPictureTextCell

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
        self.size = CGSizeMake(SCREEN_WIDTH, 90);
        //
        self.headImageView =[[UIImageView alloc]initWithFrame:CGRectZero];
        self.headImageView.frame=CGRectMake(10, 10, 70, 70);
        self.headImageView.layer.cornerRadius=35;
        self.headImageView.layer.masksToBounds=YES;
        [self.contentView addSubview:self.headImageView];
        //
        self.sexImageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        self.sexImageView.frame=CGRectMake(self.headImageView.right+APP_SPACE(10), 10, 25, 25);
        [self.contentView addSubview:self.sexImageView];
        //
        self.ageLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.ageLabel.frame=CGRectMake(self.sexImageView.right+APP_SPACE(5), 10, 50, 25);
        [self.contentView addSubview:self.ageLabel];
        //
        self.contentLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.frame=CGRectMake(self.headImageView.right+APP_SPACE(10), self.sexImageView.bottom+APP_SPACE(5), self.contentView.frame.size.width-APP_SPACE(100), 20);
        self.contentLabel.font=Font_Small_bold;
        self.contentLabel.textColor=colorWith03;
        [self.contentView addSubview:self.contentLabel];
        //
        self.timeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLabel.frame=CGRectMake(self.headImageView.right+APP_SPACE(10), self.contentLabel.bottom+APP_SPACE(5), 120, 15);
        self.timeLabel.font=Font_Small;
        self.timeLabel.textColor=colorWith04;
        [self.contentView addSubview:self.timeLabel];
        //抢答
        self.answerlabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.answerlabel.frame=CGRectMake(SCREEN_WIDTH-35, 10, 30, 15);
        self.answerlabel.textAlignment=NSTextAlignmentCenter;
        self.answerlabel.font=[UIFont systemFontOfSize:12];
        self.answerlabel.textColor=colorWithLYWhite;
        self.answerlabel.layer.cornerRadius=3.0;
        self.answerlabel.layer.masksToBounds=YES;
        self.answerlabel.backgroundColor=colorWith07;
        [self.contentView addSubview:self.answerlabel];
        //完成，评价
        self.completelabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.completelabel.frame=CGRectMake(SCREEN_WIDTH-55, self.contentLabel.bottom+APP_SPACE(2), 50, 20);
        self.completelabel.font=Font_Small;
        self.completelabel.textColor=colorWith01;
        self.completelabel.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:self.completelabel];
        //边框线；分割线
        UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectZero];
        image.frame=CGRectMake(0, APP_SPACE(90), SCREEN_WIDTH, 1);
        image.backgroundColor=colorWith05;
        [self.contentView addSubview:image];
    }
    return self;
}
@end
