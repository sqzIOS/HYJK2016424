//
//  MedicalFirstController.m
//  
//
//  Created by wenzhizheng on 16/1/1.
//
//

#import "MedicalFirstController.h"
#import "ShareFunction.h"
#import "MedicalCell.h"
#import "DescriptionCell.h"
#import "UIView+Extend.h"
#import "PatientSetInfoController.h"
#import "UserOperation.h"
#import "MedicalDemandSetInfoController.h"

@interface MedicalFirstController () <UITableViewDataSource,UITableViewDelegate,DescriptionCellDelegate>

@property (nonatomic,weak) UIButton *searchBtn;
@property (nonatomic,strong) ServiceModel *model;


@end

@implementation MedicalFirstController

- (instancetype)init
{
    if (self = [super init]) {
        [self setTableView];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modelDataChanged) name:@"modelDataChanged" object:nil];
    return self;
}

- (ServiceModel *)model
{
    if (_model == nil) {
        _model = [[ServiceModel alloc] init];
    }
    return _model;
}

#pragma mark - 创建tableView
- (void)setTableView
{

    UITableView *tableView = [[UITableView alloc] init];
//    tableView.
    self.tableView = tableView;
    
    CGFloat height = SCREEN_HEIGHT - 64;
    tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setTableViewHeardView];
    [self setTableViewBottomView];
}

- (void)setTableViewHeardView
{
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH / 640 * 270);
    bgImageView.image = [UIImage imageNamed:@"medicalFirstBg"];
    self.tableView.tableHeaderView = bgImageView;
}

- (void)setTableViewBottomView
{
    UIView *bottomView = [[UIView alloc] init];
    
    UIButton *searchBtn = [[UIButton alloc] init];
    self.searchBtn = searchBtn;
    searchBtn.frame = CGRectMake(5, QZMake(10), SCREEN_WIDTH - 10,SCREEN_WIDTH / 666 * 95);
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bottomView addSubview:searchBtn];
    searchBtn.enabled = NO;
    [searchBtn setImage:[UIImage imageNamed:@"canNotSearch"] forState:UIControlStateDisabled];
    [searchBtn setImage:[UIImage imageNamed:@"canSearch"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *bottomImageView = [[UIImageView alloc] init];
    bottomImageView.frame = CGRectMake(QZMake(10), searchBtn.bottom + 10 , SCREEN_WIDTH - QZMake(20) , SCREEN_WIDTH / 7.5);
    bottomView.bottom = bottomImageView.bottom + 10;
    bottomImageView.image = [UIImage imageNamed:@"medicalFirstBottomBg"];
    bottomImageView.userInteractionEnabled = YES;
    [bottomView addSubview:bottomImageView];
//    for (int i = 1; i <= 3; i++) {
//        UIButton *btn = [[UIButton alloc] init];
//        btn.tag = i;
//        btn.frame = CGRectMake((i - 1) * (bottomImageView.width / 3), 0, bottomImageView.width/3, bottomImageView.height);
//        [btn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [bottomImageView addSubview:btn];
    //    }
    
    bottomView.frame = CGRectMake(0, 0, SCREEN_WIDTH, bottomImageView.bottom + 10);
    self.tableView.tableFooterView = bottomView;
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        DescriptionCell *cell = [DescriptionCell descriptionCellWithTitle:@"症状描述" andPlaceHolder:@"请输入症状描述"];
        cell.delegate = self;
        cell.descriptionStr = self.model.disease_desc;
        return cell;
    }
    
    MedicalCell *cell = [MedicalCell medicalCell];
    if (indexPath.row == 0) {
        cell.titleStr = @"科室";
        cell.detailStr = self.model.department;
    }
    if (indexPath.row == 1) {
        cell.titleStr = @"地区";
        cell.detailStr = self.model.region;
    }
    if (indexPath.row == 3) {
        cell.titleStr = @"联系电话";
        cell.detailStr = self.model.mobile;
    }
    if (indexPath.row == 4) {
        cell.titleStr = @"联系人";
        cell.detailStr = self.model.contact_name;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 2) {
        return 44;
    }
    else
        return 150;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView endEditing:YES];
    
    MedicalCell *cell = (MedicalCell *)[tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[MedicalCell class]]) {
        MedicalDemandSetInfoController *controller = [MedicalDemandSetInfoController controllerWithType:MedicalDemandSetInfoControllerTypeService medicalCell:cell andModel:self.model];
        [self.nav pushViewController:controller animated:YES];
    }
}




#pragma mark - DescriptionCellDelegate
- (void)descriptionCellTextDidChange:(DescriptionCell *)cell
{
    self.model.disease_desc = cell.descriptionStr;
    [self checkBtnStatus];
}

#pragma mark - 更新按钮状态
- (void)checkBtnStatus
{
    ServiceModel *model = self.model;
    if (!model.department || !model.region || !model.mobile || !model.contact_name || !model.disease_desc || model.disease_desc.length < 1) {
        self.searchBtn.enabled = NO;
    } else {
        self.searchBtn.enabled = YES;
    }
}
- (void)modelDataChanged
{
    [self checkBtnStatus];
}


#pragma mark - 点击开始寻找按钮
- (void)searchBtnClick
{
    self.searchBtn.enabled = NO;
    ServiceModel *model = self.model;
    
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    [UserOperation submitService:model Succeed:^{
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        [ShareFunction showToast:@"提交成功"];
        self.searchBtn.enabled = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.nav popViewControllerAnimated:YES];
        });
    } failed:^{
        self.searchBtn.enabled = NO;
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        [ShareFunction showToast:@"提交失败"];
    }];
}

#pragma mark - 底部按钮点击
- (void)bottomBtnClick:(UIButton *)btn
{
    if (btn.tag == 1) {
        NSLog(@"最左边的按钮");
    }
    if (btn.tag == 2) {
        NSLog(@"最中间的按钮");
    }
    if (btn.tag == 3) {
        NSLog(@"最右边的按钮");
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
