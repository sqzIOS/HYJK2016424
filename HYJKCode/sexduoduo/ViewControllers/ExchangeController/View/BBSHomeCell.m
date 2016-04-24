//
//  BBSHomeCell.m
//  sexduoduo
//
//  Created by dsz on 15-1-22.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "BBSHomeCell.h"

@implementation BBSHomeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configCellWithArray:(NSArray *)array indexRow:(int)row
{
    self.indexRow=row;
    
    //占个位置
    UIImage *image=[UIImage imageNamed:[NSString stringWithFormat:@"plate_0"]];
    [self.imageView setImage:image];
    self.imageView.hidden=YES;
    

    
    // 左边图片
    UIImageView *imageView=self.headImageView;
    NSURL *url=[PublicMethod bbsImgURlWithStr:array[row][@"logo"]];
    [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"bg.png"]];
    
    
    //标题
    self.textLabel.text = [[array objectAtIndex:row] objectForKey:@"title"];
    self.textLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    self.textLabel.font =[UIFont systemFontOfSize:15.0];
    
    //描述
    self.detailTextLabel.text = [[array objectAtIndex:row] objectForKey:@"description"];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.0];
    self.detailTextLabel.textColor = [UIColor lightGrayColor];
    self.detailTextLabel.numberOfLines = 3;


    self.accessoryView=self.addBtn;

}



- (IBAction)addBtnClick:(id)sender
{
    [self.delegate addBtnClickWithIndexRow:self.indexRow];
    
    
}


- (IBAction)minBtnClick:(id)sender {
    
    [self.delegate minBtnClickWithIndexRow:self.indexRow];
}



@end
