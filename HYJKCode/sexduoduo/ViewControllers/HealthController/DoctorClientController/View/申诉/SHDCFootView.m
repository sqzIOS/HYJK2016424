//
//  SHDCFootView.m
//  sexduoduo
//
//  Created by shown on 15/9/23.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCFootView.h"

@implementation SHDCFootView

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
    _oneBtn=[[UIButton alloc]initWithFrame:CGRectZero];
    _oneBtn.frame=CGRectMake(APP_SPACE(20), APP_SPACE(20), 20, 20);
    _oneBtn.tag=1000;
    _oneBtn.layer.borderWidth=1.0;
    _oneBtn.layer.borderColor=[[UIColor grayColor]CGColor];
    [_oneBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_oneBtn];
    
    _onedetailLabel=[[UILabel alloc]init];
    _onedetailLabel.frame=CGRectMake(_oneBtn.right+APP_SPACE(10), APP_SPACE(20), 200, 20);
    _onedetailLabel.text=@"不是我的科室范围";
    _onedetailLabel.font=Font_Middle;
    _onedetailLabel.textColor=colorWith04;
    [self addSubview:_onedetailLabel];
    
    
    _twoBtn=[[UIButton alloc]initWithFrame:CGRectZero];
    _twoBtn.frame=CGRectMake(APP_SPACE(20), _oneBtn.bottom+APP_SPACE(20), 20, 20);
    _twoBtn.tag=1001;
    _twoBtn.layer.borderWidth=1.0;
    _twoBtn.layer.borderColor=[[UIColor grayColor]CGColor];
    
    [_twoBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_twoBtn];
    
    _twodetailLabel=[[UILabel alloc]init];
    _twodetailLabel.frame=CGRectMake(_twoBtn.right+APP_SPACE(10), _oneBtn.bottom+APP_SPACE(20), 200, 20);
    _twodetailLabel.text=@"难度大,没见过";
    _twodetailLabel.font=Font_Middle;
    _twodetailLabel.textColor=colorWith04;
    
    [self addSubview:_twodetailLabel];
    
    _threeBtn=[[UIButton alloc]initWithFrame:CGRectZero];
    _threeBtn.frame=CGRectMake(APP_SPACE(20), _twoBtn.bottom+APP_SPACE(20), 20, 20);
    _threeBtn.tag=1002;
    _threeBtn.layer.borderWidth=1.0;
    _threeBtn.layer.borderColor=[[UIColor grayColor]CGColor];
    
    [_threeBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_threeBtn];
    
    _threedetailLabel=[[UILabel alloc]init];
    _threedetailLabel.frame=CGRectMake(_threeBtn.right+APP_SPACE(10), _twoBtn.bottom+APP_SPACE(20), 200, 20);
    _threedetailLabel.font=Font_Middle;
    _threedetailLabel.textColor=colorWith04;
    
    _threedetailLabel.text=@"没见过,太难了";
    [self addSubview:_threedetailLabel];
    
}
- (void)click:(UIButton *)sender
{
    if (sender.tag==1000)
    {
        _oneBtn.backgroundColor=[UIColor redColor];
        [_oneBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _str=_onedetailLabel.text;
        
        _twoBtn.backgroundColor=[UIColor clearColor];
        
        _threeBtn.backgroundColor=[UIColor clearColor];
        NSLog(@"1%@",_str);
    }
    else if (sender.tag==1001)
    {
        _oneBtn.backgroundColor=[UIColor clearColor];
        
        _twoBtn.backgroundColor=[UIColor redColor];
        [_twoBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _str=_twodetailLabel.text;
        
        _threeBtn.backgroundColor=[UIColor clearColor];
        NSLog(@"2%@",_str);
        
    }
    else if(sender.tag==1002)
    {
        _oneBtn.backgroundColor=[UIColor clearColor];
        
        _twoBtn.backgroundColor=[UIColor clearColor];
        
        _threeBtn.backgroundColor=[UIColor redColor];
        [_twoBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _str=_threedetailLabel.text;
        NSLog(@"3%@",_str);
        
        
    }
}

@end
