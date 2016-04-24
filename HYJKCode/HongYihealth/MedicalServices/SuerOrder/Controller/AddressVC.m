//
//  AddressVC.m
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能:预约地址

#import "AddressVC.h"
#import "UserOperation.h"
#import "AddressModel.h"

@interface AddressVC ()

//@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UIView *headView;

@property (nonatomic, strong) UILabel *locatingAddressLab;

//@property (nonatomic, strong) NSMutableArray *addressArr;

@end

@implementation AddressVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTopUpiew];
    
    [self initData];
    
    [self initView];
}
/**
 *  设置导航栏
 */
- (void)setTopUpiew {
    self.titleStr = @"预约地址";
    self.isNeedBack = YES;
    
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.frame = CGRectMake(SCREEN_WIDTH - 56, 20,50,44);
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = FONT_WITH_SIZE(MAKEOF5(15));
    [rightBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:rightBtn];
}

- (void)rightBtnAction {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_ADDRESS object:nil userInfo:@{@"hospitalName":[NSString stringWithFormat:@"%@",_tableView.selectedStr], @"idStr":[NSString stringWithFormat:@"%@",_tableView.idStr]}];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initData {
    
//    [self requestData];
}

- (void)initView {
    
    [self.view addSubview:self.tableView];
    self.tableView.dataArr = self.shopArr;
    [self.tableView reloadData];
}

//- (void)requestData {
//    [UserOperation getSession:^(NSDictionary *session) {
//        [MBHud showInView:self.view withTitle:@"请稍等..."];
//        NSDictionary *tempDic = @{
//                                  @"session":@{@"uid":[NSString stringWithFormat:@"%@",session[@"uid"]] ,@"sid":[NSString stringWithFormat:@"%@",session[@"sid"]]},
//                                  };
//        [AFHTTPClient postJSONPath:HONGYI_address_list httpHost:BBS_IP parameters:tempDic success:^(id responseObject) {
//            
//            NSDictionary *dict = [AFHTTPClient jsonTurnToDictionary:responseObject];
//            NSArray *arr = dict[@"data"];
//            if (arr.count > 0) {
//                for (NSDictionary *dic in arr) {
//                    AddressModel *model = [[AddressModel alloc] init];
//                    model.address = [NSString stringWithFormat:@"%@",dic[@"address"]];
//                    model.city = [NSString stringWithFormat:@"%@",dic[@"city_name"]];
//                    model.consignee = [NSString stringWithFormat:@"%@",dic[@"consignee"]];
//                    model.country = [NSString stringWithFormat:@"%@",dic[@"country_name"]];
//                    model.default_address = [NSString stringWithFormat:@"%@",dic[@"default_address"]];
//                    model.district = [NSString stringWithFormat:@"%@",dic[@"district_name"]];
//                    model.province = [NSString stringWithFormat:@"%@",dic[@"province_name"]];
//                    model.addressID = [NSString stringWithFormat:@"%@",dic[@"id"]];
//                    model.tel = [NSString stringWithFormat:@"%@",dic[@"tel"]];
//                    if([model.default_address intValue] == 1) {
//                        model.isSelected = YES;
//                    } else {
//                        model.isSelected = NO;
//                    }
//                    [self.addressArr addObject:model];
//                }
//                _tableView.dataArr = _addressArr;
//                [_tableView reloadData];
//            }
//            [MBHud removeFromView:self.view];
//            
//        } fail:^{
//            [MBHud removeFromView:self.view];
//            
//        }];
//    }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AddressTableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[AddressTableView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT - STAR_Y) style:UITableViewStylePlain];
//        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}

//- (NSMutableArray *)dataArr {
//    if (_dataArr == nil) {
//        _dataArr = [[NSMutableArray alloc] initWithCapacity:1];
//    }
//    return _dataArr;
//}

- (UIView *)headView {
    if (_headView == nil) {
        _headView = [[UIView alloc] init];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(MAKEOF5(12), MAKEOF5(12), MAKEOF5(10), MAKEOF5(13))];
        icon.image = [UIImage imageNamed:@"location"];
        [_headView addSubview:icon];
        
        _locatingAddressLab = [[UILabel alloc] init];
        _locatingAddressLab.text = @"当前位置: 思明区版和公路";
        _locatingAddressLab.textColor = RGBCOLOR16(0xd3d3d3);
        _locatingAddressLab.font = FONT_WITH_SIZE(MAKEOF5(12));
        CGSize size = [NSString getTextMultilineContent:self.locatingAddressLab.text withFont:self.locatingAddressLab.font withSize:CGSizeMake(SCREEN_WIDTH - MAKEOF5(24) - icon.right , MAXFLOAT)];
        _locatingAddressLab.frame = CGRectMake(icon.right + MAKEOF5(12), 0, size.width, size.height);
        _locatingAddressLab.centerY = icon.centerY;
        [_headView addSubview:_locatingAddressLab];
        
        UIView  *line = [[UIView alloc] initWithFrame:CGRectMake(0, icon.bottom + MAKEOF5(12), SCREEN_WIDTH, MAKEOF5(1))];
        line.backgroundColor = colorWith05;
        [_headView addSubview:line];
        
        _headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, line.bottom);
    }
    return _headView;
}

//- (NSMutableArray *)addressArr {
//    if (_addressArr == nil) {
//        _addressArr = [[NSMutableArray alloc] initWithCapacity:1];
//    }
//    return _addressArr;
//}

@end
