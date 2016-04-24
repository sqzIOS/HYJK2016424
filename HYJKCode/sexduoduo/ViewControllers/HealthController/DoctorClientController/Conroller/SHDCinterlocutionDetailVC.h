//
//  SHDCinterlocutionDetailVC.h
//  sexduoduo
//
//  Created by shown on 15/9/21.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  "问答详情" 1-1

#import <UIKit/UIKit.h>

@interface SHDCinterlocutionDetailVC : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)UIView *inputView;

@property (nonatomic,strong)UITextField *inputTextField;


@end
