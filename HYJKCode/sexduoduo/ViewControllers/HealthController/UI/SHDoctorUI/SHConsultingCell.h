//
//  SHConsultingCell.h
//  sexduoduo
//
//  Created by shown on 15/9/28.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SHConsulting;

@interface SHConsultingCell : UITableViewCell
- (void)loadWithConsult:(SHConsulting *)consult;
+ (CGFloat)getCellHeight;
@end
