//
//  SHDCVisitTimeHeadView.m
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCVisitTimeHeadView.h"

@implementation SHDCVisitTimeHeadView

- (id)init
{
    self=[super init];
    if (self) {
        [self initViewAndData];
    }
    return self;
}
- (void)initViewAndData
{
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectZero];
    label.frame=CGRectMake(APP_SPACE(10), APP_SPACE(11), 70, 20);
    label.textColor=colorWith01;
    label.font=Font_Middle_bold;
    [self addSubview:label];
    
    self.timeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.timeLabel.frame=CGRectMake(label.right+APP_SPACE(10), APP_SPACE(16), k_screenWidth-label.right -40, 15);
    self.timeLabel.textColor=colorWith01;
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.font=Font_Small;
    [self addSubview:self.timeLabel];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(APP_SPACE(280), APP_SPACE(0), 20, 40);
    [button addTarget:self action:@selector(dc_section_click) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    //上方按钮的图片时错误的，需要修改。
    
    //边框线
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectZero];
    image.frame=CGRectMake(0, APP_SPACE(44), SCREEN_WIDTH, 1);
    image.backgroundColor=GRAY_COLOR_TABLEVIEWLINE;
    [self addSubview:image];
    
/**********
    数据
 **********/
    label.text=@"特别设定";
    self.timeLabel.text=@"07月10日 周五";
    [button setImage:[UIImage imageNamed:@"health_navBack@2x"] forState:UIControlStateNormal];
    
}
- (void)dc_section_click
{
    //特别设定  按钮
}
@end
