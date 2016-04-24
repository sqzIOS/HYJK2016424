//
//  SearchTableView.h
//  搜索以及纪录保存
//
//  Created by shown on 16/1/8.
//  Copyright (c) 2016年 shown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTableViewCell.h"
#import "DoctorDetailsVC.h"

//@protocol SearchTableViewDelegate <NSObject>
//
//- (void)tableView:(UITableView *)tableView touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
//
//@end

@interface SearchTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UIViewController *mainVC;

//@property (nonatomic, assign) id<SearchTableViewDelegate> tableViewDelegate;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Controller:(UIViewController *)vc;

@end
