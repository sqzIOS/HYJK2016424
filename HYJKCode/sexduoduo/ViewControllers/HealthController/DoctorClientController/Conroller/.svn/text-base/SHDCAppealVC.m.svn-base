//
//  SHDCAppealVC.m
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  申诉

#import "SHDCAppealVC.h"

@interface SHDCAppealVC ()

//@property (nonatomic,strong)UITextView *textView;

@end

@implementation SHDCAppealVC

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self initView];
    
    [self setTopNavView];
}

#pragma  mark ---UI
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
    
    
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"申诉";
    [navView addSubview:titleImgV];
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    leftBtn.tag=1000;
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_Nav_left) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
    
    //
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame=CGRectMake(navView.frame.size.width-64, 30, 54, 24);
    rightBtn.backgroundColor=colorWith01;
    rightBtn.layer.cornerRadius=10.0;
    rightBtn.tag=1001;
    [rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(bt_Nav_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:rightBtn];
 
}
- (void)initView
{
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel *zeroLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 54, 100, 50)];
    zeroLabel.text=@"申诉理由";
    zeroLabel.font=Font_Large_bold;
    zeroLabel.textColor=colorWith02;
    [self.view addSubview:zeroLabel];
    
    UIImageView *BGImage=[[UIImageView alloc]initWithFrame:CGRectMake(APP_SPACE(10), APP_SPACE(100), SCREEN_WIDTH-APP_SPACE(20), APP_SPACE(150))];
    BGImage.image=[UIImage imageNamed:@"wenbenkuang.png"];
    BGImage.userInteractionEnabled=YES;
    [self.view addSubview:BGImage];

    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(APP_SPACE(10), APP_SPACE(100), SCREEN_WIDTH - APP_SPACE(20), APP_SPACE(150))];
    _textView.backgroundColor = colorWithClear;
    _textView.textColor = colorWith02;
    _textView.font = Font_ExtraLarge;
    _textView.delegate=self;
    [self.view addSubview:_textView];
    //输入框--内容
    
    _label=[[UILabel alloc]initWithFrame:CGRectMake(5,0,_textView.frame.size.width-APP_SPACE(5),60)];
    _label.enabled=NO;
    _label.text = @"请详细描述你的问题，客服会尽快与你取得联系，并处理争议";
    _label.numberOfLines =3;
    _label.lineBreakMode =NSLineBreakByCharWrapping;
    _label.font =  [UIFont systemFontOfSize:15];
    [_textView addSubview:_label];
}
- (void)textViewDidChange:(UITextView *)textView
{
    _label.text=nil;
}
- (void)bt_Nav_left
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bt_Nav_right
{
    
}
@end
