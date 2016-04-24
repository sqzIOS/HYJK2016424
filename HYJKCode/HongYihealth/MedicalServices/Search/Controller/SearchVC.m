//
//  SearchVC.m
//  搜索以及纪录保存
//
//  Created by shown on 16/1/8.
//  Copyright (c) 2016年 shown. All rights reserved.
//  功能：搜索

#import "SearchVC.h"
#import "SearchHeadView.h"
#import "SearchTableView.h"

@interface SearchVC ()<SearchHeadViewDelegate>

@property (nonatomic, strong) SearchHeadView *headView;

@property (nonatomic, strong) SearchTableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *historyArr;   //历史数组

@property (nonatomic, strong) UIView *footView;

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIButton *clearBtn;

@property (nonatomic, strong) NSString *doctorName;

@property (nonatomic, strong) UIView *maskView; //蒙板

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTopUpiew];
    
    [self initData];
    
}
/**
 *  设置导航栏
 */
- (void)setTopUpiew {
    
    self.titleStr = @"搜索";
    self.isNeedBack = YES;
}

- (void)initData {
    
    if (_historyArr == nil) {
        _historyArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    NSData *hostoryData = [userD objectForKey:@"HistoryArr"];
    if (hostoryData) {
        NSArray *arr = [NSKeyedUnarchiver unarchiveObjectWithData:hostoryData];
        for (ConsultingModel *model in arr) {
            [_historyArr addObject:model];
        }
    }
    
    [self initView];
    
    
}

- (void)initView {
    if (!_tableView) {
        [self.view addSubview:self.tableView];
    }
    
    [self.view addSubview:self.maskView];
}

#pragma mark -- network

- (void)requestData {
    NSDictionary *tempDic = @{
                              @"filter":
                                  @{
                                      @"keywords":[NSString stringWithFormat:@"%@",_doctorName],
                                   },
                              @"pagination":
                                  @{
                                      @"page":[NSString stringWithFormat:@"%zi",1],
                                      @"count":@"10"
                                    }
                              };
    [MBHud showInView:self.view withTitle:@"请稍等..."];
    [AFHTTPClient postJSONPath:HONGYI_search httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
        
        NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
        NSArray *arr = dict[@"data"];
        if (arr.count > 0) {
            if (_dataArr.count > 0) {
                [self.dataArr removeAllObjects];
            }
            for (NSDictionary *dic in arr) {
                ConsultingModel *model = [[ConsultingModel alloc] init];
                model.goods_id = [NSString stringWithFormat:@"%@",dic[@"goods_id"]];
                model.doctoeHead = [NSString stringWithFormat:@"%@",dic[@"img"][@"small"]];
                model.shop_price = [NSString stringWithFormat:@"%@",dic[@"shop_price"]];
                model.market_price = [NSString stringWithFormat:@"%@",dic[@"market_price"]];
                
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
//                if (_historyArr.count > 0) {
//                    NSMutableArray *tempArr = _historyArr;
//                    int count = 0;
//                    for (int i =0; i < tempArr.count; i++) {
//                        ConsultingModel *model1 = tempArr[i];
//                        if ([model1.doctorName isEqualToString:model.doctorName]) {
//                            [self.historyArr replaceObjectAtIndex:i withObject:model];
//                        } else {
//                            count++;
//                            if (count == tempArr.count) {
//                                [self.historyArr addObject:model];
//                            }
//                        }
//                    }
//                } else {
//                    [self.historyArr addObject:model];
//                }
            }
//            [self historyData];
        } else {
            [self.dataArr removeAllObjects];
            [ShareFunction showToast:@"该医生不存在！"];
        }
        _tableView.dataArr = _dataArr;
        [_tableView reloadData];
        [MBHud removeFromView:self.view];
    } fail:^{
        [MBHud removeFromView:self.view];
    }];
}

- (void)historyData {
    _footView = nil;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_historyArr];
    //    NSArray *arr = [[NSArray alloc] initWithArray:_historyArr];
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    [userD setObject:data forKey:@"HistoryArr"];
    _tableView.tableFooterView = self.footView;
}

//#pragma mark --- <SearchTableViewDelegate>
//- (void)tableView:(UITableView *)tableView touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if (_headView.editF.editing)
//    {
//        [_headView.editF resignFirstResponder];
//    }
//}

#pragma mark -- btn action
/**
 *  清楚历史
 */
-(void)clearBtnAction {
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    NSData *data = [userD objectForKey:@"HistoryArr"];
    if (data) {
        [userD removeObjectForKey:@"HistoryArr"];
        [_historyArr removeAllObjects];
        _footView.height = MAKEOF5(70);
        _bgView.height = MAKEOF5(30);
        for (UIView *subView in _bgView.subviews) {
            if (![subView isEqual:_clearBtn]) {
                [subView removeFromSuperview];
            }
        }
        _clearBtn.top = _bgView.height - MAKEOF5(30);
    }
    _footView.height = 0;
    _footView.hidden = YES;
    _tableView.tableFooterView = self.footView;
    NSLog(@"清楚历史");
}

- (void)historyArrAction:(UIButton *)sender{
    UILabel *name = (UILabel *)[sender viewWithTag:sender.tag - 900];
    if (name) {
        _doctorName = name.text;
        [self requestData];
    }
}

//收缩键盘
- (void)tapAction
{
    _maskView.hidden = YES;
}

#pragma mark --- 通知
- (void)changeEidtText
{
    if (_headView.editF.text.length > 0)
    {
        [_headView.searchBtn setBackgroundImage:[UIImage imageNamed:@"srearch_p"] forState:UIControlStateNormal];
        _headView.searchBtn.enabled = YES;
    }
    else
    {
        [_headView.searchBtn setBackgroundImage:[UIImage imageNamed:@"srearch_n"] forState:UIControlStateNormal];
        _headView.searchBtn.enabled = NO;
    }
}

#pragma mark --- <SearchHeadViewDelegate>
- (void)showMaskView:(BOOL)isShow
{
    if (isShow)
    {
        _maskView.hidden = NO;
    }
    else
    {
        _maskView.hidden = YES;
    }
}

#pragma mark --- get

-(SearchHeadView *)headView {
    if (_headView == nil) {
        _headView = [[SearchHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
        _headView.headDelegate = self;
        //代码块
        __weak typeof(self)weakSelf = self;
        _headView.SearchHeadViewBlock = ^(NSString *doctorName) {
            weakSelf.doctorName = doctorName;
            [weakSelf requestData];
        };
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeEidtText) name:UITextFieldTextDidChangeNotification object:nil];
    }
    return _headView;
}

- (SearchTableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[SearchTableView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT - STAR_Y) style:UITableViewStylePlain Controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //        _tableView.tableViewDelegate = self;
        
        _tableView.tableHeaderView = self.headView;
//        _tableView.tableFooterView = self.footView;
    }
    return _tableView;
}

- (UIView *)footView {
    if (_footView == nil) {
        
        NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
        NSData *data = [userD objectForKey:@"HistoryArr"];
        NSArray *arr = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        //        NSArray *arr = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MAKEOF5(70) + arr.count * MAKEOF5(31))];
        
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, MAKEOF5(40), _footView.width, _footView.height - MAKEOF5(40))];
        _bgView.backgroundColor = WHITE_COLOR;
        
        CGSize size = CGSizeMake(0, 0);
        for (int i = 0; i < arr.count; i++) {
            ConsultingModel *model = arr[i];
            
            UIButton *historView = [UIButton buttonWithType:UIButtonTypeCustom];
            historView.frame = CGRectMake(0, MAKEOF5(31) * i, _bgView.width, MAKEOF5(30));
            [historView addTarget:self action:@selector(historyArrAction:) forControlEvents:UIControlEventTouchUpInside];
            historView.tag = 1000 + i;
            [_bgView addSubview:historView];
            
            UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MAKEOF5(20), historView.height/2. - MAKEOF5(11.5)/2., MAKEOF5(11), MAKEOF5(11.5))];
            headImageView.image = [UIImage imageNamed:@"search_min_head"];
            [historView addSubview:headImageView];
            
            //姓名
            UILabel *nameLab = [[UILabel alloc] init];
            nameLab.font = FONT_WITH_SIZE(MAKEOF5(11));
            nameLab.text = model.doctorName;
            size = [NSString getTextMultilineContent:nameLab.text withFont:nameLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24), MAXFLOAT)];
            nameLab.frame = CGRectMake(headImageView.right + MAKEOF5(12), historView.height/2. - size.height/2., size.width, size.height);
            nameLab.tag = i + 100;
            [historView addSubview:nameLab];
            
            //医院名称
            UILabel *lab = [[UILabel alloc] init];
            lab.text = model.doctor_hospital;
            lab.font = nameLab.font;
            size = [NSString getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(34) - nameLab.right, MAXFLOAT)];
            lab.frame = CGRectMake(nameLab.right + MAKEOF5(20), historView.height/2. - size.height/2., size.width, size.height);
            [historView addSubview:lab];
            
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, MAKEOF5(30), _bgView.width, MAKEOF5(1))];
            line.backgroundColor = colorWith05;
            [historView addSubview:line];
        }
        
        _clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearBtn.frame = CGRectMake(0, _bgView.height - MAKEOF5(30), _bgView.width, MAKEOF5(30));
        [_clearBtn setImage:[UIImage imageNamed:@"search_delete"] forState:UIControlStateNormal];
        [_clearBtn setTitle:@"清除全部浏览历史" forState:UIControlStateNormal];
        _clearBtn.titleLabel.font = FONT_WITH_SIZE(MAKEOF5(13));
        [_clearBtn setTitleColor:RGBCOLOR16(0x2fcc87) forState:UIControlStateNormal];
        [_clearBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, MAKEOF5(2), 0, MAKEOF5(-2))];
        [_clearBtn setImageEdgeInsets:UIEdgeInsetsMake(0, MAKEOF5(-2), 0, MAKEOF5(2))];
        [_clearBtn addTarget:self action:@selector(clearBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:_clearBtn];
        if (arr.count > 0) {
            _footView.hidden = NO;
        } else {
            _footView.hidden = YES;
        }
        
        [_footView addSubview:_bgView];
    }
    return _footView;
}
- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _dataArr;
}

- (NSMutableArray *)historyArr {
    if (_historyArr == nil) {
        _historyArr = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _historyArr;
}

- (UIView *)maskView
{
    if (_maskView == nil)
    {
        _maskView = [[UIView alloc] initWithFrame:self.view.bounds];
        _maskView.backgroundColor = colorWithClear;
        _maskView.hidden = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [_maskView addGestureRecognizer:tap];
    }
    return _maskView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

@end
