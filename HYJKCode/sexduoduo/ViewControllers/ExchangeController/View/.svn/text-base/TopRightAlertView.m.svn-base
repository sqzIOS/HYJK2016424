//
//  TopRightAlertView.m
//  sexduoduo
//
//  Created by dsz on 15-3-12.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "TopRightAlertView.h"

@implementation TopRightAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)configView
{
    //性别
    if ([[UserDefaults objectForKey:@"userSex"] isEqualToString:@"男"]) {
        self.userLevelLab.textColor = [UIColor blueColor];
        self.userLevelLab.text = self.levelStr;
    
    }else
    {
        self.userLevelLab.textColor = [UIColor redColor];
        self.userLevelLab.text = self.levelStr;
    }
    
    //昵称
    self.userNameLab.text = NICKNAME;
    
    
    [self.userImageView.layer setCornerRadius:CGRectGetHeight([self.userImageView bounds]) / 2.];
    self.userImageView.layer.masksToBounds = YES;
    //然后再给图层添加一个有色的边框，类似qq空间头像那样
    self.userImageView.layer.borderWidth = 1.0;
    self.userImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    
    //头像
    self.userImageView.image=[PublicMethod getHeaderImage];
    
    // 我的消息
    if (IS_ShowMessageIcon) {
        self.numImg = [[UIImageView alloc] initWithFrame:CGRectMake(130, 5 , 17, 17)];
        [self.numImg setImage:[UIImage imageNamed:@"numBg.png"]];
        [self.huiFuLeftImageView addSubview:self.numImg];
        
        self.numLabel = [[UILabel alloc] initWithFrame:self.numImg.frame];
        self.numLabel.font = [UIFont systemFontOfSize:8.0];
        self.numLabel.textColor = WHITE_COLOR;
        self.numLabel.textAlignment = NSTextAlignmentCenter;
        self.numLabel.text = @"0";
        self.numLabel.backgroundColor = [UIColor clearColor];
        [self.huiFuLeftImageView addSubview:self.numLabel];
        
        
        NSString *bbsMessageNumStr=[UserDefaults objectForKey:@"BBSMessageNum"];
        if (bbsMessageNumStr && [bbsMessageNumStr intValue]>0) {
            self.numLabel.text=bbsMessageNumStr;
            
            self.numImg.hidden=NO;
            self.numLabel.hidden=NO;
        }else
        {
            self.numImg.hidden=YES;
            self.numLabel.hidden=YES;
        }
        
    }
    
    
}

- (IBAction)btn0Click:(id)sender {
     NSLog(@"0");
}

- (IBAction)btn1Click:(id)sender {
     NSLog(@"1");
}

- (IBAction)btn2Click:(id)sender {
     NSLog(@"2");
}

- (IBAction)btn3Click:(id)sender {
     NSLog(@"3");
}


-(IBAction)BtnClick:(id)sender
{
    //隐藏该视图
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_AlertOVER object:nil];
    switch ([(UIButton*)sender tag]) {
        case 1000://登陆
        {
            
            [self.topAlertViewDelegate topRightAlertViewButtonClick:sender];
        }
            break;
        case 1001://我的帖子
        {
            [self.topAlertViewDelegate topRightAlertViewButtonClick:sender];
            
        }
            break;
        case 1002://我的回复
        {
            [self.topAlertViewDelegate topRightAlertViewButtonClick:sender];
        }
            break;
        case 1003:
        {
            NSLog(@"积分 click");
            [self.topAlertViewDelegate topRightAlertViewButtonClick:sender];
        }
            break;
        default:
            break;
    }
}

@end
