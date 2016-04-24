//
//  PhysicalDetailsVC.m
//  
//
//  Created by 刘朝涛 on 16/1/5.
//
//  功能：体检详情

#import "PhysicalDetailsVC.h"
#import "SuerOrderVC.h"
//#import "ProvinceModel.h"

@interface PhysicalDetailsVC ()<HeadViewDelegate>

@property (nonatomic, strong) DoctorDetailsTableView *tableView;

@property (nonatomic, strong) DoctorDetailsTableViewHeadView *headView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UIButton *selectTaBtn;    //选ta按钮

@end

@implementation PhysicalDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTopUpiew];
    
    [self initData];
}
/**
 *  设置导航栏
 */
- (void)setTopUpiew {
    
    self.titleStr = @"体检详情";
    self.isNeedBack = YES;
}

/**
 *  初始化数据
 */
- (void)initData {
    
    _model.doctor_hospital = @"长期从事外科临床医疗、教学、科研和医院管理工作。主持、参与完成省部级获奖科研10余项，在国际、国内专业学术期刊发表论文20余篇，主持编著论著1部。目前承担甘肃省科技重大专项项目和甘肃省自然科学基金项目3项。2005被确定为甘肃省“555”创新人才工程人选， 2009年被确定为甘肃省领军人才工程第一层次人选，2010被确定为享受国务院特殊津贴专家长期从事外科临床医疗、教学、科研和医院管理工作。主持、参与完成省部级获奖科研10余项，在国际、国内专业学术期刊发表论文20余篇，主持编著论著1部。目前承担甘肃省科技重大专项项目和甘肃省自然科学基金项目3项。2005被确定为甘肃省“555”创新人才工程人选， 2009年被确定为甘肃省领军人才工程第一层次人选，2010被确定为享受国务院特殊津贴专家";
    
    NSArray *arr = @[
                     @{@"nickName":@"教***", @"time":@"2015-04-09", @"disease":@"食道癌", @"content":@"医者仁心，万分感谢"},
                     @{@"nickName":@"教***", @"time":@"2015-04-09", @"disease":@"食道癌", @"content":@"医者仁心，万分感谢"},
                     @{@"nickName":@"教***", @"time":@"2015-04-09", @"disease":@"食道癌", @"content":@"医者仁心，万分感谢"},
                     @{@"nickName":@"教***", @"time":@"2015-04-09", @"disease":@"食道癌", @"content":@"医者仁心，万分感谢"},
                     @{@"nickName":@"教***", @"time":@"2015-04-09", @"disease":@"食道癌", @"content":@"医者仁心，万分感谢"}];
    for (NSDictionary *dic in arr) {
        UserEvaluateModel *model = [[UserEvaluateModel alloc] initWithDic:dic];
        [self.dataArr addObject:model];
    }
    
    [self initView];
}
/**
 *  初始化视图
 */
- (void)initView {
    if (_tableView == nil) {
        _tableView = [[DoctorDetailsTableView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT - MAKEOF5(42) - STAR_Y) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.tableHeaderView = self.headView;
        
        [self.view addSubview:self.selectTaBtn];
    }
    _tableView.dataArr = _dataArr;
    [_tableView reloadData];
}



#pragma mark -- get
- (DoctorDetailsTableViewHeadView *)headView {
    if (_headView == nil) {
        _headView = [[DoctorDetailsTableViewHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MAKEOF5(103)) Model:_model Type:ForPhysical];
        _headView.delegate = self;
    }
    return _headView;
}

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _dataArr;
}

- (UIButton *)selectTaBtn {
    if (_selectTaBtn == nil) {
        _selectTaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectTaBtn.frame = CGRectMake(0, SCREEN_HEIGHT - MAKEOF5(42), SCREEN_WIDTH, MAKEOF5(42));
        [_selectTaBtn setBackgroundImage:[UIImage imageNamed:@"ta"] forState:UIControlStateNormal];
        [_selectTaBtn addTarget:self action:@selector(selectTaBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectTaBtn;
}

#pragma mark --- action

- (void)selectTaBtnAction {
    
    SuerOrderVC *vc = [[SuerOrderVC alloc] init];
    vc.model = _model;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)changeHeight {
    self.tableView.tableHeaderView = self.headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
