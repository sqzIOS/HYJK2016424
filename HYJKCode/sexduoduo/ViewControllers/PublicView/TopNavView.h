//
//  TopNavView.h
//  sexduoduo
//
//  Created by dsz on 15-4-27.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopNavView : UIView
{
    UIImageView *leftImage;
}
@property (strong, nonatomic)UILabel *titleLab;
@property (strong, nonatomic)UIButton *leftBtn;
@property (strong, nonatomic)UIButton *rightBtn;

//    [rightBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];

-(void)setTitleStr:(NSString *)str;
-(void)addLeftBtnTarget:(id)target action:(SEL)selector  forControlEvents:(UIControlEvents)controlEvents;
-(void)addRightBtnTarget:(id)target action:(SEL)selector forControlEvents:(UIControlEvents)controlEvents;

@end
