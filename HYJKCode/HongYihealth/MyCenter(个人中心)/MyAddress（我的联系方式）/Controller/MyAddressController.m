//
//  MyAddressController.m
//  
//
//  Created by wenzhizheng on 16/1/25.
//
//

#import "MyAddressController.h"
#import "UserOperation.h"
#import "MyAddressCell.h"
#import "AddressEditController.h"

@interface MyAddressController () <UITableViewDataSource,UITableViewDelegate,MyAddressCellDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MyAddressController

- (void)viewWillAppear:(BOOL)animated
{
    if (self.tableView) {
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleStr = @"我的联系人地址";
    
    [self loadData];
}

- (void)loadData
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [UserOperation getAddressListSucceed:^(NSArray *modelArry) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.dataArry = modelArry;
        [self setContent];
    } failed:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];

}

- (void)setContent
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
    
    CGFloat bottom = self.topView.bottom;
    self.tableView.frame = CGRectMake(0, bottom, SCREEN_WIDTH, SCREEN_HEIGHT - bottom - 44);
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    UIButton *addBtn = [[UIButton alloc] init];
    addBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH,44);
    [self.view addSubview:addBtn];
    addBtn.backgroundColor = AppColor;
    [addBtn setTitle:@"添加地址" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)addBtnClick
{
    AddressEditController *controller = [[AddressEditController alloc] init];
    controller.controller = self;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyAddressCell" owner:nil options:nil] lastObject];
    }
    cell.delegate = self;
    AddressModel *model = [self.dataArry objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 185;
}

#pragma mark - 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressModel *model = [self.dataArry objectAtIndex:indexPath.row];
    AddressEditController *controller = [AddressEditController controllerWithAddressID:model.addressID];
    controller.controller = self;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - 设置默认
- (void)myAddressCellsetDefaultWithAddressID:(NSString *)addressID
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [UserOperation setDefauleAddress:addressID Succeed:^{
        [UserOperation getAddressListSucceed:^(NSArray *modelArry) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            self.dataArry = modelArry;
            [self.tableView reloadData];
        } failed:^{
            
        }];
    } failed:^{
        
    }];
}

@end
