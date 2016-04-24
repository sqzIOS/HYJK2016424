//
//  SHMapVC.m
//  sexduoduo
//
//  Created by showm on 15/9/21.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHMapVC.h"

#import <BaiduMapAPI/BMapKit.h>
@interface SHMapVC ()<BMKMapViewDelegate,BMKLocationServiceDelegate>

@property (nonatomic,strong) BMKMapView *mapView;
@property (nonatomic,strong) BMKLocationService* locService;
//底部View
@property (nonatomic,strong) UIView *bottomView;
//医师 名
@property (nonatomic,strong) UILabel *nameLabel;
//医师 所在医院
@property (nonatomic,strong) UILabel *hospitalLabel;
//医师 距离
@property (nonatomic,strong) UILabel *spaceLabel;
//医师 地址
@property (nonatomic,strong) UILabel *addressLabel;
//到这去
@property (nonatomic,strong) SHMapButton *goBtn;
//选TA
@property (nonatomic,strong) SHMapButton *selectBtn;
//分割线
@property (nonatomic,strong) UIImageView *lineLowImageView;
@property (nonatomic,strong) UIImageView *lineRowImageView;

@end

@implementation SHMapVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = WHITE_COLOR;
    
    [self initMapView];

    
    [self setTopNavView];
    
    [self initView];

    
    [self initData];
//
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    // 此处记得不用的时候需要置nil，否则影响内存的释放
    _mapView.delegate = self;
    _locService.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    // 不用时，置nil
    _mapView.delegate = nil;
    _locService.delegate = nil;
    
    
}
#pragma mark ---UI

//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,self.view.frame.size.width, 64)];
    [self.view addSubview:navView];
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(160-92/3., 30, 92*2/3., 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"地图";
    [navView addSubview:titleImgV];
    
    //    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    rightBtn.frame = CGRectMake(278, 25 , 32, 32);
    //    [rightBtn setImage:[UIImage imageNamed:@"health_map"] forState:UIControlStateNormal];
    //    [rightBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
    //    rightBtn.tag = 1000;
    //    [navView addSubview:rightBtn];
    
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
    
}

- (void)initView
{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - APP_SPACE(135), SCREEN_WIDTH, APP_SPACE(135))];
        _bottomView.backgroundColor = RGBACOLOR(0, 0, 0, 0.8);
        [self.view addSubview:_bottomView];
        
        //名字
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.nameLabel.backgroundColor = [UIColor clearColor];
        self.nameLabel.font = Font_ExtraLarge_bold;
        self.nameLabel.textColor = colorWith01;
        [_bottomView addSubview:self.nameLabel];
        //医院
        self.hospitalLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.hospitalLabel.backgroundColor = [UIColor clearColor];
        self.hospitalLabel.font = Font_ExtraLarge_bold;
        self.hospitalLabel.textColor = colorWithLYWhite;
        [_bottomView addSubview:self.hospitalLabel];
        //距离
        self.spaceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.spaceLabel.backgroundColor = [UIColor clearColor];
        self.spaceLabel.font = Font_Middle;
        self.spaceLabel.textColor = colorWithLYWhite;
        [_bottomView addSubview:self.spaceLabel];
        //地址
        self.addressLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.addressLabel.backgroundColor = [UIColor clearColor];
        self.addressLabel.font = Font_Middle;
        self.addressLabel.textColor = colorWithLYWhite;
        [_bottomView addSubview:self.addressLabel];
        //分割线
        self.lineLowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(APP_SPACE(10), APP_SPACE(80), SCREEN_WIDTH - APP_SPACE(20), 1)];
        self.lineLowImageView.backgroundColor = colorWith05;
        [_bottomView addSubview:self.lineLowImageView];
        //到这去
        self.goBtn = [SHMapButton buttonWithType:UIButtonTypeCustom];
        self.goBtn.backgroundColor = [UIColor clearColor];
        self.goBtn.frame = CGRectMake(0, _bottomView.height - APP_SPACE(50), SCREEN_WIDTH/2 - 0.5, APP_SPACE(50));
        [self.goBtn addTarget:self action:@selector(bt_ation_event:) forControlEvents:UIControlEventTouchUpInside];
        self.goBtn.tag = 1000;
        [_bottomView addSubview:self.goBtn];
        UIImage *image = [UIImage imageNamed:@"health_go"];
        self.goBtn.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(APP_SPACE(60), (self.goBtn.height - image.size.height)/2, image.size.width, image.size.height)];
        self.goBtn.iconImageView.backgroundColor = [UIColor clearColor];
        self.goBtn.iconImageView.image = image;
        [self.goBtn addSubview:self.goBtn.iconImageView];
        self.goBtn.label = [[UILabel alloc]initWithFrame:CGRectZero];
        self.goBtn.label.backgroundColor = [UIColor clearColor];
        self.goBtn.label.font = Font_Small;
        self.goBtn.label.textColor = RGBCOLOR(13, 107, 46);;
        self.goBtn.label.text = NSLocalizedString(@"到这去", nil);
        CGSize size = [LYGlobalDefine getTextContent:self.goBtn.label.text withFont:self.goBtn.label.font];
        self.goBtn.label.frame = CGRectMake(self.goBtn.iconImageView.right + APP_SPACE(5), (self.goBtn.height - size.height)/2, size.width, size.height);
        [self.goBtn addSubview:self.goBtn.label];
        //
        self.lineRowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 0.5, self.lineLowImageView.bottom + APP_SPACE(10), 1, APP_SPACE(30))];
        self.lineRowImageView.backgroundColor = colorWith05;
        [_bottomView addSubview:self.lineRowImageView];
        //选TA
        self.selectBtn = [SHMapButton buttonWithType:UIButtonTypeCustom];
        self.selectBtn.backgroundColor = [UIColor clearColor];
        self.selectBtn.frame = CGRectMake(SCREEN_WIDTH/2 - 0.5, _bottomView.height - APP_SPACE(50), SCREEN_WIDTH/2 - 0.5, APP_SPACE(50));
        [self.selectBtn addTarget:self action:@selector(bt_ation_event:) forControlEvents:UIControlEventTouchUpInside];
        self.selectBtn.tag = 1001;
        [_bottomView addSubview:self.selectBtn];
        image = [UIImage imageNamed:@"health_call"];
        self.selectBtn.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(APP_SPACE(60), (self.selectBtn.height - image.size.height)/2, image.size.width, image.size.height)];
        self.selectBtn.iconImageView.backgroundColor = [UIColor clearColor];
        self.selectBtn.iconImageView.image = image;
        [self.selectBtn addSubview:self.selectBtn.iconImageView];
        self.selectBtn.label = [[UILabel alloc]initWithFrame:CGRectZero];
        self.selectBtn.label.backgroundColor = [UIColor clearColor];
        self.selectBtn.label.font = Font_Small;
        self.selectBtn.label.textColor = RGBCOLOR(13, 107, 46);
        self.selectBtn.label.text = NSLocalizedString(@"选TA", nil);
        size = [LYGlobalDefine getTextContent:self.goBtn.label.text withFont:self.goBtn.label.font];
        self.selectBtn.label.frame = CGRectMake(self.selectBtn.iconImageView.right + APP_SPACE(5), (self.selectBtn.height - size.height)/2, size.width, size.height);
        [self.selectBtn addSubview:self.selectBtn.label];
    }
}
///*
- (void)initMapView
{
    _mapView= m_appDelegate.mapView;
    
    [self.view addSubview:_mapView];
    
//    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    [self.view addSubview: mapView];
    
//    _locService = [[BMKLocationService alloc]init];
    
}

- (void)refreshView
{
    self.nameLabel.text = @"林大爷";
    CGSize size = [LYGlobalDefine getTextContent:self.nameLabel.text withFont:self.nameLabel.font];
    self.nameLabel.frame = CGRectMake(APP_SPACE(15), APP_SPACE(20), size.width, size.height);
    self.hospitalLabel.text = @"厦门大学附属医院";
    size = [LYGlobalDefine getTextContent:self.hospitalLabel.text withFont:self.hospitalLabel.font];
    self.hospitalLabel.frame = CGRectMake(self.nameLabel.right + APP_SPACE(10), self.nameLabel.top, size.width, size.height);
    self.spaceLabel.text = @"9.99km";
    size = [LYGlobalDefine getTextContent:self.spaceLabel.text withFont:self.spaceLabel.font];
    self.spaceLabel.frame = CGRectMake(self.nameLabel.left, self.nameLabel.bottom + APP_SPACE(10), size.width, size.height);
    self.addressLabel.text = @"漳浦霞美镇";
    size = [LYGlobalDefine getTextContent:self.addressLabel.text withFont:self.addressLabel.font];
    self.addressLabel.frame = CGRectMake(self.spaceLabel.right + APP_SPACE(10), self.spaceLabel.top, size.width, size.height);
}

#pragma mark ---Data
- (void)initData
{
    [self refreshView];
}
//开始定位
-(void)startLocation
{
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;                    //先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;                   //显示定位图层
    
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;
}
//停止定位
-(void)stopLocation
{
    [_locService stopUserLocationService];
    _mapView.showsUserLocation = NO;
}
#pragma mark ---action 事件
- (void)bt_ation_event:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        NSLog(@"到这去");
    } else if (index == 1001) {
        NSLog(@"选TA");
    }
}
- (void)bt_action_right
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark ---map delegate
/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}


//*/
#pragma mark ---didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc
{
    if (pvc == nil) {
        return;
    }
    SHMapVC* vc = [[SHMapVC alloc]init];
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}
@end

@implementation SHMapButton
@end

