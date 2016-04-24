//
//  SHDCCusCompCell.m
//  sexduoduo
//
//  Created by shown on 15/9/21.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//
//  
#import "SHDCCusCompCell.h"

@implementation SHDCCusCompCell

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
    if(self) {
        //
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.frame=CGRectMake(APP_SPACE(10), APP_SPACE(5), APP_SPACE(240), APP_SPACE(15));
        self.contentLabel.font=Font_Middle_bold;
        [self addSubview:self.contentLabel];
        //
        self.timeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLabel.frame=CGRectMake(APP_SPACE(10), self.contentLabel.bottom+APP_SPACE(3), APP_SPACE(200), APP_SPACE(10));
        self.timeLabel.font=Font_Small;
        self.timeLabel.textColor=colorWith04;
        [self addSubview:self.timeLabel];
        //分割线1
        UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectZero];
        image.frame=CGRectMake(0, self.timeLabel.bottom+APP_SPACE(3), SCREEN_WIDTH, 1);
        image.backgroundColor=colorWith04;
        [self addSubview:image];
        //分割线2
        UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectZero];
        image2.frame=CGRectMake(0, APP_SPACE(43), SCREEN_WIDTH, 1);
        image2.backgroundColor=colorWith04;
        [self addSubview:image2];
        //
        self.cusLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.cusLabel.frame=CGRectMake(SCREEN_WIDTH-APP_SPACE(50), APP_SPACE(11.5), APP_SPACE(40), APP_SPACE(10));
        self.cusLabel.text=@"申诉";
        self.cusLabel.textColor=colorWith07;
        self.cusLabel.font=Font_Small;
        [self addSubview:self.cusLabel];
        
        
//        self.contentLabel.text=@"用户AAA给了不满意，并投诉了";
//        self.timeLabel.text=@"08-02  19:00~21:00";
        
        
    }
    return self;
}
@end
