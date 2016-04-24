//
//  GoTopView.m
//  sexduoduo
//
//  Created by dsz on 15-4-24.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "GoTopView.h"

@implementation GoTopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        
//        self.layer.cornerRadius=frame.size.height/2.;
//        self.layer.masksToBounds=YES;
//        self.layer.borderColor=[UICOLOR_RGB(233,233,233) CGColor];
//        self.layer.borderWidth=3;
//        
//        self.backgroundColor=UICOLOR_RGB(253,113,163);
        
        
        self.distanceByBottom = 60;
        
        
        self.btn=[UIButton buttonWithType:0];
        self.btn.frame=CGRectMake(0, 0, frame.size.width, frame.size.height);//66
        [self.btn setImage:UIImageByName(@"goTopView") forState:0];
        [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn];
    
    }
    return self;
}


-(void)addTarget:(id)target aciton:(SEL) select forControlEvents:(UIControlEvents)event
{
    [self.btn addTarget:target action:select forControlEvents:event];
}

//滚动到顶端
-(void)btnClick:(id)sender
{
    if (self.targetScrollView) {
         [self.targetScrollView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    }
}
//返回顶端的按钮 3
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
        
    
    if(scrollView.contentOffset.y>0)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame=CGRectMake(SCREEN_WIDTH-60, SCREEN_HEIGHT-self.distanceByBottom, 44, 44);
        }];
    }else
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame=CGRectMake(SCREEN_WIDTH-60, SCREEN_HEIGHT, 44, 44);
        }];
    }
}

@end
