//
//  SHConsultDetailViewController.m
//  sexduoduo
//
//  Created by shown on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//
#define kHeadViewHeight     35
#import "SHConsultDetailViewController.h"
#import "SHConsultDetailHeadView.h"
#import "SHConsulting.h"
@interface SHConsultDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) SHNavigationBar *navbar;
@property (nonatomic, strong) SHConsultDetailHeadView *tableViewHeadView;
@property (nonatomic, strong) UIView *v_sectionHeadView;
@property (nonatomic, strong) UIView *v_headUnderline;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) UIButton *btn_selected;

@property (nonatomic, strong) SHConsulting *consult;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *headButtonArray;
@end
@implementation SHConsultDetailViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.navbar];
    [self.view addSubview:self.tableView];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
- (instancetype)initWithConsult:(SHConsulting *)consult{
    if (self = [super init]) {
        self.consult = consult;
    }
    return self;
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
#pragma mark tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc] init];
}
#pragma mark tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kHeadViewHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.v_sectionHeadView;
}
#pragma mark -UI
- (SHNavigationBar *)navbar{
    if (!_navbar) {
        UIButton *btn_right = [[UIButton alloc] init];
        btn_right.backgroundColor = colorWith01;
        btn_right.layer.cornerRadius = 5;
        btn_right.layer.masksToBounds = YES;
        [btn_right setTitle:@"记录" forState:UIControlStateNormal];
        __weak SHConsultDetailViewController *weakSelf = self;
        _navbar = [[SHNavigationBar alloc] initWithTitle:@"问题详情" rightBtn:nil leftClick:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } rightClick:nil];
    }
    return _navbar;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[JFrame bound_status_navi] style:UITableViewStylePlain];
        _tableView.top = self.navbar.bottom;
        _tableView.tableHeaderView = self.tableViewHeadView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (SHConsultDetailHeadView *)tableViewHeadView{
    if (!_tableViewHeadView) {
        _tableViewHeadView = [[SHConsultDetailHeadView alloc] initWithConsult:self.consult];
    }
    return _tableViewHeadView;
}
- (UIView *)v_sectionHeadView{
    if (!_v_sectionHeadView) {
        _v_sectionHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35)];
        _v_sectionHeadView.backgroundColor = [UIColor whiteColor];
        UIButton *btn_docReplay = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2-0.5, _v_sectionHeadView.height)];
        btn_docReplay.selected = YES;
        self.btn_selected = btn_docReplay;
        [self setHeadBtnAttribute:btn_docReplay title:@"医师回复"];
        
        UIButton *btn_activity = [[UIButton alloc] initWithFrame:CGRectMake(btn_docReplay.right+1, 0, SCREEN_WIDTH/2-0.5, _v_sectionHeadView.height)];
        [self setHeadBtnAttribute:btn_activity title:@"用户互动"];
        self.headButtonArray = @[btn_docReplay,btn_activity];
        
        UIView *v_dash = [[UIView alloc] initWithFrame:CGRectMake(btn_docReplay.right, 5, 1, _v_sectionHeadView.height - 10)];
        v_dash.backgroundColor = colorWith05;
        
        self.v_headUnderline.top = btn_docReplay.bottom;
        
        UIView *v_bottom = [[UIView alloc] initWithFrame:CGRectMake(0, self.v_headUnderline.top, SCREEN_WIDTH, 1)];
        v_bottom.backgroundColor = colorWith05;
        
        [_v_sectionHeadView addSubview:btn_docReplay];
        [_v_sectionHeadView addSubview:btn_activity];
        [_v_sectionHeadView addSubview:v_dash];
        [_v_sectionHeadView addSubview:v_bottom];
        [_v_sectionHeadView addSubview:self.v_headUnderline];
        
    }
    return _v_sectionHeadView;
}
- (UIView *)v_headUnderline{
    if (!_v_headUnderline) {
        _v_headUnderline = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.5, 1)];
        _v_headUnderline.backgroundColor = RGBACOLOR(58, 226, 195, 1);
    }
    return _v_headUnderline;
}
#pragma mark - 私有方法
- (UIButton *)setHeadBtnAttribute:(UIButton *)button title:(NSString *)title{
    [button addTarget:self action:@selector(headButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:RGBACOLOR(58, 226, 195, 1) forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:colorWith02 forState:UIControlStateNormal];
    [button setTitleColor:colorWith01 forState:UIControlStateSelected];
    return button;
}
#pragma mark - action
- (IBAction)headButtonClick:(UIButton *)sender{
    if (sender.selected == YES) {
        return;
    }
    
    [UIView animateKeyframesWithDuration:0.25 delay:0 options:UIViewKeyframeAnimationOptionOverrideInheritedOptions animations:^{
        self.v_headUnderline.left = sender.left;
    } completion:^(BOOL finished) {
        sender.selected = YES;
        self.btn_selected.selected = NO;
        self.btn_selected = sender;
    }];
    
}

@end
