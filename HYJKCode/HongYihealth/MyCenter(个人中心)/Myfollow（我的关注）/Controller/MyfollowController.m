//
//  MyfollowController.m
//  
//
//  Created by wenzhizheng on 16/1/9.
//
//

#import "MyfollowController.h"
#import "UserOperation.h"
#import "DoctorCell.h"
#import "DoctorDetailsVC.h"

@interface MyfollowController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArry;

@end

@implementation MyfollowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"我的关注";
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.height);
    self.tableView = tableView;
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;

    [self.tableView addHeaderWithTarget:self action:@selector(loadData)];
    self.tableView.headerPullToRefreshText = @"刷新数据";
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    self.tableView.headerPullToRefreshText = @"加载更多数据";
    
    [self.tableView headerBeginRefreshing];
}

#pragma mark - 上下拉刷新
- (void)loadMoreData
{
    if (self.dataArry.count % 10 != 0) {
        [self noMoreData];
        return;
    }
    
    int page = self.dataArry.count / 10 + 1;
    [UserOperation getCollectedListWithPage:[NSString stringWithFormat:@"%d",page] andCount:@"10" Succeed:^(NSArray *doctorList) {
        if (doctorList.count < 1) {
            [self noMoreData];
            return;
        }
        [self.tableView footerEndRefreshing];
        for (DorctorModel *model in doctorList) {
            [self.dataArry addObject:model];
        }
        [self.tableView reloadData];
    }];
}

- (void)noMoreData
{
    [ShareFunction showToast:@"没有更多数据"];
    [self.tableView footerEndRefreshing];
    return;
}

- (void)loadData
{
    [UserOperation getCollectedListWithPage:@"1" andCount:@"10" Succeed:^(NSArray *doctorList) {
        [self.tableView headerEndRefreshing];
        self.dataArry = [NSMutableArray arrayWithArray:doctorList];
        [self.tableView reloadData];
    }];
}



#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DorctorModel *model = [self.dataArry objectAtIndex:indexPath.row];
    DoctorCell *cell = [DoctorCell cellWithModel:model inTableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DorctorModel *doctorModel = [self.dataArry objectAtIndex:indexPath.row];
    
    DoctorDetailsVC *vc = [[DoctorDetailsVC alloc] initWithType:ForServer];
    ConsultingModel *model = [[ConsultingModel alloc] init];
    model.goods_id = doctorModel.ID;
    model.doctoeHead = doctorModel.icon;
    model.doctorName = doctorModel.name;
    model.doctorDeparment = doctorModel.detail;
    
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];

}

@end
