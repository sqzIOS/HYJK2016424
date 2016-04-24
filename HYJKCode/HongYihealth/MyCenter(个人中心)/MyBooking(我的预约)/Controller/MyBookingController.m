//
//  MyBookingController.m
//  
//
//  Created by wenzhizheng on 16/1/3.
//
//

#import "MyBookingController.h"
#import "BookingSwitch.h"
#import "BookingCell.h"
#import "SetClockController.h"
#import "BookingDetailController.h"
#import "UserOperation.h"
#import "PayDetailsVC.h"

@interface MyBookingController ()<BookingSwitchDelegate,UITableViewDataSource,UITableViewDelegate,BookingCellDelegate>

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic) BOOL isTreated;
@property (nonatomic,strong) NSMutableArray *dataArry1;
@property (nonatomic,strong) NSMutableArray *dataArry2;

@end

@implementation MyBookingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBCOLOR(240, 240, 240);
    self.titleStr = @"我的预约";
    
    [self setTableView];
    
    self.isTreated = NO;
}

#pragma mark - 上下拉刷新
- (void)loadMoreData
{
    if (self.isTreated) {
        if (self.dataArry1.count % 10 != 0) {
            [self noMoreData];
            return;
        }
        int page = self.dataArry1.count / 10 + 1;
        [UserOperation getOrderListWithPage:[NSString stringWithFormat:@"%d",page] andCount:@"10" andType:@"visit" Succeed:^(NSArray *orderList) {
            if (orderList.count < 1) {
                [self noMoreData];
                return ;
            }
            [self.tableView footerEndRefreshing];
            for (BookingModel *model in orderList) {
                [self.dataArry1 addObject:model];
            }
            [self.tableView reloadData];
        }];
    }
    if (!self.isTreated) {
        if (self.dataArry2.count % 10 != 0) {
            [self noMoreData];
            return;
        }
        
        int page = self.dataArry2.count / 10 + 1;
        [UserOperation getOrderListWithPage:[NSString stringWithFormat:@"%d",page] andCount:@"10" andType:@"unvisit" Succeed:^(NSArray *orderList) {
            [self.tableView footerEndRefreshing];
            if (orderList.count < 1) {
                [self noMoreData];
                return ;
            }
            for (BookingModel *model in orderList) {
                [self.dataArry2 addObject:model];
            }
            [self.tableView reloadData];
        }];

    }
}

- (void)loadData
{
    [UserOperation getOrderListWithPage:@"1" andCount:@"4" andType:@"unvisit" Succeed:^(NSArray *orderList) {
        self.dataArry2 = [NSMutableArray arrayWithArray:orderList];
        [UserOperation getOrderListWithPage:@"1" andCount:@"4" andType:@"visit" Succeed:^(NSArray *orderList) {
            self.dataArry1 = [NSMutableArray arrayWithArray:orderList];
            [self.tableView reloadData];
            [self.tableView headerEndRefreshing];
        }];
    }];
}

- (void)noMoreData
{
    [ShareFunction showToast:@"没有更多数据"];
    [self.tableView footerEndRefreshing];
    return;
}


#pragma mark - 创建topView
- (void)setTopView
{
    [super setTopView];
    
    CGRect frame = CGRectMake(0,self.topView.bottom, SCREEN_WIDTH, 44);
    BookingSwitch *bookingSwitch = [BookingSwitch bookingSwitchWithFrame:frame andLeftStr:@"未就诊" andRightStr:@"已就诊"];
    bookingSwitch.delegate = self;
    [self.view addSubview:bookingSwitch];
    
}

#pragma mark - 创建tableView
- (void)setTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    CGFloat height = SCREEN_HEIGHT - 108;
    tableView.frame = CGRectMake(0,self.topView.bottom + 44, SCREEN_WIDTH, height);
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView addHeaderWithTarget:self action:@selector(loadData)];
    self.tableView.headerPullToRefreshText = @"刷新数据";
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    self.tableView.headerPullToRefreshText = @"加载更多数据";
    
    [self.tableView headerBeginRefreshing];
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isTreated) {
        return self.dataArry1.count;
    }
    return self.dataArry2.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookingCell *cell = [BookingCell bookingCellWithTableView:tableView andIsNeedClock:self.isTreated];
    cell.delegate = self;
    
    BookingModel *model;
    if (self.isTreated) {
        model = [self.dataArry1 objectAtIndex:indexPath.row];
    } else {
        model = [self.dataArry2 objectAtIndex:indexPath.row];
    }
    cell.model = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isTreated == YES) {
        return  200;
    }
    return 171;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookingCell *cell = (BookingCell *)[tableView cellForRowAtIndexPath:indexPath];
    PayDetailsVC *vc = [[PayDetailsVC alloc] init];
    vc.orderID = cell.model.orderID;
    [self.navigationController pushViewController:vc animated:YES];
//    BookingCell *cell = (BookingCell *)[tableView cellForRowAtIndexPath:indexPath];
//    BookingDetailController *controller = [BookingDetailController bookingDetailControllerWithModel:cell.model];
//    [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark - BookingCellDelegate
- (void)bookingCellSetClock:(BookingCell *)cell
{
    SetClockController *setClockController = [[SetClockController alloc] init];
    setClockController.cell = cell;
    [self.navigationController pushViewController:setClockController animated:YES];
}

#pragma mark - BookingSwitchDelegate
- (void)bookingSwitchVlaueChange:(bookingSwitchValue)value
{
    if (value == bookingSwitchValueLeft) {
        self.isTreated = NO;
    } else {
        self.isTreated = YES;
    }
    [self.tableView reloadData];
}


@end
