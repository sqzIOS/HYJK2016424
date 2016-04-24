//
//  BuyNowTableViewCell.m
//  sexduoduo
//
//  Created by sqz on 14-11-27.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//

#import "BuyNowTableViewCell.h"

@implementation BuyNowTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)configCellWithArray:(NSArray *)array indexRow:(int)row
{
    NSDictionary *dic = [array objectAtIndex:row];
    self.nameLab.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"name"]];
    
    CGSize nameSize = [[dic objectForKey:@"name" ] sizeWithFont:self.nameLab.font
                                                                constrainedToSize:CGSizeMake(self.nameLab.frame.size.width, 60)
                                                                    lineBreakMode:NSLineBreakByWordWrapping];
    CGRect nameLabFrame=self.nameLab.frame;
    nameLabFrame.size.height=nameSize.height+2;
    self.nameLab.frame =nameLabFrame;
    self.nameLab.numberOfLines=2;
    
    // 现价
    self.nowPriceLab.text = [NSString stringWithFormat:@" ￥%.2f ",[[dic objectForKey:@"goods_price"] floatValue]];
    
   
    CGSize nowPriceLabSize = [[NSString stringWithFormat:@" ￥%.2f ",[[dic objectForKey:@"goods_price"] floatValue]] sizeWithFont:self.nowPriceLab.font
                                                                                                                         constrainedToSize:CGSizeMake(120, 20)
                                                                                                                             lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect nowPriceFrame=self.nowPriceLab.frame;
    nowPriceFrame.size.width=nowPriceLabSize.width;
    
    self.nowPriceLab.frame=nowPriceFrame;
    
    if (judgeUrlIsHave(dic, @"newSmallGoodsImagePath")) {
        
        // 商品图片
        [self.goodImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"newSmallGoodsImagePath"]]] placeholderImage:[UIImage imageNamed:@"bg.png"]];
    }else
    {
        // 商品图片
        [self.goodImageView sd_setImageWithURL:[PublicMethod imgWithUrl:[NSString stringWithFormat:@"%@",[dic objectForKey:@"SmallGoodsImagePath"]]] placeholderImage:[UIImage imageNamed:@"bg.png"]];
    }

    
    // 原价格
    self.oldPriceLab.text=[NSString stringWithFormat:@" ￥%.2f",[[dic objectForKey:@"marketPrice"] floatValue]];
    CGSize originalPriceLabSize = [[NSString stringWithFormat:@" ￥%.2f",[[dic objectForKey:@"marketPrice"] floatValue]] sizeWithFont:self.oldPriceLab.font
                                                                                                                                         constrainedToSize:CGSizeMake(150, 20)
                                                                                                                                             lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect oldPriceFrame=self.oldPriceLab.frame;
    oldPriceFrame.size.width=originalPriceLabSize.width+2;
    self.oldPriceLab.frame=oldPriceFrame;
    self.oldPriceLab.textColor=NAV_RED_COLOR;

    oldPriceFrame.origin.y +=10;
    oldPriceFrame.size.height=1;
    UIView *priceLine = [[UIView alloc] initWithFrame:oldPriceFrame];
    priceLine.backgroundColor = NAV_RED_COLOR;
    [self addSubview:priceLine];
    
    
    // 打几折
    self.zeKouLab.text=[NSString stringWithFormat:@"%.1f折",[[dic objectForKey:@"goods_price"] floatValue]/[[dic objectForKey:@"marketPrice"] floatValue]*10];
    
    //月销量
    self.numLab.text=[NSString stringWithFormat:@"月销量%@件",dic[@"salesVolume"]];
}
@end
