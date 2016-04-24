//
//  SHDCPictureText.h
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHDCPictureText : NSObject
@property (nonatomic,strong)NSString *headImageStr;

@property (nonatomic,strong)NSString *sexImageStr;

@property (nonatomic,strong)NSString *ageStr;

@property (nonatomic,strong)NSString *contentStr;

@property (nonatomic,strong)NSString *timeStr;
//抢答
@property (nonatomic,strong)NSString *answerStr;
//已完成
@property (nonatomic,strong)NSString *completeStr;

- (id)init;
@end
