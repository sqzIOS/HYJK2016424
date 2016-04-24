//
//  SHDCVisitMoneyView.m
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCVisitMoneyView.h"

@implementation SHDCVisitMoneyView

- (id)init
{
    self=[super init];
    if (self) {
        [self initView];
    }
    return self;
}
- (void)initView
{
    //*******************
    UILabel *oneLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    oneLabel.frame=CGRectMake(10, 6, 80, 30);
    oneLabel.text=@"图文咨询";
    oneLabel.textColor=colorWith02;
    oneLabel.font=Font_Middle;
    [self addSubview:oneLabel];
    //
    UILabel *oneMoneyLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    oneMoneyLabel.frame=CGRectMake(255, 8, 40, 25);
    oneMoneyLabel.textAlignment=NSTextAlignmentRight;
    oneMoneyLabel.text=@"30元";
    oneMoneyLabel.textColor=[UIColor redColor];
    oneMoneyLabel.font=Font_Small;
    [self addSubview:oneMoneyLabel];
    //
    UILabel *oneciLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    oneciLabel.frame=CGRectMake(295, 8, 20, 25);
    oneciLabel.textAlignment=NSTextAlignmentRight;
    oneciLabel.text=@"/次";
    oneciLabel.textColor=colorWith02;
    oneciLabel.font=Font_Small;
    [self addSubview:oneciLabel];
    //
    UIImageView *oneImage=[[UIImageView alloc]initWithFrame:CGRectZero];
    oneImage.frame=CGRectMake(0, 44, SCREEN_WIDTH, 1);
    oneImage.backgroundColor=GRAY_COLOR_TABLEVIEWLINE;
    [self addSubview:oneImage];
    //********************
    UILabel *twoLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    twoLabel.frame=CGRectMake(10, oneImage.bottom+APP_SPACE(7), 200, 30);
    twoLabel.text=@"电话咨询: 05~15分钟";
    twoLabel.textColor=colorWith02;
    twoLabel.font=Font_Middle;
    [self addSubview:twoLabel];
    //
    UILabel *twoMoneyLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    twoMoneyLabel.frame=CGRectMake(255, oneImage.bottom+APP_SPACE(8), 40, 25);
    twoMoneyLabel.textAlignment=NSTextAlignmentRight;
    twoMoneyLabel.text=@"50元";
    twoMoneyLabel.textColor=[UIColor redColor];
    twoMoneyLabel.font=Font_Small;
    [self addSubview:twoMoneyLabel];
    //
    UILabel *twociLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    twociLabel.frame=CGRectMake(295, oneImage.bottom+APP_SPACE(8), 20, 25);
    twociLabel.textAlignment=NSTextAlignmentRight;
    twociLabel.text=@"/次";
    twociLabel.textColor=colorWith02;
    twociLabel.font=Font_Small;
    [self addSubview:twociLabel];
    //
    UIImageView *twoImage=[[UIImageView alloc]initWithFrame:CGRectZero];
    twoImage.frame=CGRectMake(0, oneImage.bottom+APP_SPACE(44), SCREEN_WIDTH, 1);
    twoImage.backgroundColor=GRAY_COLOR_TABLEVIEWLINE;
    [self addSubview:twoImage];
    
    //********************
    UILabel *threeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    threeLabel.frame=CGRectMake(10, twoImage.bottom+APP_SPACE(7), 200, 30);
    threeLabel.text=@"电话咨询: 05~15分钟";
    threeLabel.textColor=colorWith02;
    threeLabel.font=Font_Middle;
    [self addSubview:threeLabel];
    //
    UILabel *threeMoneyLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    threeMoneyLabel.frame=CGRectMake(255, twoImage.bottom+APP_SPACE(8), 40, 25);
    threeMoneyLabel.textAlignment=NSTextAlignmentRight;    threeMoneyLabel.text=@"100元";
    threeMoneyLabel.textColor=[UIColor redColor];
    threeMoneyLabel.font=Font_Small;
    [self addSubview:threeMoneyLabel];
    //
    UILabel *threeciLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    threeciLabel.frame=CGRectMake(295, twoImage.bottom+APP_SPACE(8), 20, 25);
    threeciLabel.textAlignment=NSTextAlignmentRight;
    threeciLabel.text=@"/次";
    threeciLabel.textColor=colorWith02;
    threeciLabel.font=Font_Small;
    [self addSubview:threeciLabel];
    //
    UIImageView *threeImage=[[UIImageView alloc]initWithFrame:CGRectZero];
    threeImage.frame=CGRectMake(0, twoImage.bottom+APP_SPACE(44), SCREEN_WIDTH, 1);
    threeImage.backgroundColor=GRAY_COLOR_TABLEVIEWLINE;
    [self addSubview:threeImage];
    
    
    //********************
    UIImageView *btnImage=[[UIImageView alloc]initWithFrame:CGRectZero];
    btnImage.frame=CGRectMake(0, k_screenHeight - STAR_Y- 44, SCREEN_WIDTH, 1);
    btnImage.backgroundColor=colorWith04;
    [self addSubview:btnImage];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, k_screenHeight - STAR_Y -44, SCREEN_WIDTH, 44);
    [button setTitle:@"立即义诊" forState:UIControlStateNormal];
    [button setTitleColor:colorWith01 forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    

}
-(void)click
{
    //点击立即义诊按钮
}
@end
