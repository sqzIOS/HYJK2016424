//
//  DoctorDetailsTableView.h
//
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能:医师详情tableView

#import <UIKit/UIKit.h>
#import "DoctorDetailsTableViewCell.h"

@interface DoctorDetailsTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;

@end
