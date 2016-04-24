//
//  SHMydoctorCell.m
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHMydoctorCell.h"

@implementation SHMydoctorCell

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
        self.size = CGSizeMake(SCREEN_WIDTH, kNearbyHospitalCellHeight);
        // 头像
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.iconImageView.frame = CGRectMake(APP_SPACE(10), APP_SPACE(10), APP_SPACE(75), APP_SPACE(105));
        self.iconImageView.backgroundColor = [UIColor clearColor];
        //self.iconImageView.layer.cornerRadius = 4.0f;
        self.iconImageView.layer.masksToBounds = YES;
        self.iconImageView.layer.borderColor = colorWith05.CGColor;
        self.iconImageView.layer.borderWidth = 2.0f;
        [self.contentView addSubview:self.iconImageView];
        // 距离
        self.selectLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.selectLabel.backgroundColor=[UIColor whiteColor];
        self.selectLabel.layer.cornerRadius=5;
        self.selectLabel.layer.borderWidth=1;
        self.selectLabel.font=Font_Small;
        self.selectLabel.textColor=colorWith01;
        self.selectLabel.lineBreakMode=NSLineBreakByTruncatingMiddle;
        self.selectLabel.layer.borderColor=[[UIColor colorWithRed:92/255.0f green:214/255.0f blue:186/255.0f alpha:1]CGColor];
        self.selectLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.selectLabel];
        // 名称
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.nameLabel.backgroundColor = [UIColor clearColor];
        self.nameLabel.font = Font_Large_bold;
        self.nameLabel.textColor = colorWith02;
        [self.contentView addSubview:self.nameLabel];
        // 职称
        self.postLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.postLabel.backgroundColor = [UIColor clearColor];
        self.postLabel.font = Font_Middle;
        self.postLabel.textColor = colorWith01;
        [self.contentView addSubview:self.postLabel];
        // 地址
        self.hospitalLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.hospitalLabel.backgroundColor = [UIColor clearColor];
        self.hospitalLabel.font = Font_Middle;
        self.hospitalLabel.textColor = colorWith03;
        [self.contentView addSubview:self.hospitalLabel];
        
        // 描述
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.font = Font_Small;
        self.contentLabel.textColor = colorWith04;
        self.contentLabel.numberOfLines = 2;
        [self.contentView addSubview:self.contentLabel];
        //
        self.lineImageView = [[UIImageView alloc]init];
        self.lineImageView.backgroundColor = colorWith01;
        [self.contentView addSubview:self.lineImageView];
        //
        self.lineSubImageView = [[UIImageView alloc]init];
        self.lineSubImageView.size = CGSizeMake(SCREEN_WIDTH, 1);
        self.lineSubImageView.backgroundColor = colorWith05;
        [self.contentView addSubview:self.lineSubImageView];
        /*
         self.callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
         self.callBtn.frame = CGRectMake(APP_SPACE(15), self.iconImageView.bottom + APP_SPACE(5), self.iconImageView.width - APP_SPACE(10), APP_SPACE(25));
         self.callBtn.backgroundColor = colorWith01;
         self.callBtn.layer.cornerRadius = 2.0f;
         self.callBtn.layer.masksToBounds = YES;
         [self.callBtn setTitleColor:colorWithLYWhite forState:UIControlStateNormal];
         [self.contentView addSubview:self.callBtn];
         */
        self.loveIconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.loveIconImageView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.loveIconImageView];
        //
        self.scoreLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.scoreLabel.backgroundColor = [UIColor clearColor];
        self.scoreLabel.font = Font_Middle_bold;
        self.scoreLabel.textColor = RGBCOLOR16(0xf45e5e);
        self.scoreLabel.textAlignment = NSTextAlignmentCenter;
        [self.loveIconImageView addSubview:self.scoreLabel];
    }
    return self;
    
}
/**
 *  数据
 */
- (void)initDoctorTableCellModel:(SHMydoctorInfo *)model
{
    //self.iconImageView.image = [UIImage imageNamed:model.iconStr];
    // 头像
    if([model.nearbyHeadimgurl hasPrefix:@"http://"])
    {
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.nearbyHeadimgurl]];
    }else
        self.iconImageView.image = [UIImage imageNamed:model.nearbyHeadimgurl];
    
    // 头像 名称
    self.nameLabel.text = model.nearbyName;
    CGSize size = [LYGlobalDefine getTextContent:self.nameLabel.text withFont:self.nameLabel.font];
    self.nameLabel.frame = CGRectMake(self.iconImageView.right + APP_SPACE(10), self.iconImageView.top + APP_SPACE(10), size.width, size.height);
   
    //距离
    self.selectLabel.text=[NSString stringWithFormat:@"%.3fkm",[model.nearbyDistance floatValue]];
    size = [LYGlobalDefine getTextContent:self.selectLabel.text withFont:self.selectLabel.font];
    self.selectLabel.frame=CGRectMake( self.iconImageView.left, self.iconImageView.bottom+APP_SPACE(5), 75, 25);
    
    // 职称
    self.postLabel.text = model.nearbyDoctorPostl;
    size = [LYGlobalDefine getTextContent:self.postLabel.text withFont:self.postLabel.font];
    self.postLabel.frame = CGRectMake(self.nameLabel.left, self.nameLabel.bottom + APP_SPACE(5), size.width, size.height);
    
    // 地址
    self.hospitalLabel.text = model.nearbyArea;
    size = [LYGlobalDefine getTextContent:self.hospitalLabel.text withFont:self.hospitalLabel.font];
    self.hospitalLabel.frame = CGRectMake(self.nameLabel.left, self.postLabel.bottom + APP_SPACE(5), size.width, size.height);
    //
    self.lineImageView.frame = CGRectMake(self.nameLabel.left, self.hospitalLabel.bottom + APP_SPACE(10), SCREEN_WIDTH - self.nameLabel.left, 1);
    // 内容
    self.contentLabel.text = model.nearbyIntroduce;
    size = [LYGlobalDefine getTextMultilineContent:self.contentLabel.text withFont:self.contentLabel.font withSize:CGSizeMake(SCREEN_WIDTH - self.nameLabel.left - APP_SPACE(20), SCREEN_HEIGHT)];
    self.contentLabel.frame = CGRectMake(self.nameLabel.left, self.lineImageView.bottom + APP_SPACE(5), size.width, 55);
    //self.lineSubImageView.origin = CGPointMake(0, self.contentLabel.bottom + APP_SPACE(10));
    
    // 评价分数
    UIImage *image = [UIImage imageNamed:@"health_lovescore"];
    self.loveIconImageView.image = image;
    self.loveIconImageView.frame = CGRectMake(SCREEN_WIDTH - image.size.width - APP_SPACE(35), APP_SPACE(20), image.size.width, image.size.height);
    self.scoreLabel.text = model.nearbyPopularity;
    self.scoreLabel.frame = CGRectMake(0, APP_SPACE(15), self.loveIconImageView.width, APP_SPACE(20));
}
/**
 *  高
 */
+(CGFloat)getDoctorTableViewCellModel:(SHMydoctorInfo *)model
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.font = Font_Small;
    label.numberOfLines = 0;
    label.text = model.contentStr;
    CGSize size = [LYGlobalDefine getTextMultilineContent:label.text withFont:label.font withSize:CGSizeMake(SCREEN_WIDTH - APP_SPACE(115), SCREEN_HEIGHT)];
    return size.height + APP_SPACE(138);
}

/**
 *  心理咨询 数据
 */
- (void)initPsyTableCellModel:(SHPsychologyInfo *)model
{
    self.iconImageView.frame = CGRectMake(APP_SPACE(10), APP_SPACE(10), APP_SPACE(75), APP_SPACE(100));
    if([model.iconStr hasPrefix:@"http://"])
    {
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.iconStr]];
    }else
        self.iconImageView.image = [UIImage imageNamed:model.iconStr];
    
    
    self.nameLabel.text = model.nameStr;
    CGSize size = [LYGlobalDefine getTextContent:self.nameLabel.text withFont:self.nameLabel.font];
    self.nameLabel.frame = CGRectMake(self.iconImageView.right + APP_SPACE(10), self.iconImageView.top + APP_SPACE(10), size.width, size.height);
    self.postLabel.text = model.postStr;
    size = [LYGlobalDefine getTextContent:self.postLabel.text withFont:self.postLabel.font];
    
    
    self.postLabel.frame = CGRectMake(self.nameLabel.left, self.nameLabel.bottom + APP_SPACE(5), size.width, size.height);
    self.hospitalLabel.text = model.addressStr;
    size = [LYGlobalDefine getTextContent:self.hospitalLabel.text withFont:self.hospitalLabel.font];
    self.hospitalLabel.frame = CGRectMake(self.nameLabel.left, self.postLabel.bottom + APP_SPACE(5), size.width, size.height);
    self.lineImageView.frame = CGRectMake(self.nameLabel.left, self.hospitalLabel.bottom + APP_SPACE(10), SCREEN_WIDTH - self.nameLabel.left, 1);
    
    self.contentLabel.text = model.contentStr;
    size = [LYGlobalDefine getTextMultilineContent:self.contentLabel.text withFont:self.contentLabel.font withSize:CGSizeMake(SCREEN_WIDTH - self.nameLabel.left - APP_SPACE(20), SCREEN_HEIGHT)];
    self.contentLabel.frame = CGRectMake(self.nameLabel.left, self.lineImageView.bottom , size.width, 55);
    
//    self.lineSubImageView.origin = CGPointMake(0, self.contentLabel.bottom + APP_SPACE(10));
    
    
    //
    self.callBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [self.callBtn setTitle:NSLocalizedString(@"电话咨询", nil) forState:UIControlStateNormal];
    //
    UIImage *image = [UIImage imageNamed:@"health_next"];
    self.loveIconImageView.image = image;
    self.loveIconImageView.frame = CGRectMake(SCREEN_WIDTH - image.size.width - APP_SPACE(20), APP_SPACE(30), image.size.width, image.size.height);
    
}
/**
 *  心理咨询 高
 */
+(CGFloat)getPsyTableViewCellModel:(SHPsychologyInfo *)model
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.font = Font_Small;
    label.numberOfLines = 0;
    label.text = model.contentStr;
    CGSize size = [LYGlobalDefine getTextMultilineContent:label.text withFont:label.font withSize:CGSizeMake(SCREEN_WIDTH - APP_SPACE(115), SCREEN_HEIGHT)];
    return size.height + APP_SPACE(128);
}

@end

@implementation SHMydoctorInfo

@end
