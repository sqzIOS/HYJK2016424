//
//  ProvinceTableView.h
//  
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能：省tableView

#import <UIKit/UIKit.h>
#import "ProvinceModel.h"

@interface ProvinceTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, copy) void(^PBlock)(NSIndexPath *indexPath);

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Arr:(NSMutableArray *)arr;

@end
