//
//  SHCasesTableHeaderView.h
//  sexduoduo
//
//  Created by shown on 15/9/6.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHCasesTableHeaderView : UIView
//性别
@property (nonatomic,strong)UILabel *sexLabel;
//年龄
@property (nonatomic,strong)UILabel *ageLabel;
//医师头像
@property (nonatomic,strong)UIImageView *headerImageVC;
//医师姓名
@property (nonatomic,strong)UILabel *nameLabel;
//问题描述
@property (nonatomic,strong)UILabel *problemlabel;
//内容
@property (nonatomic,strong)UILabel *contentLabel;

-(id)init;
@end