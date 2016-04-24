//
//  CalenderCell.h
//  LCT_Calendar
//
//  Created by shown on 16/1/7.
//  Copyright (c) 2016年 shown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalenderModel.h"

#define IDENTIFY @"CalenderCell"

@interface CalenderCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayStr;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end
