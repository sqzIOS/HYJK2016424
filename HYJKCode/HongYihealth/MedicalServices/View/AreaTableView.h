//
//  AreaTableView.h
//  
//
//  Created by 刘朝涛 on 16/1/2.
//
//

#import <UIKit/UIKit.h>

@interface AreaTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, copy) void (^areaBlock)(NSString *areaName);


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Arr:(NSArray *)arr;

@end
