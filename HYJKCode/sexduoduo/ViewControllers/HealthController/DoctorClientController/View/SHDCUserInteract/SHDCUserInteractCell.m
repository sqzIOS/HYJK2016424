//
//  SHDCUserInteractCell.m
//  sexduoduo
//
//  Created by shown on 15/9/17.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCUserInteractCell.h"

@implementation SHDCUserInteractCell

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
        
        self.contentLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.frame=CGRectMake(APP_SPACE(10), APP_SPACE(10), self.contentView.frame.size.width-APP_SPACE(20), 30);
        self.contentLabel.font=Font_Small;
        self.contentLabel.numberOfLines=0;
        self.contentLabel.textColor=colorWith04;
        [self.contentView addSubview:self.contentLabel];
        
        self.floorlabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.floorlabel.frame=CGRectMake(APP_SPACE(10), self.contentLabel.bottom+APP_SPACE(5), 12, 12);
        self.floorlabel.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:self.floorlabel];
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.frame=CGRectMake(self.contentView.frame.size.width/2-40, self.contentLabel.bottom+APP_SPACE(5), 80, 12);
        self.timeLabel.font = Font_Middle;
        self.timeLabel.textColor = colorWith03;
        [self.contentView addSubview:self.timeLabel];
        
        self.seeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.seeLabel.backgroundColor = [UIColor clearColor];
        self.seeLabel.frame=CGRectMake(self.timeLabel.right+APP_SPACE(20), self.contentLabel.bottom+APP_SPACE(5), 60, 12);
        self.seeLabel.font = Font_Small;
        self.seeLabel.textColor = colorWith04;
        [self.contentView addSubview:self.seeLabel];
        
        self.contentLabel.text=@"你是上帝派来的一只猪嘛你是上帝派来的一只猪嘛你是上帝派来的一只猪嘛你是上帝派来的一只猪嘛你是上帝派来的一只猪嘛你是上帝派来的一只猪嘛你是上帝派来的一只猪嘛";
        self.floorlabel.text=@"1楼";
        self.timeLabel.text=@"09.17－14:00";
        self.seeLabel.text=@"匿名回复";
    }
    return self;
}
@end