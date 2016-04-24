//
//  ConsultingTableView.h
//  
//
//  Created by 刘朝涛 on 16/1/1.
//
//  功能: 咨询TableView

#import <UIKit/UIKit.h>
#import "ConsultingTableViewCell.h"
#import "DoctorDetailsVC.h"

@interface ConsultingTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) NSMutableArray *dataArr;

@property (nonatomic, assign) UIViewController *mainVC;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Controller:(UIViewController *)vc;

@end
