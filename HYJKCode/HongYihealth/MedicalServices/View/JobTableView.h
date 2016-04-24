//
//  JobTableView.h
//  
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能:职称tableView

#import <UIKit/UIKit.h>

@interface JobTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, copy) void (^jobBlock)(NSString *jobName);

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Arr:(NSArray *)arr;

@end
