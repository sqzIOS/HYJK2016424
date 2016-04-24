//
//  MyCenterController.m
//  
//
//  Created by wenzhizheng on 16/1/3.
//
//

#import "MyCenterController.h"
#import "UserOperation.h"

#import "PatientCaseController.h"
#import "MyBookingController.h"
#import "SettingMainController.h"
#import "CustomerServiceViewController.h"
#import "FeedBackController.h"
#import "MyfollowController.h"
#import "MyCenterCell.h"
#import "MyMessageController.h"
#import "MyAddressController.h"
#import "MyCustomController.h"
#import "PatientListController.h"
#import "TaoBaoWebViewController.h"
@interface MyCenterController () <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,weak) UIImageView *imageView; // 图像
@property (nonatomic,weak) UILabel *nameLabel;  // 姓名
@property (nonatomic,weak) UILabel *detailLabel; // 用户会员等级


@end

@implementation MyCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"个人中心";
    self.isNeedBack = NO;
    [self setTableView];
    
    [self setUserInfo];
    
    
    UIButton *codeBtn=[UIButton buttonWithType:0];
    [codeBtn setBackgroundImage:[UIImage imageNamed:@"mycenter_code"] forState:UIControlStateNormal];
    codeBtn.frame = CGRectMake(SCREEN_WIDTH - 45, self.topView.bottom - 30, 20, 20);
    [codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeBtn];
}


-(void)codeBtnClick:(id)sender
{
    TaoBaoWebViewController *ctrVc = [[TaoBaoWebViewController alloc] initWithNibName:@"TaoBaoWebViewController" bundle:nil];
    UserModel *userM=[UserOperation getUserFromeLocal];
    
    ctrVc.webURLStr=[NSString stringWithFormat:@"http://www.hyyl.cc/openapi/erweima.php?superior_id=%@",userM.ID];
    ctrVc.nameStr=@"我的二维码";
    [self.navigationController pushViewController:ctrVc animated:YES];
    
 
}

#pragma mark - 创建tableView
- (void)setTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.bounces = NO;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    CGFloat height = SCREEN_HEIGHT - 64;
    tableView.frame = CGRectMake(0,self.topView.bottom, SCREEN_WIDTH, height);
    tableView.dataSource = self;
    tableView.delegate = self;
    
    UIView *footView = [[UIView alloc] init];
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    footView.backgroundColor = [UIColor whiteColor];
    tableView.tableFooterView = footView;
    
    UIView *heardView = [[UIView alloc] init];
    heardView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    tableView.tableHeaderView = heardView;
    heardView.backgroundColor = AppColor;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    self.imageView = imageView;
    imageView.frame = CGRectMake(0, 0, 70, 70);
    imageView.center = CGPointMake(heardView.center.x, heardView.center.y - 20);
    imageView.layer.cornerRadius = 35;
    imageView.clipsToBounds = YES;
    [heardView addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLabel = nameLabel;
    nameLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 30);
    nameLabel.center = CGPointMake(imageView.center.x, imageView.center.y + 60);
    nameLabel.text = @"姓名";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [heardView addSubview:nameLabel];
    nameLabel.textColor = [UIColor whiteColor];
    
    UILabel *detailLabel = [[UILabel alloc] init];
    self.detailLabel = detailLabel;
    detailLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 20);
    detailLabel.center = CGPointMake(nameLabel.center.x, nameLabel.center.y + 20);
    detailLabel.text = @"补充信息";
    detailLabel.font = [UIFont systemFontOfSize:12];
    detailLabel.textAlignment = NSTextAlignmentCenter;
    [heardView addSubview:detailLabel];
    detailLabel.textColor = [UIColor whiteColor];
}

#pragma mark - 设置用户信息
- (void)setUserInfo
{
    UserModel *user = [UserOperation getUserFromeLocal];
    NSURL *url = [NSURL URLWithString:user.avatar];
    [self.imageView sd_setImageWithURL:url];
    
    self.nameLabel.text = user.nick_name;
    self.detailLabel.text = user.rank_name;
}

#pragma mark - tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 2;
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCenterCell *cell = [[MyCenterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.iconView.image = [UIImage imageNamed:@"myBooking"];
            cell.titleLabel.text = @"我的预约";
        }
        if (indexPath.row == 1) {
            cell.iconView.image = [UIImage imageNamed:@"myMedical"];
            cell.titleLabel.text = @"我的医疗需求";
        }
        if (indexPath.row == 2) {
            cell.iconView.image = [UIImage imageNamed:@"myMessage"];
            cell.titleLabel.text = @"我的通知";
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.iconView.image = [UIImage imageNamed:@"myFollow"];
            cell.titleLabel.text = @"我的关注";
        }
        if (indexPath.row == 1) {
            cell.iconView.image = [UIImage imageNamed:@"myContact"];
            cell.titleLabel.text = @"我的联系方式";
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.iconView.image = [UIImage imageNamed:@"patientCase"];
            cell.titleLabel.text = @"就诊人病例";
        }
        if (indexPath.row == 1) {
            cell.iconView.image = [UIImage imageNamed:@"myAdvise"];
            cell.titleLabel.text = @"意见反馈";
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            cell.iconView.image = [UIImage imageNamed:@"callphone"];
            cell.titleLabel.text = @"咨询电话";
        }
        if (indexPath.row == 1) {
            cell.iconView.image = [UIImage imageNamed:@"setting"];
            cell.titleLabel.text = @"设置";
        }
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return 0;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCenterCell *cell = (MyCenterCell *)[tableView cellForRowAtIndexPath:indexPath];
    UIViewController *vc;
    
    if ([cell.titleLabel.text isEqual:@"就诊人病例"]) {
        vc = [[PatientListController alloc] init];
    }
    if ([cell.titleLabel.text isEqual:@"我的预约"]) {
        vc = [[MyBookingController alloc] init];
    }
    if ([cell.titleLabel.text isEqual:@"设置"]) {
        vc = [[SettingMainController alloc] init];
    }
    if ([cell.titleLabel.text isEqual:@"咨询电话"]) {
        UIWebView *callWebView = [[UIWebView alloc] init];
        [self.view addSubview:callWebView];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",ServiceNumber]];
        NSURLRequest *callRequest = [NSURLRequest requestWithURL:url];
        [callWebView loadRequest:callRequest];
        return;
    }
    if ([cell.titleLabel.text isEqual:@"意见反馈"]) {
        vc = [[FeedBackController alloc] init];
    }
    if ([cell.titleLabel.text isEqual:@"我的关注"]) {
        vc = [[MyfollowController alloc] init];
    }
    if ([cell.titleLabel.text isEqual:@"我的通知"]) {
        vc = [[MyMessageController alloc] init];
    }
    if ([cell.titleLabel.text isEqual:@"我的联系方式"]) {
        vc = [[MyAddressController alloc] init];
    }
    if ([cell.titleLabel.text isEqual:@"我的医疗需求"]) {
        vc = [[MyCustomController alloc] init];
    }
    [self.navigationController pushViewController:vc animated:YES];

}



@end
