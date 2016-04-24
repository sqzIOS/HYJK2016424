//
//  SHConsultingViewController.m
//  sexduoduo
//
//  Created by shown on 15/9/28.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHConsultingViewController.h"
#import "SHConsultDetailViewController.h"
#import "SHConsultingCell.h"
#import "SHConsulting.h"

@interface SHConsultingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SHNavigationBar *navbar;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation SHConsultingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self.view addSubview:self.navbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initData{
    [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    [AFHTTPClient postJSONPath:SHINTERFACE_getConsultingList httpHost:sexHealthTestIP parameters:nil success:^(id responseObject) {
        NSDictionary *dataDict = [AFHTTPClient jsonTurnToDictionary:responseObject];
        NSLog(@"%@",dataDict);
        NSArray *dataArray = dataDict[@"datasource"];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in dataArray) {
            SHConsulting *consult = [SHConsulting consultingWithDict:dict];
            [tempArr addObject:consult];
        }
        self.dataArray = tempArr;
        [self.view addSubview:self.tableView];
        [MBHud removeFromView:self.view];
    } fail:^{
        [MBHud removeFromView:self.view];
    }];
}
#pragma mark - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SHConsultingCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SHConsultingCell class])];
    [cell loadWithConsult:self.dataArray[indexPath.row]];
    return cell;
}
#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SHConsultDetailViewController *vc = [[SHConsultDetailViewController alloc] initWithConsult:self.dataArray[indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [SHConsultingCell getCellHeight];
}
#pragma mark - UI
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[JFrame bound_status_navi] style:UITableViewStylePlain];
        _tableView.top = 64;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"SHConsultingCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([SHConsultingCell class])];
    }
    return _tableView;
}
- (SHNavigationBar *)navbar{
    if (!_navbar) {
        UIButton *btn_right = [[UIButton alloc] init];
        btn_right.backgroundColor = colorWith01;
        btn_right.layer.cornerRadius = 5;
        btn_right.layer.masksToBounds = YES;
        [btn_right setTitle:@"记录" forState:UIControlStateNormal];
        __weak SHConsultingViewController *weakSelf = self;
        _navbar = [[SHNavigationBar alloc] initWithTitle:@"患者咨询" rightBtn:btn_right leftClick:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } rightClick:^{
            
        }];
    }
    return _navbar;
}
#pragma mark - action
- (IBAction)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)record:(id)sender{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
