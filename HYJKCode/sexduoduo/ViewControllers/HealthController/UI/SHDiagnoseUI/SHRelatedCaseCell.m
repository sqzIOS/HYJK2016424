//
//  SHRelatedCaseCell.m
//  sexduoduo
//
//  Created by shown on 15/9/2.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHRelatedCaseCell.h"

@implementation SHRelatedCaseCell

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
        
        self.sexLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 40, 20)];
        self.sexLabel.backgroundColor=CLEAR_COLOR;
        self.sexLabel.font = [UIFont fontWithName:k_Font size:14];
        [self.contentView addSubview:self.sexLabel];
        
        self.ageLabel=[[UILabel alloc]initWithFrame:CGRectMake(45, 5, 50, 20)];
        self.ageLabel.backgroundColor=CLEAR_COLOR;
        self.ageLabel.font = [UIFont fontWithName:k_Font size:14];
        [self.contentView addSubview:self.ageLabel];
        
//        self.headerImageVC=[[UIImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width-80, 5, 40, 40)];
//        self.headerImageVC.backgroundColor=[UIColor redColor];
//        [self.contentView addSubview:self.headerImageVC];
        
        self.problemlabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 45, 100, 20)];
        self.problemlabel.backgroundColor=CLEAR_COLOR;
        self.problemlabel.font = [UIFont fontWithName:k_Font size:14];
        self.problemlabel.text =@"问题描述";
        [self.contentView addSubview:self.problemlabel];
        
//        self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width-120, 45, 120, 20)];
//        self.nameLabel.backgroundColor=CLEAR_COLOR;
//        self.nameLabel.textAlignment = NSTextAlignmentCenter;
//        self.nameLabel.text=@"医师名称";
//        [self.contentView addSubview:self.nameLabel];
        
        //背景框
        textBoxImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 70, self.contentView.frame.size.width-20, 80)];
        UIImage *image = UIImageByName(@"health_BingQing_textBox");
        // 设置图片可以拉伸
        image = [image setImageCanStretch];
        textBoxImageView.image = image;
        [self.contentView addSubview:textBoxImageView];

        
        self.contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(14, 78, k_screenWidth-28, 80 - 8 - 5)];
        self.contentLabel.backgroundColor=CLEAR_COLOR;
        self.contentLabel.font = [UIFont fontWithName:k_Font size:14];
        self.contentLabel.numberOfLines = 0;
        [self.contentView addSubview:self.contentLabel];
        
    }
    return self;
}

-(void)setContentLabelStr:(NSString *)str
{
    self.contentLabel.text = str;
    
    CGSize size=[NSString getTextMultilineContent:str withFont:self.contentLabel.font withSize:CGSizeMake(self.contentLabel.width, 1000)];
    self.contentLabel.height = size.height;
    
    textBoxImageView.height = size.height + 8 + 5 ;
    

}


+(CGFloat )heightOfCellWithContentStr:(NSString *)str
{
    CGSize size=[NSString getTextMultilineContent:str withFont:[UIFont fontWithName:k_Font size:14] withSize:CGSizeMake(k_screenWidth-28, 1000)];
    
    
    return size.height + 78  + 5 + 10;//距离底部背景框5 + 空白10
}

@end
