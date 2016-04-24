//
//  SHProblemDetailCell.m
//  SexHealth
//
//  Created by ly1992 on 15/7/1.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHProblemDetailCell.h"

@implementation SHProblemDetailCell

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
        self.contentView.backgroundColor = colorWith05;
        //
        self.bgView = [[UIView alloc]initWithFrame:CGRectZero];
        self.bgView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.bgView];
        //
        self.lineTopImageView = [UIImageView imageViewLineWithX:0 withY:0 withWidth:SCREEN_WIDTH withHeight:1];
        [self.bgView addSubview:self.lineTopImageView];
        //
        self.lineImageView = [[UIImageView alloc]init];
        self.lineImageView.backgroundColor = colorWith05;
        self.lineImageView.size = CGSizeMake(SCREEN_WIDTH, 1);
        [self.bgView addSubview:self.lineImageView];
        //
        self.lineBottomImageView= [UIImageView imageViewLineWithX:0 withY:0 withWidth:SCREEN_WIDTH withHeight:1];
        [self.bgView addSubview:self.lineBottomImageView];
        //
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.font = Font_Large;
        self.contentLabel.textColor = colorWith02;
        self.contentLabel.numberOfLines = 0;
        [self.bgView addSubview:self.contentLabel];
        //
        self.topLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.topLabel.backgroundColor = [UIColor clearColor];
        self.topLabel.font = Font_Large;
        self.topLabel.textColor = colorWith02;
        [self.bgView addSubview:self.topLabel];
        //
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.font = Font_Middle;
        self.timeLabel.textColor = colorWith03;
        [self.bgView addSubview:self.timeLabel];
        //
        self.replyLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.replyLabel.backgroundColor = [UIColor clearColor];
        self.replyLabel.font = Font_Small;
        self.replyLabel.textColor = colorWith04;
        [self.bgView addSubview:self.replyLabel];
    }
    return self;
    
}

- (void)initTableCellModel:(SHCommentInfo *)model
{
    self.bgView.top = APP_SPACE(10);
    self.lineTopImageView.origin = CGPointMake(0, 0);
    self.contentLabel.text = model.contentStr;
    CGSize size = [LYGlobalDefine getTextMultilineContent:self.contentLabel.text withFont:self.contentLabel.font withSize:CGSizeMake(SCREEN_WIDTH - APP_SPACE(40), SCREEN_HEIGHT)];
    self.contentLabel.frame = CGRectMake(APP_SPACE(20), APP_SPACE(10), size.width, size.height);
    self.lineImageView.origin = CGPointMake(0, self.contentLabel.bottom + APP_SPACE(10));
    NSString *topStr = [NSString stringWithFormat:@"%@楼",model.topStr];
    self.topLabel.text = topStr;
    size = [LYGlobalDefine getTextContent:self.topLabel.text withFont:self.topLabel.font];
    self.topLabel.frame = CGRectMake(APP_SPACE(20),self.lineImageView.bottom + APP_SPACE(10), size.width, size.height);
    self.timeLabel.text = model.timeStr;
    size = [LYGlobalDefine getTextContent:self.timeLabel.text withFont:self.timeLabel.font];
    self.timeLabel.frame = CGRectMake(self.topLabel.right + APP_SPACE(40),self.topLabel.top, size.width, size.height);
    NSString *replyStr = [NSString stringWithFormat:@"%@回复",model.replyStr];
    self.replyLabel.text = replyStr;
    [LYGlobalDefine setLableText:self.replyLabel attribute:model.replyStr instr:self.replyLabel.text withColor:colorWith01];
    size = [LYGlobalDefine getTextContent:self.replyLabel.text withFont:self.replyLabel.font];
    self.replyLabel.frame = CGRectMake(SCREEN_WIDTH - size.width - APP_SPACE(20),self.topLabel.top, size.width, size.height);
    self.lineBottomImageView.origin = CGPointMake(0, self.topLabel.bottom + APP_SPACE(10));
    self.bgView.frame = CGRectMake(0, APP_SPACE(10), SCREEN_WIDTH, self.topLabel.bottom + APP_SPACE(10));
    
}

+(CGFloat)getTableViewCellModel:(SHCommentInfo *)model
{
    UILabel *label = [[UILabel alloc]init];
    label.font = Font_Large;
    label.textColor = colorWith02;
    label.numberOfLines = 0;
    CGSize size = [LYGlobalDefine getTextMultilineContent:label.text withFont:label.font withSize:CGSizeMake(SCREEN_WIDTH - APP_SPACE(40), SCREEN_HEIGHT)];
    return size.height + APP_SPACE(95);
}
@end
