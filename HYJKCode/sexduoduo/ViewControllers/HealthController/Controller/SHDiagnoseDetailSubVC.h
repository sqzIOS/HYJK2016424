//
//  SHDiagnoseDetailSubVC.h
//  sexduoduo
//
//  Created by showm on 15/9/14.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  自我诊断病情详情三级页面

#import <UIKit/UIKit.h>

@interface SHDiagnoseDetailSubVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableview;

@property(nonatomic,strong)NSMutableArray *detailArray;//存放详情数据 
@property(nonatomic,assign)NSInteger selectIndex;

+(void)gotoMySelf:(id)pvc WithDetailArray:(NSMutableArray *)arr withIndex:(int)index;

@end
