//
//  rightTableViewCell.m
//  sexduoduo
//
//  Created by shown on 15/9/1.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "rightTableViewCell.h"

@implementation rightTableViewCell

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
        
        //上方按钮
        self.higherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.higherBtn.frame=CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
        [self.contentView addSubview:self.higherBtn];
        //分割线
        self.imaView = [[UIImageView alloc]init];
        self.imaView.backgroundColor=colorWith05;
        self.imaView.frame=CGRectMake(10, 44, 180, 1);
        [self.contentView addSubview:self.imaView];
        //下方按钮
        self.downBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.downBtn.frame=CGRectMake(0, self.contentView.frame.size.height, self.contentView.frame.size.width, self.contentView.frame.size.height);
        [self.contentView addSubview:self.downBtn];
        
    }
    return self;
}
@end
