//
//  PhysicalTableView.h
//  
//
//  Created by 刘朝涛 on 16/1/5.
//
//  功能：体检tableView

#import <UIKit/UIKit.h>
#import "ConsultingTableViewCell.h"

@interface PhysicalTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) NSMutableArray *dataArr;

@property (nonatomic, assign) UIViewController *mainVC;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Controller:(UIViewController *)vc;

@end
