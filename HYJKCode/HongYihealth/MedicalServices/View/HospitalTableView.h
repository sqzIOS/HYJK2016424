//
//  HospitalTableView.h
//
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能：医院tableView

#import <UIKit/UIKit.h>
#import "HospitalModel.h"

@interface HospitalTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, copy) void (^hosBlock)(NSIndexPath *indexPath);

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Arr:(NSArray *)arr;

@end
