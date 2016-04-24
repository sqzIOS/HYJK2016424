//
//  MedicalSecondController.m
//  
//
//  Created by wenzhizheng on 16/1/1.
//
//

#import "MedicalSecondController.h"
#import "ShareFunction.h"
#import "MedicalCell.h"
#import "UIView+Extend.h"
#import "PatientSetInfoController.h"
#import "UserOperation.h"
#import "MedicalDemandSetInfoController.h"

@interface MedicalSecondController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) ExaminationModel *model;

@property (nonatomic,weak) UIButton *searchBtn;

@end

@implementation MedicalSecondController

- (instancetype)init
{
    if (self = [super init]) {
        [self setTableView];
    }
    return self;
}


- (ExaminationModel *)model
{
    if (_model == nil) {
        _model = [[ExaminationModel alloc] init];
    }
    return _model;
}

#pragma mark - 创建tableView
- (void)setTableView
{
    UITableView *tableView = [[UITableView alloc] init];
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
    bgImageView.image = [UIImage imageNamed:@"medicalSecondBg"];
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
    bottomImageView.frame = CGRectMake(0, searchBtn.bottom + 10 , SCREEN_WIDTH - QZMake(20) , SCREEN_WIDTH /10 );
    bottomImageView.image = [UIImage imageNamed:@"medicalSecondBottomBg"];
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MedicalCell *cell = [MedicalCell medicalCell];
    if (indexPath.row == 0) {
        cell.titleStr = @"身份证";
        cell.detailStr = self.model.id_card;
    }
    if (indexPath.row == 1) {
        cell.titleStr = @"体检机构";
        cell.detailStr = self.model.medical_institutions;
    }
    if (indexPath.row == 2) {
        cell.titleStr = @"联系电话";
        cell.detailStr = self.model.mobile;
    }
    if (indexPath.row == 3) {
        cell.titleStr = @"联系人";
        cell.detailStr = self.model.contact_name;
    }
    if (indexPath.row == 4) {
        cell.titleStr = @"地区";
        cell.detailStr = self.model.region;
    }
    if (indexPath.row == 5) {
        cell.titleStr = @"症状";
        cell.detailStr = self.model.disease_desc;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MedicalCell *cell = (MedicalCell *)[tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[MedicalCell class]]) {
        MedicalDemandSetInfoController *controller = [MedicalDemandSetInfoController controllerWithType:MedicalDemandSetInfoControllerTypeExamination medicalCell:cell andModel:self.model];
        [self.nav pushViewController:controller animated:YES];
    }
}


#pragma mark - 更新按钮状态
- (void)checkBtnStatus
{
    ExaminationModel *model = self.model;
    
    if (!model.id_card||!model.medical_institutions||!model.mobile||!model.contact_name||!model.region||!model.disease_desc) {
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
    
    ExaminationModel *model = self.model;
    
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    [UserOperation submitExamination:model Succeed:^{
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        self.searchBtn.enabled = YES;
        [ShareFunction showToast:@"提交成功"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.nav popViewControllerAnimated:YES];
        });
    } failed:^{
        self.searchBtn.enabled = YES;
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


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.tableView endEditing:YES];
}



@end
