//
//  SHDCVisitTimeCell.m
//  sexduoduo
//
//  Created by shown on 15/9/21.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCVisitTimeCell.h"

@implementation SHDCVisitTimeCell

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
        self.todayLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.todayLabel.frame=CGRectMake(APP_SPACE(10), APP_SPACE(11), 70, 20);
        self.todayLabel.textColor=colorWith01;
        self.todayLabel.font=Font_Middle_bold;
        [self addSubview:self.todayLabel];
        
        self.timeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLabel.frame=CGRectMake(self.todayLabel.right+APP_SPACE(10), APP_SPACE(16), 120, 15);
        self.timeLabel.textColor=colorWith04;
        self.timeLabel.font=Font_Small;
        [self addSubview:self.timeLabel];
        
        self.image=[[UIImageView alloc]initWithFrame:CGRectZero];
        self.image.frame=CGRectMake(SCREEN_WIDTH-APP_SPACE(60), 11, 20, 20);
        self.image.image=[UIImage imageNamed:@"health_middle@2x"];
        [self addSubview:self.image];
        
        self.shiLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.shiLabel.frame=CGRectMake(SCREEN_WIDTH-APP_SPACE(40), APP_SPACE(11), 30, 20);
        self.shiLabel.text=@"时段";
        self.shiLabel.textColor=colorWith04;
        self.shiLabel.font=Font_Small;
        [self addSubview:self.shiLabel];

        //边框线
        self.image1=[[UIImageView alloc]initWithFrame:CGRectZero];
        self.image1.frame=CGRectMake(0, APP_SPACE(43.5), SCREEN_WIDTH, 0.5);
        self.image1.backgroundColor=GRAY_COLOR_TABLEVIEWLINE;
        [self addSubview:self.image1];
        
        
        //按钮
        self.rightBtn = [UIButton buttonWithType:0];
        self.rightBtn.frame=CGRectMake(SCREEN_WIDTH-60,0 , 60, 44);
        [self addSubview:self.rightBtn];
        
        
/*******
 数据
 *******/
        
        
        self.timeLabel.text=@"19:00~22:00";
        
    }
    return self;
}
@end
