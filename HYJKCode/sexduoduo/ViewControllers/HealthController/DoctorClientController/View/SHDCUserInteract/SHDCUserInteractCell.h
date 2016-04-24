//
//  SHDCUserInteractCell.h
//  sexduoduo
//
//  Created by shown on 15/9/17.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSHCopeCellHeight APP_SPACE(70)

@interface SHDCUserInteractCell : UITableViewCell
//内容
@property (nonatomic,strong)UILabel *contentLabel;
//楼数
@property (nonatomic,strong)UILabel *floorlabel;
//时间
@property (nonatomic,strong)UILabel *timeLabel;
//医师;或是匿名.
@property (nonatomic,strong)UILabel *namelabel;
//回复
@property (nonatomic,strong)UILabel *seeLabel;



@end
