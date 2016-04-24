//
//  SHDCVisitTimeView.h
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StepNumPickerView.h"
#import "SHDCVisitTimeHeadView.h"

@interface SHDCVisitTimeView : UITableView<UITableViewDelegate,UITableViewDataSource>
{
    StepNumPickerView *pickerShow;//显示的按钮
    NSInteger selectIndex;//修改哪个日期
}
@property (nonatomic,strong)NSArray *todayArray;
@property (nonatomic,strong)SHDCVisitTimeHeadView *specialView ;//头部特别设定View

@property (strong, nonatomic) NSMutableArray *timeArray;//从周一到周日显示的日期时间
@property (strong, nonatomic) NSString *specialTime;//特别设定时间

@property (strong, nonatomic) UIViewController *mainVC;
/**
 *  初始化
 */
- (id)initWithCopeTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC;


@end
