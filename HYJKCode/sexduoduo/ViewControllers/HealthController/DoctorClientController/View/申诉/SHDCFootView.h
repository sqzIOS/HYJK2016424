//
//  SHDCFootView.h
//  sexduoduo
//
//  Created by shown on 15/9/23.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDCFootView : UIView

@property (nonatomic,strong)UILabel *onedetailLabel;
@property (nonatomic,strong)UILabel *twodetailLabel;
@property (nonatomic,strong)UILabel *threedetailLabel;
@property (nonatomic,strong)UIButton *oneBtn;
@property (nonatomic,strong)UIButton *twoBtn;
@property (nonatomic,strong)UIButton *threeBtn;

//选择后上传的信息
@property (nonatomic,strong)NSString *str;

- (id)init;


@end
