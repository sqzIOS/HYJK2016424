//
//  SettingMainController.m
//  
//
//  Created by wenzhizheng on 16/1/8.
//
//

#import "SettingMainController.h"
#import "SettingDetailController.h"
#import "StarAppController.h"
#import "UserOperation.h"

@interface SettingMainController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *titleArry;

@end

@implementation SettingMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"设置";
    [self setTableView];
}

#pragma mark - 创建tableView
- (void)setTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    CGRect tableViewFrame = CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.height);
    [self.view addSubview:tableView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.frame = tableViewFrame;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    UIButton *exitBtn = [[UIButton alloc] init];
    exitBtn.frame = CGRectMake( 0, 0, SCREEN_WIDTH , 50);
    [exitBtn setTitle:@"退出" forState:UIControlStateNormal];
    [exitBtn setTitleColor:RGBCOLOR(100, 100, 00) forState:UIControlStateNormal];
    [exitBtn addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 49, SCREEN_WIDTH, 1)];
    line.backgroundColor = RGBACOLOR(100, 100, 100, 0.2);
    [exitBtn addSubview:line];

    
    tableView.tableFooterView = exitBtn;
    self.titleArry = [NSArray arrayWithObjects:@"免责条款",@"用户协议",@"关于弘医",@"评分",@"重置密码", nil];
    
}

#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *title = [self.titleArry objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = RGBCOLOR(100,100,100);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = title;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 43, SCREEN_WIDTH, 1)];
    line.backgroundColor = RGBACOLOR(100, 100, 100, 0.2);
    [cell.contentView addSubview:line];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *titleStr = [self.titleArry objectAtIndex:indexPath.row];
    SettingDetailController *controller = [SettingDetailController settingDetailControllerWithTitle:titleStr];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - 退出登录
- (void)exitBtnClick
{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"session"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"user"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"uid"];
    [m_appDelegate starApp];
}

@end
