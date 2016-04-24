//
//  NoNetworkView.m
//  sexduoduo
//
//  Created by dsz on 15-4-14.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "NoNetworkView.h"

@implementation NoNetworkView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithDelegate:(id)delegate
{
    if (self=[super init]) {
        self.delegate=delegate;
        
        self.backgroundColor=[UIColor whiteColor];
        
        
    }
    return self;
}

- (IBAction)refreshDataAgain:(id)sender
{
    NSLog(@"重新加载");
    
    if ([self.delegate respondsToSelector:@selector(noNetworkViewRefreshBtnClick)]) {
        [self.delegate noNetworkViewRefreshBtnClick];
    }
    
}



@end
