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
        
        
        self.btn=[UIButton buttonWithType:0];
        self.btn.frame=CGRectMake(0, 0, frame.size.width, frame.size.height);//66
        [self.btn setImage:UIImageByName(@"goTopView") forState:0];
        [self addSubview:self.btn];
    
    }
    return self;
}


-(void)addTarget:(id)target aciton:(SEL) select forControlEvents:(UIControlEvents)event
{
    [self.btn addTarget:target action:select forControlEvents:event];
}


@end
