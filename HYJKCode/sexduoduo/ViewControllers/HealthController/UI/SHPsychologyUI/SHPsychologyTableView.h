//
//  SHPsychologyTableView.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHPsychologyTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
/**
 *  表视图数据
 */
@property (strong, nonatomic) NSMutableArray *tvData;
@property (strong, nonatomic) UIViewController *mainVC;
/**
 *  初始化
 */
- (id)initTableView:(CGRect)frame withVC:(UIViewController*)VC;

@end
