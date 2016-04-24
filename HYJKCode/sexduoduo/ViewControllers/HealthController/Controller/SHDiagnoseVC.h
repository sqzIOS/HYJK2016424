//
//  SHDiagnoseVC.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//  自我诊断界面

#import <UIKit/UIKit.h>
#import "LMComBoxView.h"

@interface SHDiagnoseVC : UIViewController<LMComBoxViewDelegate,UITableViewDataSource,UITableViewDelegate>
//左列表
@property(nonatomic,strong)UITableView *leftTableView;
//右列表
@property(nonatomic,strong)UITableView *rightTableView;


//诊断科目
@property(nonatomic,strong)NSMutableArray *classArray;
//可能患病
@property(nonatomic,strong)NSMutableArray *subjecArray;


+(void)gotoMySelf:(id)pvc;
@end
