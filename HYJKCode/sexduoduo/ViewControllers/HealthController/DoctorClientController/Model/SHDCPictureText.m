//
//  SHDCPictureText.m
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCPictureText.h"

@implementation SHDCPictureText

-(id)init
{
    self=[super init];
    if (self) {
        NSString *ageStr=[NSString stringWithFormat:@"23岁"];
        self.ageStr=ageStr;
        self.contentStr=[NSString stringWithFormat:@"你是上帝派来的一头猪嘛你是上帝派来的一头猪嘛你是上帝派来的一头猪嘛"];
        self.timeStr=[NSString stringWithFormat:@"09-17-14:23"];
        self.answerStr=[NSString stringWithFormat:@"抢答"];
        self.completeStr=[NSString stringWithFormat:@"未完成"];
    }
    return self;
}


@end
