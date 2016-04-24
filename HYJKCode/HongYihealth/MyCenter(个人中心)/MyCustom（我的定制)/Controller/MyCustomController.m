//
//  MyCustomController.m
//  
//
//  Created by apple on 16/1/27.
//
// 我的定制

#import "MyCustomController.h"
#import "BookingSwitch.h"
#import "UserOperation.h"
#import "MyCustomCell.h"
#import "CustomDetailController.h"


typedef enum {
    MycustomTypeService = 0,
    MycustomTypeExamination
} MycustomType;

@interface MyCustomController () <BookingSwitchDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) MycustomType customType;

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataArry1;
@property (nonatomic,strong) NSMutableArray *dataArry2;

@end

@implementation MyCustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBCOLOR(240, 240, 240);
    
    self.titleStr = @"我的医疗需求";
    [self setSwitchView];
    [self createTableView];
}

#pragma mark - 创建tableView
- (void)createTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.backgroundColor = RGBCOLOR(240, 240, 240);
    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.frame = CGRectMake(0, self.topView.bottom + 44, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.bottom - 44);
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.tableView addHeaderWithTarget:self action:@selector(loadData)];
    self.tableView.headerPullToRefreshText = @"刷新数据";
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    self.tableView.headerPullToRefreshText = @"加载更多数据";
    
    [self.tableView headerBeginRefreshing];
}



#pragma mark - 请求数据
- (void)loadData
{
    [UserOperation getServiceListWithPage:@"1" andCount:@"10" Succeed:^(NSArray *modelArry) {
        self.dataArry1 = [NSMutableArray arrayWithArray:modelArry];
        [UserOperation getExaminationListWithPage:@"1" andCount:@"10" Succeed:^(NSArray *modelArry) {
            self.dataArry2 = [NSMutableArray arrayWithArray:modelArry];
            [self.tableView headerEndRefreshing];
            [self.tableView reloadData];
        } failed:^{
            [self.tableView headerEndRefreshing];
        }];
    } failed:^{
        [self.tableView headerEndRefreshing];
    }];
}
- (void)loadMoreData
{
    if (self.customType == MycustomTypeService) {
        if (self.dataArry1.count % 10 != 0 || self.dataArry1.count == 0) {
            [ShareFunction showToast:@"没有更多数据"];
            [self.tableView footerEndRefreshing];
            return;
        } else {
            int page = self.dataArry1.count / 10 + 1;
            [UserOperation getServiceListWithPage:[NSString stringWithFormat:@"%d",page] andCount:@"10" Succeed:^(NSArray *modelArry) {
                for (ServiceModel *model in modelArry) {
                    [self.dataArry1 addObject:model];
                }
                [self.tableView reloadData];
                [self.tableView footerEndRefreshing];
            } failed:^{
                [self.tableView footerEndRefreshing];
            }];
        }
    }
    
    if (self.customType == MycustomTypeExamination) {
        if (self.dataArry2.count % 10 != 0 || self.dataArry2.count == 0) {
            [ShareFunction showToast:@"没有更多数据"];
            [self.tableView footerEndRefreshing];
            return;
        } else {
            int page = self.dataArry2.count / 10 + 1;
            [UserOperation getExaminationListWithPage:[NSString stringWithFormat:@"%d",page] andCount:@"10" Succeed:^(NSArray *modelArry) {
                for (ExaminationModel *model in modelArry) {
                    [self.dataArry2 addObject:model];
                }
                [self.tableView reloadData];
                [self.tableView footerEndRefreshing];
            } failed:^{
                [self.tableView footerEndRefreshing];
            }];
        }
    }
}

#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.customType == MycustomTypeService) {
        return self.dataArry1.count;
    }
    return self.dataArry2.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject *model;
    if (self.customType == MycustomTypeService) {
        model = self.dataArry1[indexPath.row];
    }
    if (self.customType == MycustomTypeExamination) {
        model = self.dataArry2[indexPath.row];
    }
    MyCustomCell *cell = [MyCustomCell cellWithModel:model inTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.customType == MycustomTypeService) {
        ServiceModel *model = [self.dataArry1 objectAtIndex:indexPath.row];
        CustomDetailController *controller = [CustomDetailController controllerWithModel:model];
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        ExaminationModel *model = [self.dataArry2 objectAtIndex:indexPath.row];
        CustomDetailController *controller = [CustomDetailController controllerWithModel:model];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


#pragma mark - 创建topView
- (void)setSwitchView
{
    
    CGRect frame = CGRectMake(0,self.topView.bottom, SCREEN_WIDTH, 44);
    BookingSwitch *bookingSwitch = [BookingSwitch bookingSwitchWithFrame:frame andLeftStr:@"服务定制" andRightStr:@"体检定制"];
    bookingSwitch.delegate = self;
    [self.view addSubview:bookingSwitch];
}

#pragma mark - BookingSwitchDelegate
- (void)bookingSwitchVlaueChange:(bookingSwitchValue)value
{
    if (value == bookingSwitchValueLeft) {
        self.customType = MycustomTypeService;
    } else {
        self.customType = MycustomTypeExamination;
    }
    [self.tableView reloadData];
}

@end
