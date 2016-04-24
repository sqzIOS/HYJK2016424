//
//  SHDiagnoseCaseCell.m
//  sexduoduo
//
//  Created by shown on 15/9/2.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDiagnoseCaseCell.h"

@implementation SHDiagnoseCaseCell

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
        //可能患病的结果
        self.caseLabel=[[UILabel alloc]init];
        self.caseLabel.frame=CGRectMake(10,5, 140, 33);
        [self.contentView addSubview:self.caseLabel];
        //箭头图片
        self.imaView = [[UIImageView alloc]init];
        self.imaView.frame = CGRectMake(self.contentView.frame.size.width-30,12, 15, 24);
        self.imaView.image=[UIImage imageNamed:@"health_next"];
        [self.contentView addSubview:self.imaView];
    }
    return self;
}
@end
