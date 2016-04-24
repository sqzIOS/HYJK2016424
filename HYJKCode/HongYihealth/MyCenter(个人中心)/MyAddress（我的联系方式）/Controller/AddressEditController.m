//
//  AddressEditController.m
//  
//
//  Created by wenzhizheng on 16/1/25.
//
//

#import "AddressEditController.h"
#import "ChooseView.h"
#import "AddressEditCell.h"
#import "UserOperation.h"
#import "SetAddressInfoController.h"

@interface AddressEditController () <UITableViewDataSource,UITableViewDelegate,ChooseViewDelegate,UIAlertViewDelegate>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSArray *areaArry;

@property (nonatomic,strong) NSString *addressID;

@property (nonatomic,strong) AreaModel *shengModel;
@property (nonatomic,strong) AreaModel *shiModel;
@property (nonatomic,strong) AreaModel *diquModel;


@property (nonatomic,strong) ChooseView *chooseView;

@property (nonatomic,strong) AddressModel *addressModel;



@end

@implementation AddressEditController

- (AddressModel *)addressModel
{
    if (_addressModel == nil) {
        _addressModel = [[AddressModel alloc] init];
    }
    return _addressModel;
}

// 18065218949 测试账号
// 123456      测试密码

- (AreaModel *)shengModel
{
    if (_shengModel == nil) {
        _shengModel = [[AreaModel alloc] init];
    }
    return _shengModel;
}

- (AreaModel *)shiModel
{
    if (_shiModel == nil) {
        _shiModel = [[AreaModel alloc] init];
    }
    return _shiModel;
}

- (AreaModel *)diquModel
{
    if (_diquModel == nil) {
        _diquModel = [[AreaModel alloc] init];
    }
    return _diquModel;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.tableView) {
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.addressID) {
        self.titleStr = @"编辑联系人地址";
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [UserOperation addressInfo:self.addressID Succeed:^(NSDictionary *addressDict) {
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            self.addressModel = [AddressModel addressModelWithDict:addressDict];
            self.shengModel.areaID = addressDict[@"province"];
            self.shengModel.name = addressDict[@"province_name"];
            self.shiModel.areaID = addressDict[@"city"];
            self.shiModel.name = addressDict[@"city_name"];
            self.diquModel.areaID = addressDict[@"district"];
            self.diquModel.name = addressDict[@"district_name"];
            [self creatTableView];
        } failed:^{
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        }];
    } else {
        self.titleStr = @"添加联系人地址";
        [self creatTableView];
    }
}

+ (instancetype)controllerWithAddressID:(NSString *)addressID
{
    AddressEditController *controller = [[AddressEditController alloc] init];
    controller.addressID = addressID;
    return controller;
}

#pragma mark - 创建tableView
- (void)creatTableView
{
    CGFloat bottom = self.topView.bottom;
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, bottom, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - bottom);
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    tableView.tableFooterView = footView;
    
    UIButton *submitBtn = [[UIButton alloc] init];
    submitBtn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 10, 44);
    submitBtn.center = CGPointMake(footView.frame.size.width / 2, footView.frame.size.height / 2);
    [footView addSubview:submitBtn];
    submitBtn.backgroundColor = MAINCOLOR;
    [submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.addressID) {
        [self setDeleteBtn];
    }
}


- (void)setDeleteBtn
{
    UIButton *deleteBtn = [[UIButton alloc] init];
    deleteBtn.frame = CGRectMake(SCREEN_WIDTH - 60, self.topView.bottom - 35,50,30);
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:deleteBtn];
}

- (void)deleteBtnClick
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"删除本地址" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [UserOperation deleteDddress:self.addressID Succeed:^{
            [UserOperation getAddressListSucceed:^(NSArray *modelArry) {
                [self setDataArry:modelArry];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [self.navigationController popViewControllerAnimated:YES];
            } failed:^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];;
            }];
        } failed:^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];;
        }];
    }
}

#pragma makr - 提交
- (void)submitBtnClick
{
    AddressModel *model = [[AddressModel alloc] init];
    model.province = self.shengModel.areaID;
    model.city = self.shiModel.areaID;
    model.district = self.diquModel.areaID;
    model.address = self.addressModel.address;
    model.consignee = self.addressModel.consignee;
    model.tel = self.addressModel.tel;
    model.default_address = @"1 ";
    model.best_time = self.addressModel.best_time;
    
    if (!model.province || !model.city || !model.district || !model.address) {
        [ShareFunction showMessageMiddle:@"地址信息填写不完整"];
        return;
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (self.addressID) {
        model.addressID = self.addressModel.addressID;
        model.default_address = self.addressModel.default_address;
        [UserOperation updateAddress:model Succeed:^{
            [UserOperation getAddressListSucceed:^(NSArray *modelArry) {
                [self setDataArry:modelArry];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [self.navigationController popViewControllerAnimated:YES];
            } failed:^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];;
            }];
        } failed:^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    } else {
        [UserOperation submitAddress:model Succeed:^{
            [UserOperation getAddressListSucceed:^(NSArray *modelArry) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"hadSetAddress" object:nil];
                [self setDataArry:modelArry];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [self.navigationController popViewControllerAnimated:YES];
            } failed:^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];;
            }];
        } failed:^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    }
}

- (void)setDataArry:(NSArray *)dataArry
{
    self.controller.dataArry = dataArry;
}

#pragma mark - 数据源
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressEditCell *cell;
    switch (indexPath.row) {
        case 0:
           cell = [AddressEditCell cellWithTitle:@"省"];
            cell.content = self.shengModel.name;
            break;
        case 1:
            cell = [AddressEditCell cellWithTitle:@"市"];
            cell.content = self.shiModel.name;
            break;
        case 2:
            cell = [AddressEditCell cellWithTitle:@"区"];
            cell.content = self.diquModel.name;
            break;
        case 3:
            cell = [AddressEditCell cellWithTitle:@"详细地址"];
            cell.content = self.addressModel.address;
            
            break;
        case 4:
            cell = [AddressEditCell cellWithTitle:@"联系人"];
            cell.content = self.addressModel.consignee;
            break;
        case 5:
            cell = [AddressEditCell cellWithTitle:@"联系电话"];
            cell.content = self.addressModel.tel;
            
            break;
        case 6:
            cell = [AddressEditCell cellWithTitle:@"联系时间"];
            cell.content = self.addressModel.best_time;
            break;
    }
    return cell;
}

#pragma mark - 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            self.view.userInteractionEnabled = NO;
            [UserOperation getAreaListWithparentId:@"1" finished:^(NSArray *areaList) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [self setChooseViewWithModelArry:areaList andIndexPath:indexPath];
            }];
            break;
        }
        case 1:
        {
            
            if (self.shengModel.areaID == nil) {
                [ShareFunction showMessageMiddle:@"请选择省份"];
                break;
            } else {
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                self.view.userInteractionEnabled = NO;
                [UserOperation getAreaListWithparentId:self.shengModel.areaID finished:^(NSArray *areaList) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [self setChooseViewWithModelArry:areaList andIndexPath:indexPath];
                }];
                break;
            }
        }
        case 2:
        {
            if (self.shiModel.areaID == nil) {
                [ShareFunction showMessageMiddle:@"请选择市区"];
                break;
            } else {
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                self.view.userInteractionEnabled = NO;
                [UserOperation getAreaListWithparentId:self.shiModel.areaID finished:^(NSArray *areaList) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [self setChooseViewWithModelArry:areaList andIndexPath:indexPath];
                }];
                break;
            }
        }
        case 6:
        {
            NSString *chooseTitle = self.addressModel.best_time;
            if (chooseTitle == nil) {
                chooseTitle = @"随时";
            }
            NSArray *titleArry = @[@"工作日（周一至周五）",@"双休日（周六、周日）",@"随时"];
            ChooseView *view = [ChooseView chooseViewWithTitleArry:titleArry andChosseTitle:chooseTitle andTitle:@"请选择联系时间"];
            view.delegate = self;
            self.chooseView = view;
            [view showInView:self.view];
            break;
        }
            
        default:
        {
            AddressEditCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            NSString *title = cell.textLabel.text;
            SetAddressInfoController *controller = [SetAddressInfoController controllerWithAddressModel:self.addressModel controllerTitle:title];
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
    }
}

- (void)setChooseViewWithModelArry:(NSArray *)modelArry andIndexPath:(NSIndexPath *)indexPath
{
    self.view.userInteractionEnabled = YES;

    AddressEditCell *cell = (AddressEditCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    
    self.areaArry = modelArry;
    NSMutableArray *titleArry = [NSMutableArray array];
    for (AreaModel *model in modelArry) {
        NSString *title = model.name;
        [titleArry addObject:title];
    }
    ChooseView *chooseView = [ChooseView chooseViewWithTitleArry:titleArry andChosseTitle:nil andTitle:cell.textLabel.text];
    chooseView.delegate = self;
    [chooseView showInView:self.view];
}

- (void)chooseViewDidSelected:(NSInteger)index
{
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if (indexPath.row == 6) {
        NSArray *titleArry = @[@"工作日（周一至周五）",@"双休日（周六、周日）",@"随时"];
        self.addressModel.best_time = titleArry[index];
    } else {
        AreaModel *model = [self.areaArry objectAtIndex:index];
        if (indexPath.row == 0) {
            self.shengModel = model;
        }
        if (indexPath.row == 1) {
            self.shiModel = model;
        }
        if (indexPath.row == 2) {
            self.diquModel = model;
        }
    }
    [self.tableView reloadData];
}

- (void)backBtnClick
{
    if (self.isComeFromeSureOrder) {
        NSMutableArray *controllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [controllers removeObjectAtIndex:controllers.count - 1];
        [controllers removeObjectAtIndex:controllers.count - 1];
        [self.navigationController setViewControllers:controllers animated:YES];
        
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
