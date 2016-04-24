//
//  SHDCOrderPhoView.h
//  sexduoduo
//
//  Created by shown on 15/9/22.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDCOrderPhoView : UIView

//预约去电时间
@property (nonatomic,strong)UILabel *electricLabel;
//修改时间
@property (nonatomic,strong)UIButton *modifyBtn;
//时间
@property (nonatomic,strong)UILabel *dayLabel;

-(id)init;


@end
