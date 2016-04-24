//
//  SHDCHeadView.m
//  sexduoduo
//
//  Created by shown on 15/9/21.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCHeadView.h"

@implementation SHDCHeadView

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
    self.backgroundColor=[UIColor whiteColor];
    
    UILabel *zeroLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 54, 100, 50)];
    zeroLabel.text=@"申诉理由";
    zeroLabel.font=Font_Large_bold;
    zeroLabel.textColor=colorWith02;
    [self addSubview:zeroLabel];
    
    UIImageView *BGImage=[[UIImageView alloc]initWithFrame:CGRectMake(APP_SPACE(10), APP_SPACE(100), SCREEN_WIDTH-APP_SPACE(20), APP_SPACE(80))];
    BGImage.image=[UIImage imageNamed:@"wenbenkuang.png"];
    BGImage.userInteractionEnabled=YES;
    [self addSubview:BGImage];
    
    
    UITextView*_textView = [[UITextView alloc]initWithFrame:CGRectMake(APP_SPACE(10), APP_SPACE(100), SCREEN_WIDTH - APP_SPACE(20), APP_SPACE(80))];
    _textView.backgroundColor = colorWithClear;
    _textView.textColor = colorWith02;
    _textView.font = Font_ExtraLarge;
    _textView.delegate=self;
    [self addSubview:_textView];
    
}


@end
