//
//  MyMessageController.m
//  
//
//  Created by wenzhizheng on 16/1/24.
//
//

#import "MyMessageController.h"
#import "UserOperation.h"
#import "MyMessageCell.h"

@interface MyMessageController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *dataArry;
@property (nonatomic,weak) UITableView *tableView;

@end

@implementation MyMessageController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleStr = @"我的通知";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
}

- (void)loadData
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [UserOperation getMessageListfinished:^(NSArray *messageList) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        if (messageList.count < 1) {
            [self noData];
        } else {
            self.dataArry = messageList;
            [self createTableView];
        }
    }];
}

- (void)createTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.frame = CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.bottom);
}

- (void)noData
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 100, 120);
    imageView.image = [UIImage imageNamed:@"noMessage"];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 168;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *model = [self.dataArry objectAtIndex:indexPath.row];
    MyMessageCell *cell = [MyMessageCell cellWithModel:model inTableView:tableView];
    return cell;
}


@end
