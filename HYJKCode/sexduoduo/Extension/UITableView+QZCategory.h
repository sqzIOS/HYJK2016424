//
//  UITableView+QZCategory.h
//  sexduoduo
//
//  Created by showm on 15/9/14.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (QZCategory)


-(void)setLineZero;

-(void)clearDefaultLineByAddFootLine;

-(void)clearDefaultLineByAddFootLineWithLineColor:(UIColor *)lineColor;

@end