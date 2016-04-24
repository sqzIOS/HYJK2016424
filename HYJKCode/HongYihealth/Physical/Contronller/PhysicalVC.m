//
//  PhysicalVC.m
//  
//
//  Created by 刘朝涛 on 16/1/5.
//
//  功能：需求体检

#import "PhysicalVC.h"
#import "PhysicalTableView.h"
//#import "ConsultingTableView.h"
#import "DepatmentTableView.h"
#import "HospitalTableView.h"
#import "DeparmentModel.h"

@interface PhysicalVC ()

@property (nonatomic, strong) NSMutableArray *hosArr;   //医院数组

@property (nonatomic, strong) NSMutableArray *deparmentArr; //科室数组

@property (nonatomic, strong) DepatmentTableView *deparmentTableView;

@property (nonatomic, strong) HospitalTableView *hosTableView;

@property (nonatomic, strong) PhysicalTableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UIView *view1;    //

@property (nonatomic, strong) UIView *bgView;    //

@property (nonatomic, strong) CTBtn *selectedBtn;

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) int pageApp;

@property (nonatomic, strong) NSString *brand_id;    //城市id

@end

@implementation PhysicalVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTopUpiew];
    
    [self initView];

    [self initData];
}

/**
 *  设置导航栏
 */
- (void)setTopUpiew {
    
    self.titleStr = @"健康体检";
    self.isNeedBack = YES;
}

- (void)initData {
    
    [self requestData];
    
    [self requestDataWithDeparment];
    
    [self requestWithHospital];
    
    [self blockView];
}

- (void)initView {
    if (_view1 == nil) {
        [self.view addSubview:self.view1];
    }
    if (_tableView == nil) {
        _tableView = [[PhysicalTableView alloc] initWithFrame:CGRectMake(0, _view1.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - _view1.bottom) style:UITableViewStylePlain Controller:self];
        [self.view addSubview:_tableView];
        
        [_tableView clearDefaultLineByAddFootLine];
        
        [_tableView addHeaderWithTarget:self action:@selector(headRefresh)];
        
        [_tableView addFooterWithTarget:self action:@selector(footRefresh)];
        
        [self.view addSubview:self.bgView];
    }
    _tableView.dataArr = [[NSMutableArray alloc] initWithArray:_dataArr];
    [_tableView reloadData];
}

#pragma mark --- 网络请求

- (void)requestData {
    
    //    NSDictionary *dic1 =
    
    NSDictionary *tempDic = @{
                              @"filter":
                                  @{
                                      @"category_id":[NSString stringWithFormat:@"%@",_category_id],
                                      @"brand_id":[NSString stringWithFormat:@"%@",_brand_id]
                                      },
                              @"pagination":
                                  @{
                                      @"page":[NSString stringWithFormat:@"%zi",_pageApp],
                                      @"count":@"10"
                                      }
                              };
    [MBHud showInView:self.view withTitle:@"请稍等..."];
    [AFHTTPClient postJSONPath:HONGYI_search httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
        
        NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
        NSArray *arr = dict[@"data"];
        if (arr.count > 0) {
            if (_pageApp == 1) {
                [self.dataArr removeAllObjects];
            }
            for (NSDictionary *dic in arr) {
                ConsultingModel *model = [[ConsultingModel alloc] init];
                model.goods_id = [NSString stringWithFormat:@"%@",dic[@"goods_id"]];
                model.doctoeHead = [NSString stringWithFormat:@"%@",dic[@"img"][@"small"]];
                model.market_price = [NSString stringWithFormat:@"%@",dic[@"market_price"]];
                model.shop_price = [NSString stringWithFormat:@"%@",dic[@"shop_price"]];
                
                NSString *tempStr = [NSString stringWithFormat:@"%@",dic[@"name"]];
                if (tempStr.length > 0) {
                    if ([tempStr hasPrefix:@"vip"]) {
                        model.doctorName = tempStr;
                        model.doctor_hospital = tempStr;
                    } else {
                        NSRange range = [tempStr rangeOfString:@" "]; //现获取要截取的字符串位置
                        if (range.length != 0) {
                            NSString *str1 = [tempStr substringToIndex:range.location];
                            model.doctorName = str1;
                            NSString *str2 = [tempStr substringFromIndex:range.location+1];
                            model.doctor_hospital = str2;
                        } else {
                            model.doctorName = tempStr;
                            model.doctor_hospital = tempStr;
                        }
                    }
                }
                [self.dataArr addObject:model];
            }
        } else {
            [self.dataArr removeAllObjects];
        }
        _tableView.dataArr = _dataArr;
        [_tableView reloadData];
        [self endRefresh];
        [MBHud removeFromView:self.view];
    } fail:^{
        [self endRefresh];
        [MBHud removeFromView:self.view];
    }];
}

//获取科室
- (void)requestDataWithDeparment {
    
    [AFHTTPClient postJSONPath:HONGYI_category httpHost:BBS_IP parameters:nil success:^(id responseObject) {
        
        NSDictionary *dic = [AFHTTPClient jsonTurnToDictionary:responseObject];
        NSArray *arr = dic[@"data"];
        if (arr.count > 0) {
            for (NSDictionary *dic in arr) {
                //科室
                DeparmentModel *depModel = [[DeparmentModel alloc] init];
                depModel.category_img = [NSString stringWithFormat:@"%@",dic[@"category_img"]];
                depModel.deparmentId = [NSString stringWithFormat:@"%@",dic[@"id"]];
                depModel.name = [NSString stringWithFormat:@"%@",dic[@"name"]];
                [self.deparmentArr addObject:depModel];
            }
            _deparmentTableView.dataArr = _deparmentArr;
            [_deparmentTableView reloadData];
        }
    } fail:^{
        
    }];
}

- (void)requestWithHospital {
    
    [AFHTTPClient postJSONPath:HONGYI_brand httpHost:BBS_IP parameters:nil success:^(id responseObject) {
        
        NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
        NSArray *arr = dict[@"data"];
        if (arr.count > 0) {
            for (NSDictionary *dic in arr) {
                HospitalModel *model = [[HospitalModel alloc] init];
                model.brand_name = [NSString stringWithFormat:@"%@",dic[@"brand_name"]];
                model.brand_id = [NSString stringWithFormat:@"%@",dic[@"brand_id"]];
                model.hospitaL_url = [NSString stringWithFormat:@"%@",dic[@"url"]];
                [self.hosArr addObject:model];
            }
            _hosTableView.dataArr = _hosArr;
            [_hosTableView reloadData];
        }
        
    } fail:^{
        
    }];
}

/**
 *  代码块
 */
- (void)blockView {
    
    __weak typeof(self) weakSelf = self;
    _hosTableView.hosBlock = ^(NSIndexPath *indexPath) {
        _pageApp = 1;
        HospitalModel *model = weakSelf.hosArr[indexPath.row];
        _brand_id = model.brand_id;
        weakSelf.bgView.hidden = YES;
        [weakSelf changeBtnFrame:model.brand_name];
        [weakSelf requestData];
    };
    
    _deparmentTableView.deparmentBlock = ^(NSIndexPath *indexPath) {
        _pageApp = 1;
        DeparmentModel *model = weakSelf.deparmentArr[indexPath.row];
        _category_id = model.deparmentId;
        weakSelf.bgView.hidden = YES;
        [weakSelf changeBtnFrame:model.name];
        [weakSelf requestData];
    };
}

#pragma mark --- btn action

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView *view = [_bgView viewWithTag:2500];
    if (view) {
        _bgView.hidden = YES;
        _isSelected = NO;
    }
}

- (void)btnAction:(CTBtn *)sender {
    if (_isSelected && [_selectedBtn isEqual:sender]) {
        _bgView.hidden = YES;
        _selectedBtn = sender;
        _isSelected = NO;
        return;
    }
    _isSelected = YES;
    _selectedBtn = sender;
    _bgView.hidden = NO;
    [self hiddenView:sender];
}

- (void)changeBtnFrame:(NSString *)str {
    _selectedBtn.btnTitle.text = str;
    CGSize size = [NSString getTextMultilineContent:_selectedBtn.btnTitle.text withFont:_selectedBtn.btnTitle.font withSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
//    CGSize size2 = [NSString getTextMultilineContent:@"北京市北京市" withFont:_selectedBtn.btnTitle.font withSize:CGSizeMake(SCREEN_WIDTH/4., MAXFLOAT)];
//    if (str.length > 3) {
//        size = [NSString getTextMultilineContent:_selectedBtn.btnTitle.text withFont:_selectedBtn.btnTitle.font withSize:CGSizeMake(size2.width, MAXFLOAT)];
//    }
    _selectedBtn.btnTitle.frame = CGRectMake(_selectedBtn.width/2. - size.width/2., 0, size.width, _selectedBtn.height);
    _selectedBtn.btnIcon.frame = CGRectMake(_selectedBtn.btnTitle.right + MAKEOF5(2), _selectedBtn.btnTitle.height/2. - MAKEOF5(5.5)/2., MAKEOF5(9.5), MAKEOF5(5.5));
}

- (void)hiddenView:(CTBtn *)sender {
    switch (sender.tag) {
        case 1000:
        {
            _hosTableView.hidden = NO;
            _deparmentTableView.hidden = YES;
        }
            break;
        case 1001:
        {
            _hosTableView.hidden = YES;
            _deparmentTableView.hidden = NO;
        }
            break;
        default:
            break;
    }
}

#pragma mark --- refresh
/**
 *  下拉刷新
 */
-(void)headRefresh
{
    _pageApp = 1;
    [self requestData];
}
/**
 *  上拉刷新
 */
-(void)footRefresh
{
    _pageApp += 1;
    if (_dataArr.count % 10 == 0) {
        [self requestData];
    }
    [_tableView footerEndRefreshing];
}

- (void)endRefresh {
    [_tableView headerEndRefreshing];
    [_tableView footerEndRefreshing];
}

#pragma mark --- get
- (UIView *)view1 {
    if (_view1 == nil) {
        _view1 = [[UIView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, MAKEOF5(30))];
        _view1.backgroundColor = WHITE_COLOR;
        NSArray *titleArr = @[@"体检中心"];
        for (int i = 0; i < titleArr.count; i++) {
            CTBtn *btn = [[CTBtn alloc] init];
            btn.frame = CGRectMake(i * SCREEN_WIDTH/2., 0, SCREEN_WIDTH, _view1.height);
            btn.tag = 1000 + i;
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [_view1 addSubview:btn];
            
            btn.btnTitle.text = titleArr[i];
            btn.btnTitle.font = FONT_WITH_SIZE(MAKEOF5(10));
            btn.btnTitle.textAlignment = NSTextAlignmentCenter;
            btn.btnTitle.numberOfLines = 0;
            CGSize size = [NSString getTextMultilineContent:btn.btnTitle.text withFont:btn.btnTitle.font withSize:CGSizeMake(SCREEN_WIDTH/4., MAXFLOAT)];
            btn.btnTitle.frame = CGRectMake(btn.width/2. - size.width/2., 0, size.width, btn.height);
            btn.btnTitle.textColor = RGBCOLOR16(0xcfcfcf);
            
            btn.btnIcon.image = [UIImage imageNamed:@"feather"];
            btn.btnIcon.frame = CGRectMake(btn.btnTitle.right + MAKEOF5(2), btn.btnTitle.height/2. - MAKEOF5(5.5)/2., MAKEOF5(9.5), MAKEOF5(5.5));
            
            //分割线
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(btn.right - MAKEOF5(0.5), MAKEOF5(5), MAKEOF5(1), MAKEOF5(20))];
            line.backgroundColor = RGBCOLOR16(0xcfcfcf);
            [_view1 addSubview:line];
        }
        //分割线
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _view1.height - MAKEOF5(1), _view1.width, MAKEOF5(1))];
        line.backgroundColor = colorWith05;
        [_view1 addSubview:line];
    }
    return _view1;
}

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _dataArr;
}

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, _view1.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - _view1.bottom)];
        _bgView.backgroundColor = colorWithClear;
        _bgView.hidden = YES;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _bgView.width, _bgView.height)];
        view.backgroundColor = BLACK_COLOR;
        view.alpha = 0.4f;
        view.tag = 2500;
        [_bgView addSubview:view];
        
        [_bgView addSubview:self.hosTableView];
        [_bgView addSubview:self.deparmentTableView];
    }
    return _bgView;
}

- (HospitalTableView *)hosTableView {
    if (_hosTableView == nil) {
        _hosTableView = [[HospitalTableView alloc] initWithFrame:CGRectMake(0, 0, _bgView.width, 220) style:UITableViewStylePlain Arr:nil];
        _hosTableView.hidden = YES;
    }
    return _hosTableView;
}

- (DepatmentTableView *)deparmentTableView {
    if (_deparmentTableView == nil) {
        _deparmentTableView = [[DepatmentTableView alloc] initWithFrame:CGRectMake(0, 0, _bgView.width, 220) style:UITableViewStylePlain Arr:_deparmentArr];
        _deparmentTableView.hidden = YES;
    }
    return _deparmentTableView;
}

- (NSMutableArray *)deparmentArr {
    if (_deparmentArr == nil) {
        _deparmentArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _deparmentArr;
}

- (NSMutableArray *)hosArr {
    if (_hosArr == nil) {
        _hosArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _hosArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
