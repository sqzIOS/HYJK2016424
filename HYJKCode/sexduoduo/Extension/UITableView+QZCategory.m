//
//  UITableView+QZCategory.m
//  sexduoduo
//
//  Created by showm on 15/9/14.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "UITableView+QZCategory.h"

@implementation UITableView (QZCategory)

-(void)setLineZero
{
    if (IOS7_OR_LATER) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
}

-(void)clearDefaultLineByAddFootLine
{
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    line.backgroundColor=GRAY_COLOR_TABLEVIEWLINE;
    self.tableFooterView=line;
}

-(void)clearDefaultLineByAddFootLineWithLineColor:(UIColor *)lineColor
{
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    if (lineColor==nil) {
        line.backgroundColor=GRAY_COLOR_TABLEVIEWLINE;
    }else line.backgroundColor= lineColor;
    
    self.tableFooterView=line;
}

@end
