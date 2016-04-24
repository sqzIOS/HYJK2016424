//
//  AddressTableView.h
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能: address tableView

#import <UIKit/UIKit.h>
#import "AddressTableViewCell.h"

@interface AddressTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) AddressTableViewCell *selectedCell;

@property (nonatomic, strong) NSString *selectedStr;

@property (nonatomic, strong) NSString *idStr;

@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end
