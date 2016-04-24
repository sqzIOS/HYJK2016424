//
//  CommentsListController.m
//  
//
//  Created by apple on 16/1/29.
//
// 评价列表

#import "CommentsListController.h"
#import "UserOperation.h"
#import "CommentCell.h"
#import "CommentListCell.h"

@interface CommentsListController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy) NSString *doctorID;
@property (nonatomic,copy) NSString *doctorName;
@property (nonatomic,copy) NSString *doctorDetail;
@property (nonatomic,copy) NSString *doctorIcon;

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArry;


@end

@implementation CommentsListController

+ (instancetype)controllerWithDoctorID:(NSString *)doctorID
{
    CommentsListController *controller = [[CommentsListController alloc] init];
    controller.doctorID = doctorID;
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"评价";
    
    [self setContent];

}

#pragma mark - 获取数据
- (void)loadData
{
    [UserOperation getCommentListWithDoctorID:self.doctorID andPage:@"1" andCount:@"10" Succeed:^(NSArray *commentArry) {
        [UserOperation getDoctorInfoWithDoctorID:self.doctorID Succeed:^(NSDictionary *dict) {
            NSDictionary *image = dict[@"img"];
            self.doctorIcon = image[@"small"];
            
            NSString *string = dict[@"goods_name"];
            NSArray *strArry = [string componentsSeparatedByString:@" "];
            self.doctorName = strArry.firstObject;
            self.doctorDetail = strArry.lastObject;
            
            [self.tableView headerEndRefreshing];
            self.dataArry = [NSMutableArray arrayWithArray:commentArry];
            [self.tableView reloadData];
        }];
    } failed:^{
        [self.tableView headerEndRefreshing];
    }];
}

#pragma mark - 加载更多数据
- (void)loadMoreData
{
    if (self.dataArry.count % 10 != 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView footerEndRefreshing];
            [ShareFunction showToast:@"没有更多数据" inSuperview:self.view];
            return;
        });
    } else {
        NSString *page = [NSString stringWithFormat:@"%d",self.dataArry.count / 10 + 1];
        [UserOperation getCommentListWithDoctorID:self.doctorID andPage:page andCount:@"10" Succeed:^(NSArray *commentArry) {
            for (CommentModel *model in commentArry) {
                [self.dataArry addObject:model];
            }
            [self.tableView reloadData];
            [self.tableView footerEndRefreshing];
        } failed:^{
            [self.tableView footerEndRefreshing];
        }];
    }
}

- (void)setContent
{
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    tableView.frame = CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.bottom);
    [self.view addSubview:tableView];
    NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.headerRefreshingText = @"正在加刷新";
    tableView.footerRefreshingText = @"加载更多数据";
    [tableView addHeaderWithTarget:self action:@selector(loadData)];
    [tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    [tableView headerBeginRefreshing];
    
    
}

#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentListCell *cell = [CommentListCell commentListCellInTableView:tableView];
    CommentModel *model = [self.dataArry objectAtIndex:indexPath.row];

//    cell.value1 = model.effect_rank.intValue;
//    cell.value2 = model.attitude_rank.intValue;
//    cell.value3 = model.recommend_rank.intValue;
    
    cell.value1 = 2;
    cell.value2 = 3;
    cell.value3 = 4;
    
    cell.desease = model.disease_types;
    cell.name = model.author;
    cell.content = model.content;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 184;
}

@end
