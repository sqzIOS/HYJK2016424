//
//  LYProgressView.m
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//  加载进度条

#import "LYProgressView.h"

@implementation LYProgressView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}
-(void)initView
{
    self.img_bg = [[UIImageView alloc]initWithFrame:self.bounds];
    _img_bg.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.img_bg.backgroundColor = [UIColor clearColor];
    
    self.img_bar = [[UIImageView alloc]initWithFrame:CGRectMake(1, 1, self.width-2, self.height-2)];
    _img_bar.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _img_bar.backgroundColor = colorWith01;
    
    self.lb_text = [[UILabel alloc]initWithFrame:self.bounds];
    _lb_text.backgroundColor = [UIColor clearColor];
    _lb_text.font = [UIFont systemFontOfSize:12];
    _lb_text.textColor = colorWith01;
    _lb_text.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_img_bg];
    [self addSubview:_img_bar];
    [self addSubview:_lb_text];
    
    self.progress = 0;
}

-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    int p = MAX(0,MIN(100,progress*100));
    
    if (p >= 45) {
        _lb_text.textColor = [UIColor orangeColor];
    }
    _lb_text.text = [NSString stringWithFormat:@"%d%%",p];
    self.img_bar.width = (self.width-2) * (p / 100.0);
    
}

@end
