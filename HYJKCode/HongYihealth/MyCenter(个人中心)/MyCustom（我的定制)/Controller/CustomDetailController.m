//
//  CustomDetailController.m
//  
//
//  Created by apple on 16/1/27.
//
//

#import "CustomDetailController.h"
#import "ExaminationModel.h"
#import "ServiceModel.h"
#import "MedicalCell.h"
#import "DescriptionCell.h"

@interface CustomDetailController () <UITableViewDataSource>

@property (nonatomic,strong) NSObject *model;
@property (nonatomic,weak) UITableView *tableView;

@end

@implementation CustomDetailController

+ (instancetype)controllerWithModel:(NSObject *)model
{
    CustomDetailController *controller = [[CustomDetailController alloc] init];
    controller.model = model;
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"医疗需求";
    
    [self createTableView];
}

- (void)createTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.userInteractionEnabled = NO;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.frame = CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.bottom);
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.model isKindOfClass:[ServiceModel class]]) {
        return 6;
    }
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSObject *model = self.model;
        NSString *status = [model performSelector:@selector(status)];
        NSString *custom_time = [model performSelector:@selector(custom_time)];
        NSString *update_time = [model performSelector:@selector(update_time)];
        cell.detailTextLabel.textColor = RGBCOLOR(84,198, 117);
        if (status.boolValue) {
            cell.detailTextLabel.text = @"已受理";
            cell.textLabel.text = update_time;
        } else {
            cell.detailTextLabel.text = @"未受理";
            cell.textLabel.text = custom_time;
        }
        return cell;
    }

    if ([self.model isKindOfClass:[ServiceModel class]]) {
        ServiceModel *model = (ServiceModel *)self.model;
        if (indexPath.row == 5) {
            DescriptionCell *cell = [DescriptionCell descriptionCellWithTitle:@"症状描述" andPlaceHolder:@"请输入症状描述"];
            cell.descriptionStr = model.disease_desc;
            return cell;
        }
        MedicalCell *cell = [MedicalCell medicalCell];
        if (indexPath.row == 1) {
            cell.detailStr = model.department;
            cell.titleStr = @"科室";
        }
        if (indexPath.row == 2) {
            cell.detailStr = model.region;
            cell.titleStr = @"地区";
        }
        if (indexPath.row == 3) {
            cell.detailStr = model.mobile;
            cell.titleStr = @"联系电话";
        }
        if (indexPath.row == 4) {
            cell.detailStr = model.contact_name;
            cell.titleStr = @"联系人";
        }
        return cell;
    } else {
        ExaminationModel *model = (ExaminationModel *)self.model;
        MedicalCell *cell = [MedicalCell medicalCell];
        if (indexPath.row == 1) {
            cell.detailStr = model.id_card;
            cell.titleStr = @"身份证";
        }
        if (indexPath.row == 2) {
            cell.detailStr = model.medical_institutions;
            cell.titleStr = @"体检机构";
        }
        if (indexPath.row == 3) {
            cell.detailStr = model.mobile;
            cell.titleStr = @"联系电话";
        }
        if (indexPath.row == 4) {
            cell.detailStr = model.contact_name;
            cell.titleStr = @"联系人";
        }
        if (indexPath.row == 5) {
            cell.detailStr = model.region;
            cell.titleStr = @"地区";
        }
        if (indexPath.row == 6) {
            cell.detailStr = model.disease_desc;
            cell.titleStr = @"症状";
        }
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.model isKindOfClass:[ServiceModel class]] && indexPath.row == 5) {
        return 150;
    }
    return 44;
}



@end
