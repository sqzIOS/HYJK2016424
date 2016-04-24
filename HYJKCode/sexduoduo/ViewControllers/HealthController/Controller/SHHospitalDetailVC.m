//
//  SHHospitalDetailVC.m
//  SexHealth
//
//  Created by ly1992 on 15/6/30.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHHospitalDetailVC.h"
#import "SHHospitalDetailHeaderView.h"
#import "SHHealthButton.h"
#import "SHDoctorDetailVC.h"

#define kIconWIDTH (SCREEN_WIDTH - (APP_SPACE(10) * 5))/4
#define kIconHEIGHT APP_SPACE(105)
@interface SHHospitalDetailVC ()
//
@property (nonatomic,strong) SHHospitalDetailHeaderView *headerView;
//
@property (nonatomic,strong) UIImageView *bgImageView;


@property (nonatomic,strong) NSMutableArray *doctorList;
@end

@implementation SHHospitalDetailVC
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
    
    [self initData];
    
    [self setTopNavView];
}

#pragma  mark ---UI
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.textColor = colorWith01;
    titleImgV.text = @"医院介绍";
    [navView addSubview:titleImgV];
    
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
}
- (void)initView
{
    CGFloat height = [SHHospitalDetailHeaderView getHospitalDetailHeaderViewHeightWithModel:_model];
    _headerView = [[SHHospitalDetailHeaderView alloc]init];
    _headerView.frame = CGRectMake(0, 44, SCREEN_WIDTH, height);
    [self.scrollView addSubview:_headerView];
    
    [_headerView refreshDataWithModel:_model];
    
    //推荐专家
    if (_bgImageView == nil) {
        UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, _headerView.bottom, SCREEN_WIDTH, APP_SPACE(45))];
        bgImageView.backgroundColor = colorWith05;
        [self.scrollView addSubview:bgImageView];
        
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor clearColor];
        label.text = NSLocalizedString(@"推荐专家", nil);
        label.font = Font_SuperLarge_bold;
        label.textColor = colorWith02;
        CGSize size = [LYGlobalDefine getTextContent:label.text withFont:label.font];
        label.frame = CGRectMake(APP_SPACE(15), (bgImageView.height - size.height)/2, size.width, size.height);
        [bgImageView addSubview:label];
        _bgImageView = bgImageView;
    }
    
    [self refreCommentData];
    
    
}

#pragma  mark ---data
- (void)initData
{
    NSDictionary *tempDic=@{@"hospitalId":self.model.idStr};
    [AFHTTPClient postJSONPath:SHINTERFACE_getHospitalDetail httpHost:sexHealthIP parameters:tempDic success:^(id responseObject) {
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
 
        
        
        SHNearbyHospitalInfo *info = [[SHNearbyHospitalInfo alloc] init];
        info.iconStr= [NSString stringWithFormat:@"%@", dic[@"datasource"][@"headimgurl"]];
        info.nameStr= [NSString stringWithFormat:@"%@", dic[@"datasource"][@"name"]];
        info.idStr = [NSString stringWithFormat:@"%@", dic[@"datasource"][@"hospitaId"]];
        info.addressStr = [NSString stringWithFormat:@"%@", dic[@"datasource"][@"address"]];
        info.contentStr = [NSString stringWithFormat:@"%@", dic[@"datasource"][@"introduce"]];

        self.doctorList = [[NSMutableArray alloc] initWithArray:dic[@"datasource"][@"doctorList"]];
        
        NSLog(@"医院详情 ---%@   %@---   医院详情 ",dic,info.contentStr);
        
        [self.headerView refreshDataWithModel:info];
        
        [self refreCommentData ];
    } fail:^{
        
    }];
}
- (void)refreCommentData
{
    
    if (!self.doctorList) {
        return;
    }
    
    int arrayCount= (int)self.doctorList.count;
    
    NSInteger index = arrayCount/4;
    if (arrayCount%4 != 0) {
        index ++;
    }
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, _bgImageView.bottom, SCREEN_WIDTH, (kIconHEIGHT + APP_SPACE(10))*index)];
    bottomView.backgroundColor = CLEAR_COLOR;
    [self.scrollView addSubview:bottomView];
    self.scrollView.contentSize = CGSizeMake(0, bottomView.bottom);
    
    
    for (int i = 0; i < self.doctorList.count; i++) {
        NSInteger row = i/4;
        NSInteger low = i%4;
        SHHealthButton *doctorBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        doctorBtn.frame = CGRectMake(APP_SPACE(10) + (kIconWIDTH + APP_SPACE(10)) * low, APP_SPACE(10) + (APP_SPACE(105) + APP_SPACE(10)) * row, kIconWIDTH, kIconHEIGHT);
        doctorBtn.backgroundColor = [UIColor clearColor];
        [doctorBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        doctorBtn.tag = i;
        [bottomView addSubview:doctorBtn];
        doctorBtn.layer.borderColor = colorWith05.CGColor;
        doctorBtn.layer.borderWidth = 2.0f;
        doctorBtn.layer.cornerRadius = 6.0f;
        doctorBtn.layer.masksToBounds = YES;
        
        if (self.doctorList[i][@"headimgurl"]  && ![self.doctorList[i][@"headimgurl"] isKindOfClass:[NSNull class]]&&   [self.doctorList[i][@"headimgurl"] hasPrefix:@"http://"]) {
            [doctorBtn.iconImageView sd_setImageWithURL:[NSURL URLWithString:self.doctorList[i][@"headimgurl"]]];
        }else
            doctorBtn.iconImageView.image = [UIImage imageNamed:@"doctor"];
        doctorBtn.iconImageView.size = doctorBtn.size;
        [doctorBtn addSubview:doctorBtn.iconImageView];
        doctorBtn.rightIconImageView.backgroundColor = RGBACOLOR(255, 255, 255, 0.8);
        doctorBtn.rightIconImageView.frame = CGRectMake(0, doctorBtn.height - APP_SPACE(25), doctorBtn.width, APP_SPACE(25));
        [doctorBtn addSubview:doctorBtn.rightIconImageView];
        
        doctorBtn.nameLabel.text = self.doctorList[i][@"name"];
        doctorBtn.nameLabel.textAlignment = NSTextAlignmentCenter;
        doctorBtn.nameLabel.frame = doctorBtn.rightIconImageView.frame;
        doctorBtn.nameLabel.textColor = colorWith02;
        doctorBtn.nameLabel.font = [UIFont systemFontOfSize:12.0f];
        [doctorBtn addSubview:doctorBtn.nameLabel];
    }
        
}

#pragma mark ---action 事件
- (void)bt_action_right
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bt_action_event:(UIButton*)sender
{
    NSInteger index = sender.tag;
    
    if(self.doctorList.count>index)
    {
        NSDictionary *dic=self.doctorList[index];
        [SHDoctorDetailVC gotoMySelf:self withModel:dic[@"doctorId"]];
    }
//    SHMydoctorInfo *model = _docData[indexPath.row];
//    [SHDoctorDetailVC gotoMySelf:self.mainVC withModel:model.nearbyDoctorId];
}

#pragma mark ---didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc withModel:(SHNearbyHospitalInfo*)model
{
    if (pvc == nil || model == nil) {
        return;
    }
    SHHospitalDetailVC* vc = [[SHHospitalDetailVC alloc]init];
    vc.model = model;
    
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}


@end
