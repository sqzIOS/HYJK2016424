//
//  SHTreatmentView.m
//  sexduoduo
//
//  Created by shown on 15/9/6.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHTreatmentView.h"

@implementation SHTreatmentView

-(id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        [self initView];
        
    }
    return self;
}
#pragma mark - UI
- (void)initView
{
    //可能患病的结果
    self.resultLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.resultLabel.frame=CGRectMake(10, 10, 80, 40);
    self.resultLabel.textColor=colorWith02;
    [self addSubview:self.resultLabel];
    //分割线
    UIImageView *image1=[[UIImageView alloc]initWithFrame:CGRectZero];
    image1.frame=CGRectMake(0, 54, SCREEN_WIDTH, 1);
    image1.backgroundColor=colorWith05;
    [self addSubview:image1];
    //患病结果详情
    self.resultDetailTextView=[[UITextView alloc]initWithFrame:CGRectZero];
    self.resultDetailTextView.frame=CGRectMake(10, 65, SCREEN_WIDTH-20, 100);
    self.resultDetailTextView.layer.cornerRadius=10;
    self.resultDetailTextView.backgroundColor=[UIColor whiteColor];
    self.resultDetailTextView.layer.cornerRadius=10;
    self.resultDetailTextView.layer.borderWidth=1;
    self.resultDetailTextView.layer.borderColor=[[UIColor colorWithRed:222/255.0f green:222/255.0f blue:222/255.0f alpha:1]CGColor];
    self.resultDetailTextView.font = Font_Middle;
    self.resultDetailTextView.textColor = colorWith03;
    [self addSubview:self.resultDetailTextView];
    //分割线
    UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectZero];
    image2.frame=CGRectMake(0, 175, SCREEN_WIDTH, 1);
    image2.backgroundColor=colorWith05;
    [self addSubview:image2];
    //治疗建议
    self.adviceLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.adviceLabel.frame=CGRectMake(10, 185, 100, 40);
    self.adviceLabel.textColor=colorWith02;
    [self addSubview:self.adviceLabel];
    //分割线
    UIImageView *image3=[[UIImageView alloc]initWithFrame:CGRectZero];
    image3.frame=CGRectMake(0, 235, SCREEN_WIDTH, 1);
    image3.backgroundColor=colorWith05;
    [self addSubview:image3];
    //治疗建议详情
    self.adviceDetailTextView=[[UITextView alloc]initWithFrame:CGRectZero];
    self.adviceDetailTextView.frame=CGRectMake(10, 246, SCREEN_WIDTH-20, 180);
    self.adviceDetailTextView.backgroundColor=[UIColor whiteColor];
    self.adviceDetailTextView.layer.cornerRadius=10;
    self.adviceDetailTextView.layer.borderWidth=1;
    self.adviceDetailTextView.font = Font_Middle;
    self.adviceDetailTextView.textColor = colorWith03;
    self.adviceDetailTextView.layer.borderColor=[[UIColor colorWithRed:222/255.0f green:222/255.0f blue:222/255.0f alpha:1]CGColor];
    self.adviceDetailTextView.textAlignment = NSTextAlignmentNatural;
    [self addSubview:self.adviceDetailTextView];
    //分割线
    UIImageView *image4=[[UIImageView alloc]initWithFrame:CGRectZero];
    image4.frame=CGRectMake(0, 356+80, SCREEN_WIDTH, 1);
    image4.backgroundColor=colorWith05;
    [self addSubview:image4];
    [self initData];
}
#pragma mark - 数据
- (void)initData
{
    self.resultLabel.text=@"你是🐷吗";
    self.adviceLabel.text=@"治疗建议";
    self.resultDetailTextView.text=@"你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗";
    self.adviceDetailTextView.text=@"你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗";
}

@end
