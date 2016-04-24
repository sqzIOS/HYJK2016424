//
//  SHDiagnoseDetailVC.h
//  sexduoduo
//
//  Created by shown on 15/9/2.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  自我诊断二级页面

#import <UIKit/UIKit.h>

@interface SHDiagnoseDetailVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableview;


@property(nonatomic,strong)NSMutableDictionary *dataDic;//存放详情数据 包括病情详情字典 和 相关案例数组

@property(nonatomic,strong)NSMutableArray *detailArray;//病情详情对应的数组
@property(nonatomic,strong)NSMutableArray *caseArray;//相关案例数组

@property(nonatomic,strong)NSString *idStr;

+(void)gotoMySelf:(id)pvc WithIDStr:(NSString *)idStr;

@end
