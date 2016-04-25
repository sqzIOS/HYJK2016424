//
//  MedicalServicesVC.m
//
//
//  Created by 刘朝涛 on 16/1/1.
//
//  功能：医疗服务

#import "MedicalServicesVC.h"
#import "ConsultingVC.h"
#import "PhysicalVC.h"
#import "SearchVC.h"
#import "MedicalDemandController.h"
#import "CTBanner.h"

@interface MedicalServicesVC ()


@property (nonatomic, strong) CTBtn *needBtn;    //医疗需求

@property (nonatomic, strong) CTBtn *consultingBtn;  //预约咨询

@property (nonatomic, strong) CTBtn *physicaBtn;     //健康体检

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSString *searchType; //体检科室

@property (nonatomic, strong) CTBanner *bannerView;

@end

@implementation MedicalServicesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTopUpiew];
    
    self.automaticallyAdjustsScrollViewInsets = false;  //解决UIScrollView子视图位置不对问题
    
    [self initView];
    
    [self initData];
}
/**
 *  设置导航栏
 */
- (void)setTopUpiew {
    self.titleStr = @"弘医健康";
    self.isNeedBack = NO;
    
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.frame = CGRectMake(SCREEN_WIDTH - 50, 20,50,44);
    [rightBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:rightBtn];
}

- (void)rightBtnAction {
    SearchVC *vc = [[SearchVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)initData {
    
    [AFHTTPClient postJSONPath:HONGYI_DATA httpHost:BBS_IP parameters:nil success:^(id responseObject) {
        
        NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
        NSArray *arr = dict[@"data"][@"player"];
        self.searchType = [NSString stringWithFormat:@"%@",dict[@"data"][@"jiankangtijian"]];
        if (arr.count > 0) {
            for (NSDictionary *dic in arr) {
                NSString *imgPath = dic[@"photo"][@"thumb"];
                [self.dataArr addObject:imgPath];
            }
            _bannerView.imageArr = _dataArr;
        }
    } fail:^{
        
    }];
}

- (void)initView {

    [self.view addSubview:self.bannerView];
    
    //医疗需求
    self.needBtn = [[CTBtn alloc] init];
    self.needBtn.btnIcon.frame = CGRectMake(0, 0, MAKEOF5(58.5), MAKEOF5(59));
    self.needBtn.btnIcon.image = [UIImage imageNamed:@"health_need"];
    
    self.needBtn.btnTitle.frame = CGRectMake(0, _needBtn.btnIcon.bottom + MAKEOF5(12), MAKEOF5(59), MAKEOF5(20));
    self.needBtn.btnTitle.text = @"医疗需求";
    self.needBtn.btnTitle.font = FONT_WITH_SIZE(MAKEOF5(12));
    self.needBtn.btnTitle.textAlignment = NSTextAlignmentCenter;
    
    self.needBtn.frame = CGRectMake(MAKEOF5(20), _bannerView.bottom + _bannerView.height/2. - (_needBtn.btnIcon.height + _needBtn.btnTitle.height + MAKEOF5(12))/2., _needBtn.btnTitle.width, _needBtn.btnIcon.height + _needBtn.btnTitle.height + MAKEOF5(12));
//    self.needBtn.frame = CGRectMake(MAKEOF5(20), _bannerScrollView.bottom + _bannerScrollView.height - (_needBtn.btnIcon.height + _needBtn.btnTitle.height + MAKEOF5(12))/2., _needBtn.btnTitle.width, _needBtn.btnIcon.height + _needBtn.btnTitle.height + MAKEOF5(12));
    [self.needBtn addTarget:self action:@selector(needBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.needBtn];
    
    //预约咨询
    self.consultingBtn = [[CTBtn alloc] init];
    self.consultingBtn.btnIcon.frame = CGRectMake(0, 0, MAKEOF5(58.5), MAKEOF5(59));
    self.consultingBtn.btnIcon.image = [UIImage imageNamed:@"health_consulting"];
    
    self.consultingBtn.btnTitle.frame = CGRectMake(0, _consultingBtn.btnIcon.bottom + MAKEOF5(12), MAKEOF5(59), MAKEOF5(20));
    self.consultingBtn.btnTitle.text = @"预约咨询";
    self.consultingBtn.btnTitle.font = _needBtn.btnTitle.font;
    self.consultingBtn.btnTitle.textAlignment = NSTextAlignmentCenter;
    
    self.consultingBtn.frame = CGRectMake(SCREEN_WIDTH/2. - _consultingBtn.btnIcon.width/2., _needBtn.top, _consultingBtn.btnIcon.width, _needBtn.height);
    [self.consultingBtn addTarget:self action:@selector(consultingBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.consultingBtn];
    
    //健康体检
    self.physicaBtn = [[CTBtn alloc] init];
    self.physicaBtn.btnIcon.frame = CGRectMake(0, 0, MAKEOF5(59.5), MAKEOF5(59));
    self.physicaBtn.btnIcon.image = [UIImage imageNamed:@"health_physica"];
    
    self.physicaBtn.btnTitle.frame = CGRectMake(0, _physicaBtn.btnIcon.bottom + MAKEOF5(12), MAKEOF5(59), MAKEOF5(20));
    self.physicaBtn.btnTitle.text = @"健康体检";
    self.physicaBtn.btnTitle.font = _needBtn.btnTitle.font;
    self.physicaBtn.btnTitle.textAlignment = NSTextAlignmentCenter;
    
    self.physicaBtn.frame = CGRectMake(SCREEN_WIDTH - QZMake(20) - _needBtn.width, _needBtn.top, _needBtn.width, _needBtn.height);
    [self.physicaBtn addTarget:self action:@selector(physicaBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.physicaBtn];
}

#pragma mark --- btn action
/**
 *  医疗需求
 */
- (void)needBtnAction {
    MedicalDemandController *vc = [[MedicalDemandController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
/**
 *  预约咨询
 */
- (void)consultingBtnAction {
    ConsultingVC *vc = [[ConsultingVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
/**
 *  健康体检
 */
- (void)physicaBtnAction {
    PhysicalVC *vc = [[PhysicalVC alloc] init];
    vc.category_id = self.searchType;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --- bannerBlock


#pragma mark --- get

- (CTBanner *)bannerView
{
    if (_bannerView == nil) {
        _bannerView = [[CTBanner alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, (SCREEN_HEIGHT- STAR_Y - 49)/2.)];
    }
    return _bannerView;
}

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _dataArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
