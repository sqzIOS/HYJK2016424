//
//  SHHealthButton.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHHealthButton : UIButton
//图标
@property (nonatomic,strong) UIImageView *iconImageView;
//角标
@property (nonatomic,strong) UIImageView *rightIconImageView;
//名称
@property (nonatomic,strong) UILabel *nameLabel;
//标题
@property (nonatomic,strong) UILabel *useLabel;
//内容
@property (nonatomic,strong) UILabel *contentLabel;

@end

