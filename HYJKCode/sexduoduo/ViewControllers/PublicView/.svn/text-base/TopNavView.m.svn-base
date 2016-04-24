//
//  TopNavView.m
//  sexduoduo
//
//  Created by dsz on 15-4-27.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "TopNavView.h"

@implementation TopNavView
@synthesize titleLab,leftBtn,rightBtn;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        UIView *topImgv = [[UIView alloc]init];
        topImgv.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        topImgv.backgroundColor = NAV_COLOR;
        [self addSubview:topImgv];
        
        titleLab = [[UILabel alloc] initWithFrame:CGRectMake(50, 30, SCREEN_WIDTH - 100, 21)];
        titleLab.backgroundColor = [UIColor clearColor];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.textColor = NAV_RED_COLOR;
        titleLab.font = [UIFont systemFontOfSize:20.0];
        [topImgv addSubview:titleLab];
        titleLab.hidden=YES;
        
        
        leftImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20+7, 30, 30)];
        leftImage.image=UIImageByName(@"toBack.png");
        leftImage.hidden=YES;
        [topImgv addSubview:leftImage];
        
        UILabel *leftLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 40, 30)];
        leftLab.backgroundColor = [UIColor clearColor];
        leftLab.text=@"返回";
        leftLab.textAlignment = NSTextAlignmentCenter;
        leftLab.textColor = NAV_RED_COLOR;
        leftLab.font = [UIFont systemFontOfSize:18.0];
        [leftImage addSubview:leftLab];
        
        leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(0, 20, 60, 44);
        leftBtn.backgroundColor=CLEAR_COLOR;
        leftBtn.hidden=YES;
        [topImgv addSubview:leftBtn];
        
        rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(SCREEN_WIDTH - 42, 25 , 32, 32);
        rightBtn.hidden=YES;
        [rightBtn setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
        [topImgv addSubview:rightBtn];
        
//        UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height - 10, frame.size.width, 10)];
//        [lineImg setImage:[UIImage imageNamed:@"topLine.png"]];
//        lineImg.backgroundColor = [UIColor clearColor];
//        [topImgv addSubview:lineImg];
        
        UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height - 0.5, frame.size.width, 0.5)];
        lineImg.backgroundColor = UICOLOR_RGB(200, 200, 200);
        [topImgv addSubview:lineImg];
    }
    
    return self;
}


-(void)setTitleStr:(NSString *)str
{
    titleLab.text=str;
    titleLab.hidden=NO;
}

-(void)addLeftBtnTarget:(id)target action:(SEL)selector forControlEvents:(UIControlEvents)controlEvents
{
    leftImage.hidden=NO;
    leftBtn.hidden=NO;
    [leftBtn addTarget:target action:selector forControlEvents:controlEvents];
}
-(void)addRightBtnTarget:(id)target action:(SEL)selector forControlEvents:(UIControlEvents)controlEvents
{
    rightBtn.hidden=NO;
    [rightBtn addTarget:target action:selector forControlEvents:controlEvents];
}


@end
