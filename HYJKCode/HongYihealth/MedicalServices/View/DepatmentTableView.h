//
//  DepatmentTableView.h
//
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能: 科室tableView

#import <UIKit/UIKit.h>

@interface DepatmentTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, copy) void (^deparmentBlock)(NSIndexPath *indexPath);

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Arr:(NSArray *)arr;


@end
