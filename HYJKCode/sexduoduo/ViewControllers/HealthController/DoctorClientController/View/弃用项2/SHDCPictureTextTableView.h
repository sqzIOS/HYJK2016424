//
//  SHDCPictureTextTableView.h
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDCPictureTextTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIViewController *mainVC;
/**
 *  初始化
 */
- (id)initWithCopeTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC;



@end
