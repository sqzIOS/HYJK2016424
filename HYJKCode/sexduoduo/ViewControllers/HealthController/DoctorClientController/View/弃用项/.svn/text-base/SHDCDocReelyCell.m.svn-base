//
//  SHDCDocReelyCell.m
//  sexduoduo
//
//  Created by shown on 15/9/17.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCDocReelyCell.h"

@implementation SHDCDocReelyCell

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
        //头像
        self.headImageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        self.headImageView.frame=CGRectMake(APP_SPACE(10), APP_SPACE(10), 70, 70);
        self.headImageView.backgroundColor=RGBCOLOR(163, 202, 253);
        self.headImageView.layer.cornerRadius=35;
        self.headImageView.layer.masksToBounds=YES;
        self.headImageView.layer.borderWidth = 3.0;
        self.headImageView.layer.borderColor=[[UIColor colorWithRed:203/255.0 green:237/255.0 blue:254/255.0 alpha:1]CGColor];
        [self.contentView addSubview:self.headImageView];
        
        //医师姓名
        self.nameLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.nameLabel.frame=CGRectMake(self.headImageView.right+APP_SPACE(10), APP_SPACE(15), 60, 25);
        self.nameLabel.font=Font_Middle;
        [self.contentView addSubview:self.nameLabel];
        //职位
        self.jobLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.jobLabel.frame=CGRectMake(self.headImageView.right+APP_SPACE(10), self.nameLabel.bottom+APP_SPACE(10), 65, 20);
        self.jobLabel.font=Font_Small;
        self.jobLabel.textColor=colorWith07;
        [self.contentView addSubview:self.jobLabel];
        //认证
        self.autLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.autLabel.frame=CGRectMake(self.jobLabel.right+APP_SPACE(10), self.nameLabel.bottom+APP_SPACE(15), 45, 15);
        self.autLabel.backgroundColor=[UIColor redColor];
        self.autLabel.layer.cornerRadius=3;
        self.autLabel.layer.masksToBounds=YES;
        self.autLabel.font=Font_Small_bold;
        self.autLabel.textColor=[UIColor whiteColor];
        self.autLabel.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:self.autLabel];
        //坐标图片
        self.coordinateView=[[UIImageView alloc]initWithFrame:CGRectZero];
        self.coordinateView.frame=CGRectMake(self.headImageView.right+APP_SPACE(10), self.jobLabel.bottom+APP_SPACE(5), 15, 20);
        self.coordinateView.image=[UIImage imageNamed:@"mark.png"];
        [self.contentView addSubview:self.coordinateView];
        //地址
        self.addlabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.addlabel.frame=CGRectMake(self.coordinateView.right+APP_SPACE(5), self.jobLabel.bottom+APP_SPACE(5), 100, 20);
        self.addlabel.font=Font_Small;
        self.addlabel.textColor=colorWith03;
        [self.contentView addSubview:self.addlabel];
        //分割线
        self.iconImageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        self.iconImageView.frame=CGRectMake(15, self.addlabel.bottom+APP_SPACE(5), self.contentView.frame.size.width-30, 1);
        self.iconImageView.backgroundColor=colorWith05;
        [self.contentView addSubview:self.iconImageView];
        //内容
        self.contentLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.frame=CGRectMake(20, self.iconImageView.bottom+APP_SPACE(5), 250, 30);
        self.contentLabel.font=Font_Middle;
        self.contentLabel.textColor=colorWith04;
        self.contentLabel.numberOfLines=0;
        [self.contentView addSubview:self.contentLabel];
        //时间
        self.timeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLabel.frame=CGRectMake((self.contentView.frame.size.width/2)-APP_SPACE(40), self.contentLabel.bottom+APP_SPACE(5), 80, 10);
        self.timeLabel.font=Font_Small;
        self.timeLabel.textColor=colorWith04;
        self.timeLabel.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:self.timeLabel];
        //查看回复,可以通过选择row来查看回复嘛
        self.seeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.seeLabel.frame=CGRectMake(self.timeLabel.right+APP_SPACE(35), self.contentLabel.bottom+APP_SPACE(5), 80, 10);
        self.seeLabel.font=Font_Small;
        self.seeLabel.textColor=colorWith04;
        self.seeLabel.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:self.seeLabel];
        //人气图片
        self.moodsImageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        self.moodsImageView.frame=CGRectMake(self.autLabel.right+APP_SPACE(30), APP_SPACE(15), 50, 40);
        self.moodsImageView.image=[UIImage imageNamed:@"popularity"];
        
        [self.contentView addSubview:self.moodsImageView];
        //人气指数
        self.moodsLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.autLabel.right+APP_SPACE(30), APP_SPACE(15), 50, 30)];
        self.moodsLabel.backgroundColor=[UIColor clearColor];
        self.moodsLabel.textAlignment=NSTextAlignmentCenter;
        self.moodsLabel.textColor=[UIColor whiteColor];
        [self.contentView addSubview:self.moodsLabel];
        
        //数据***************
        self.nameLabel.text=@"流川枫";
        self.jobLabel.text=@"主任医师";
        self.autLabel.text=@"未认证";
        self.addlabel.text=@"福建省－厦门市";
        self.contentLabel.text=@"你是上帝派来的一只猪嘛你是上帝派来的一只猪嘛你是上帝派来的一只猪嘛你是上帝派来的一只猪嘛";
        self.moodsLabel.text=@"666";
        self.timeLabel.text=@"09-17 10:03";
        self.seeLabel.text=@"查看6条回复";
        
        
    }
    return self;
}
@end
