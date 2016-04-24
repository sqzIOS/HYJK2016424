//
//  SHRelatedCasesTableView.h
//  sexduoduo
//
//  Created by shown on 15/9/6.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHCasesTableHeaderView.h"
@interface SHRelatedCasesTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UIViewController *mainVC;
@property (strong, nonatomic) NSMutableArray *listArray;
@property (nonatomic) NSInteger type;

@property (nonatomic,strong) SHCasesTableHeaderView *casesTableHeaderView;
/**
 *
 初始化
 */
- (id)initWithTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC withType:(NSInteger)type;

@end
