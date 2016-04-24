//
//  SHHistoryCell.m
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//  服务历史 Cell

#import "SHHistoryCell.h"

@implementation SHHistoryCell

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
        
        self.size = CGSizeMake(SCREEN_WIDTH, kHistoryCellHeight);
        
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.iconImageView.frame = CGRectMake(APP_SPACE(10), (kHistoryCellHeight - APP_SPACE(80))/2, APP_SPACE(80), APP_SPACE(80));
        
        self.iconImageView.backgroundColor = [UIColor clearColor];
        self.iconImageView.layer.cornerRadius = APP_SPACE(80)/2;
        self.iconImageView.layer.masksToBounds = YES;
        self.iconImageView.layer.borderColor = colorWith05.CGColor;
        self.iconImageView.layer.borderWidth = 2.0f;
        //[self.contentView addSubview:self.iconImageView];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.nameLabel.backgroundColor = [UIColor clearColor];
        self.nameLabel.font = Font_Large;
        self.nameLabel.textColor = colorWith03;
        //[self.contentView addSubview:self.nameLabel];
        //
        self.bgImageView = [[UIImageView alloc]init];
        self.bgImageView.layer.cornerRadius = 2.0f;
        self.bgImageView.layer.masksToBounds = YES;
        //[self.contentView addSubview:self.bgImageView];
       
        //
        self.sexLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.sexLabel.font = [UIFont systemFontOfSize:16.0f];
        self.sexLabel.textColor=colorWithBK04;
        [self.contentView addSubview:self.sexLabel];
        //
        self.yearLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.yearLabel.backgroundColor = [UIColor clearColor];
        self.yearLabel.font = [UIFont systemFontOfSize:16.0f];
        self.yearLabel.textColor = colorWithBK03;
        [self.contentView addSubview:self.yearLabel];
        //
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.font = Font_Large;
        self.contentLabel.textColor = colorWith02;
        [self.contentView addSubview:self.contentLabel];
        //
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.font = Font_Small;
        self.timeLabel.textColor = colorWith04;
        self.timeLabel.numberOfLines = 0;
        [self.contentView addSubview:self.timeLabel];
        //
        self.lineImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.lineImageView.backgroundColor = colorWith01;
        [self.contentView addSubview:self.lineImageView];
        //
        self.doctorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.doctorBtn.backgroundColor = colorWith01;
        self.doctorBtn.layer.cornerRadius = 3.0f;
        self.doctorBtn.layer.masksToBounds = YES;
        self.doctorBtn.titleLabel.font = Font_Small_bold;
        [self.doctorBtn setTitleColor:colorWithLYWhite forState:UIControlStateNormal];
        [self.contentView addSubview:self.doctorBtn];
        //
        self.lineImageView = [UIImageView imageViewLineWithX:0 withY:kHistoryCellHeight - 0.5 withWidth:SCREEN_WIDTH withHeight:1];
        [self.contentView addSubview:self.lineImageView];
        }
    return self;
}

/**
 *  数据
 */
- (void)initTableCellModel:(SHHistoryInfo *)model
{
    self.iconImageView.image = [UIImage imageNamed:model.iconStr];
    self.nameLabel.text = model.nameStr;
    CGSize size = [LYGlobalDefine getTextContent:self.nameLabel.text withFont:self.nameLabel.font];
    self.nameLabel.frame = CGRectMake(self.iconImageView.right + APP_SPACE(10), self.iconImageView.top - APP_SPACE(5), size.width, size.height);
    //
    if ([model.sexStr isEqualToString:@"1"]) {
        self.bgImageView.backgroundColor = colorWith01;
        
        self.sexLabel.text=@"男";
        self.yearLabel.text =[NSString stringWithFormat:@"%@岁",model.yearStr];
    } else if ([model.sexStr isEqualToString:@"2"]){
        self.bgImageView.backgroundColor = colorWith01;
        
        self.sexLabel.text=@"女";
        self.yearLabel.text =[NSString stringWithFormat:@"%@岁",model.yearStr];;
    }
    self.bgImageView.frame = CGRectMake(self.nameLabel.right + APP_SPACE(10), self.nameLabel.top + APP_SPACE(5), APP_SPACE(35), APP_SPACE(15));
    
    self.sexLabel.frame=CGRectMake(APP_SPACE(20), APP_SPACE(10), APP_SPACE(40), APP_SPACE(40));
    //size = [LYGlobalDefine getTextContent:self.yearLabel.text withFont:self.yearLabel.font];
    //self.yearLabel.frame = CGRectMake(self.sexLabel.width + APP_SPACE(20), (self.sexLabel.height - size.height)/2, size.width, size.height);
    self.yearLabel.frame = CGRectMake(APP_SPACE(45), APP_SPACE(10), APP_SPACE(40), APP_SPACE(40));
    //
    self.contentLabel.text = model.contentStr;
    size = [LYGlobalDefine getTextContent:self.contentLabel.text withFont:self.contentLabel.font];
    self.contentLabel.frame = CGRectMake(APP_SPACE(20), self.nameLabel.bottom + APP_SPACE(10), SCREEN_WIDTH - self.nameLabel.left - APP_SPACE(10), size.height);
    self.timeLabel.text = model.timeStr;
    size = [LYGlobalDefine getTextContent:self.timeLabel.text withFont:self.timeLabel.font];
    self.timeLabel.frame = CGRectMake(APP_SPACE(20), self.contentLabel.bottom + APP_SPACE(25), size.width, size.height);
    //
    NSString *doctorStr = [NSString stringWithFormat:@"医师 : %@",model.doctorStr];
    size = [LYGlobalDefine getTextContent:doctorStr withFont:Font_Small_bold];
    self.doctorBtn.frame = CGRectMake(SCREEN_WIDTH - size.width - APP_SPACE(20), self.contentLabel.bottom + APP_SPACE(20), size.width +  APP_SPACE(10), size.height + APP_SPACE(10));
    [self.doctorBtn setTitle:doctorStr forState:UIControlStateNormal];
    
}
/**
 *  高
 */
+(CGFloat)getTableViewCellHeight;
{
    return kHistoryCellHeight;
}
@end
