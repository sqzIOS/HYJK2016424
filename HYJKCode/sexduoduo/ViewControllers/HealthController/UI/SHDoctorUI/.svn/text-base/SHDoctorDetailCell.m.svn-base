//
//  SHDoctorDetailCell.m
//  SexHealth
//
//  Created by ly1992 on 15/7/2.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHDoctorDetailCell.h"

@implementation SHDoctorDetailCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

//医师详情
+(void)doctorDetailCell:(SHDoctorDetailCell*)cell withModel:(SHDoctorCommentInfo*)info
{
    [cell.contentView removeAllSubviews];
    CGFloat lastBottom = 0;
    //登陆用户
    UILabel *userLabel = [[UILabel alloc]init];
    userLabel.backgroundColor = [UIColor clearColor];
    userLabel.textColor = colorWith02;
    userLabel.font = Font_Middle;
    userLabel.text = info.logonStr;
    CGSize size = [LYGlobalDefine getTextContent:userLabel.text withFont:userLabel.font];
    userLabel.frame = CGRectMake(APP_SPACE(15), APP_SPACE(10), size.width, size.height);
    [cell.contentView addSubview:userLabel];
    lastBottom += APP_SPACE(10) + size.height;
    //
    UILabel *commentLabel = [[UILabel alloc]init];
    commentLabel.backgroundColor = [UIColor clearColor];
    commentLabel.textColor = [UIColor redColor];
    commentLabel.font = Font_Middle;
    commentLabel.text = info.commentStr;
    size = [LYGlobalDefine getTextContent:commentLabel.text withFont:commentLabel.font];
    commentLabel.frame = CGRectMake(userLabel.right + APP_SPACE(10), userLabel.top, size.width, size.height);
    [cell.contentView addSubview:commentLabel];
    //
    for (int i = 0; i< info.list.count; i++) {
        NSInteger low = i/2;
        NSInteger row = i%2;
        NSString *comStr = info.list[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor clearColor];
        btn.frame = CGRectMake(APP_SPACE(15) + SCREEN_WIDTH/2 * row, userLabel.bottom + APP_SPACE(10) + (APP_SPACE(35) + APP_SPACE(10)) * low, SCREEN_WIDTH/2 - APP_SPACE(30), APP_SPACE(35));
        btn.layer.cornerRadius = 4.0f;
        btn.layer.masksToBounds = YES;
        btn.layer.borderColor = colorWith04.CGColor;
        btn.layer.borderWidth = 1.0f;
        btn.titleLabel.font = Font_Small;
        [btn setTitle:comStr forState:UIControlStateNormal];
        [btn setTitleColor:colorWith04 forState:UIControlStateNormal];
        [cell.contentView addSubview:btn];
        
    }
    NSInteger low = info.list.count % 2;
    lastBottom +=  APP_SPACE(40) + (APP_SPACE(35) + APP_SPACE(10)) * low;
    UIImageView *lineImageView = [UIImageView imageViewLineWithX:0 withY:lastBottom + APP_SPACE(10) withWidth:SCREEN_WIDTH withHeight:1];
    [cell.contentView addSubview:lineImageView];
}

+(CGFloat)doctorDetailCellHeightWithModel:(SHDoctorCommentInfo*)info;
{
    CGFloat lastBottom = 0;
    //登陆用户
    UILabel *userLabel = [[UILabel alloc]init];
    userLabel.textColor = colorWith02;
    userLabel.font = Font_Middle;
    userLabel.text = info.logonStr;
    CGSize size = [LYGlobalDefine getTextContent:userLabel.text withFont:userLabel.font];
    lastBottom += APP_SPACE(10) + size.height;
    //
    NSInteger low = info.list.count % 2;
    lastBottom +=  APP_SPACE(40) + (APP_SPACE(35) + APP_SPACE(10)) * low;
    lastBottom += APP_SPACE(10);
    return lastBottom;
}

@end
