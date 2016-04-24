//
//  SHHealthScrollView.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHHealthScrollView.h"
#import "SHHealthHeaderView.h"
#import "SHHealthButton.h"
#import "SHHealthSubBottomView.h"
#import "SHCopeVC.h"
#import "SHDiagnoseVC.h"
#import "SHVIPVC.h"
#import "SHPsychologyVC.h"
#import "SHHospitalDetailVC.h"
#import "LYAreaView.h"
#import "SHNearbyHospitalVC.h"
#import "SHNearbyDoctorVC.h"
#import "SHHealthModel.h"
#import "SHDoctorDetailVC.h"
#import "SHHospitalDetailVC.h"
#import "BrowserWebVC.h"  //todo

#import "SHDCVisitVC.h"
#import "SHDCPictureTextVC.h"
#import "SHPaperConsultVC.h"

#define kDoctorIndex 2000
#define kHospitalIndex 3000


@interface SHHealthScrollView()
//tableHeaderView
@property (nonatomic,strong) UIView *headerView;
//广告区域
@property (nonatomic,strong) SHHealthHeaderView *headerADView;
//中间 区域
@property (nonatomic,strong) UIView *middleView;
//推荐医师
@property (nonatomic,strong) SHHealthSubBottomView *doctorView;
//推荐医院
@property (nonatomic,strong) SHHealthSubBottomView *hospitalView;
/**
 *  数据
 */
@property (nonatomic,strong) SHHealthDoctorModel *docModel;
@property (nonatomic,strong) NSMutableArray *docData;
//
@property (nonatomic,strong) SHHealthHospitalModel *hosModel;
@property (nonatomic,strong) NSMutableArray *hosData;

@end

@implementation SHHealthScrollView

- (id)initWithMineScrollView:(NSArray*)tvData withFrame:(CGRect)frame withVC:(UIViewController*)VC
{
    if(self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.delegate = self;
        self.delegate = self;
        self.frame = frame;
        self.mainVC = VC;
        
        [self initView];
        
        [self initData];
    }
    return self;
}
#pragma mark ---UI
- (void)initView
{
    if (_headerADView == nil) {
        _headerADView = [[SHHealthHeaderView alloc]initWithFrameAndType:CGRectMake(0, 0, SCREEN_WIDTH, 120) pvc:self.mainVC];
        [self addSubview:_headerADView];
    }
    if (_middleView == nil) {
        _middleView = [[UIView alloc]initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, 220)];
        _middleView.backgroundColor = colorWithClear;
        [self addSubview:_middleView];
        //免费咨询
        SHHealthButton *consultBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        consultBtn.backgroundColor = RGBCOLOR16(0x2be3c3);
        consultBtn.layer.cornerRadius = 4.0f;
        consultBtn.layer.masksToBounds = YES;
        consultBtn.frame = CGRectMake(QZMake(12), 10, QZMake(172), QZMake(90));
        [consultBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        [consultBtn setImage:UIImageByName(@"btn_consult_n") forState:UIControlStateNormal];
        [consultBtn setImage:UIImageByName(@"btn_consult_p") forState:UIControlStateHighlighted];
        
        
        consultBtn.tag = 1000;
        [_middleView addSubview:consultBtn];

        
        //自我诊断
        SHHealthButton *diagnoseBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        diagnoseBtn.frame = CGRectMake(consultBtn.left, consultBtn.bottom + 5, QZMake(83), QZMake(90));
        diagnoseBtn.backgroundColor = RGBCOLOR16(0xfba78a);
        diagnoseBtn.layer.cornerRadius = 4.0f;
        diagnoseBtn.layer.masksToBounds = YES;
        [diagnoseBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        [diagnoseBtn setImage:UIImageByName(@"btn_diagnosis_n") forState:UIControlStateNormal];
        [diagnoseBtn setImage:UIImageByName(@"btn_diagnosis_p") forState:UIControlStateHighlighted];
        diagnoseBtn.tag = 1001;
        [_middleView addSubview:diagnoseBtn];

        
        //科普知识
        SHHealthButton *popuBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        popuBtn.frame = CGRectMake(diagnoseBtn.right + 5, diagnoseBtn.top, QZMake(83), QZMake(90));
        popuBtn.backgroundColor = RGBCOLOR16(0xff8f80);
        popuBtn.layer.cornerRadius = 4.0f;
        popuBtn.layer.masksToBounds = YES;
        [popuBtn setImage:UIImageByName(@"btn_knowledge_n") forState:UIControlStateNormal];
        [popuBtn setImage:UIImageByName(@"btn_knowledge_p") forState:UIControlStateHighlighted];
        [popuBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        popuBtn.tag = 1002;
        [_middleView addSubview:popuBtn];

        
        //VIP服务
        SHHealthButton *vipBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        vipBtn.backgroundColor = RGBCOLOR16(0x59d9a4);
        vipBtn.layer.cornerRadius = 4.0f;
        vipBtn.layer.masksToBounds = YES;
        vipBtn.frame = CGRectMake(QZMake(375-12-345/2.), 10, QZMake(345/2.), QZMake(371/2.));
        [vipBtn setImage:UIImageByName(@"btn_vip_n") forState:UIControlStateNormal];
        [vipBtn setImage:UIImageByName(@"btn_vip_p") forState:UIControlStateHighlighted];
        [vipBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        vipBtn.tag = 1003;
        [_middleView addSubview:vipBtn];

        
        //心理咨询
        SHHealthButton *loveBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        loveBtn.frame = CGRectMake(consultBtn.left, vipBtn.bottom + 10, QZMake(701/2.), QZMake(137/2.));
//        loveBtn.backgroundColor = RGBCOLOR16(0xf2be3c3);
        loveBtn.layer.cornerRadius = 4.0f;
        loveBtn.layer.masksToBounds = YES;
        [loveBtn setImage:UIImageByName(@"bg_column") forState:UIControlStateNormal];
        [loveBtn setImage:UIImageByName(@"bg_column") forState:UIControlStateHighlighted];
        
        [loveBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        loveBtn.tag = 1004;
        [_middleView addSubview:loveBtn];
        
        
        _middleView.height = loveBtn.bottom;
        
        
        loveBtn.useLabel.text = NSLocalizedString(@"透露夫妻性生活融洽的秘诀~~", nil);
        loveBtn.useLabel.font = Font_Middle;
        CGSize size = [LYGlobalDefine getTextContent:loveBtn.useLabel.text withFont:loveBtn.useLabel.font];
        loveBtn.useLabel.frame = CGRectMake(30, 10, size.width, size.height);
        [loveBtn addSubview:loveBtn.useLabel];
        
        loveBtn.contentLabel.text = NSLocalizedString(@"两性话题，最佳避孕方法", nil);
        loveBtn.contentLabel.font = Font_Middle;
        size = [LYGlobalDefine getTextContent:loveBtn.contentLabel.text withFont:loveBtn.contentLabel.font];
        loveBtn.contentLabel.frame = CGRectMake(50, loveBtn.useLabel.bottom+5, size.width, size.height);
        [loveBtn addSubview:loveBtn.contentLabel];
        
    }
    
    if (_doctorView == nil) {
        _doctorView = [[SHHealthSubBottomView alloc]initWithFrame:CGRectMake(0,_middleView.bottom, SCREEN_WIDTH, APP_SPACE(145))];
        _doctorView.backgroundColor = colorWithClear;
        [self addSubview:_doctorView];
        
        //图标
        UIImage *image = [UIImage imageNamed:@"ic_doctor"];
        _doctorView.topIconImageView.image = image;
        _doctorView.topIconImageView.frame = CGRectMake(QZMake(12), 8, QZMake(40/2),QZMake(40/2));
        [_doctorView addSubview:_doctorView.topIconImageView];
        _doctorView.recommendLabel.text = NSLocalizedString(@"推荐医师", nil);
        _doctorView.recommendLabel.font = Font_Large;
        
        CGSize size = [LYGlobalDefine getTextContent:_doctorView.recommendLabel.text withFont:_doctorView.recommendLabel.font];
        _doctorView.recommendLabel.frame = CGRectMake(_doctorView.topIconImageView.right + 10, _doctorView.topIconImageView.top, size.width, size.height);
        _doctorView.recommendLabel.top = _doctorView.topIconImageView.centerY - size.height/2.;
        [_doctorView addSubview:_doctorView.recommendLabel];
        
        
        //分割线
        _doctorView.lineIconImageView.frame = CGRectMake(0,_doctorView.topIconImageView.bottom + 8, _doctorView.width , 1);
        [_doctorView addSubview:_doctorView.lineIconImageView];
        
        //附近
        _doctorView.nearbyLabel.text = NSLocalizedString(@"附近", nil);
        _doctorView.nearbyLabel.font = [UIFont systemFontOfSize:12.0];
        size = [LYGlobalDefine getTextContent:_doctorView.recommendLabel.text withFont:_doctorView.recommendLabel.font];
        _doctorView.nearbyLabel.frame = CGRectMake(20, - 4, size.width, size.height);
        [_doctorView.bgIconImageView addSubview:_doctorView.nearbyLabel];
        
        image = [UIImage imageNamed:@"ic_location"];
        _doctorView.bgIconImageView.image = image;
        _doctorView.bgIconImageView.frame = CGRectMake(_doctorView.width - size.width+10, _doctorView.topIconImageView.top+3 , image.size.width,image.size.height);
        [_doctorView addSubview:_doctorView.bgIconImageView];
        
        
        //scrollView
        _doctorView.subScrollView.frame = CGRectMake(0, _doctorView.lineIconImageView.bottom, SCREEN_WIDTH, 140);
        _doctorView.subScrollView.backgroundColor = [UIColor clearColor];
        [_doctorView addSubview:_doctorView.subScrollView];
        LYButtonArea *doctorBtn = [LYButtonArea buttonWithType:UIButtonTypeCustom];
//        doctorBtn.frame = _doctorView.bgIconImageView.frame;
        doctorBtn.frame = CGRectMake(0, 0, 44, 44);
        doctorBtn.left = _doctorView.bgIconImageView.left;
        doctorBtn.backgroundColor = [UIColor clearColor];
        [doctorBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        doctorBtn.tag = 1005;
        [_doctorView addSubview:doctorBtn];
        
        _doctorView.height =_doctorView.subScrollView.bottom;
    }
    
    if (_hospitalView == nil) {
        _hospitalView = [[SHHealthSubBottomView alloc]initWithFrame:CGRectMake(0, _doctorView.bottom, SCREEN_WIDTH, APP_SPACE(110))];
        _hospitalView.backgroundColor = colorWithClear;
        [self addSubview:_hospitalView];
        
        //图标
        UIImage *image = [UIImage imageNamed:@"ic_hospital"];
        _hospitalView.topIconImageView.image = image;
        _hospitalView.topIconImageView.frame = CGRectMake(APP_SPACE(15), APP_SPACE(8), image.size.width,image.size.height);
        [_hospitalView addSubview:_hospitalView.topIconImageView];
        _hospitalView.recommendLabel.text = NSLocalizedString(@"推荐医院", nil);
        _hospitalView.recommendLabel.font = Font_Large;
        CGSize size = [LYGlobalDefine getTextContent:_hospitalView.recommendLabel.text withFont:_hospitalView.recommendLabel.font];
        _hospitalView.recommendLabel.frame = CGRectMake(_hospitalView.topIconImageView.right + APP_SPACE(10), _doctorView.topIconImageView.top, size.width, size.height);
        [_hospitalView addSubview:_hospitalView.recommendLabel];
        
        //分割线
        _hospitalView.lineIconImageView.frame = CGRectMake(0,_hospitalView.topIconImageView.bottom + 8, _hospitalView.width , APP_SPACE(1));
        [_hospitalView addSubview:_hospitalView.lineIconImageView];
        
        //附近
        _hospitalView.nearbyLabel.text = NSLocalizedString(@"附近", nil);
        _hospitalView.nearbyLabel.font = [UIFont systemFontOfSize:12.0];
        size = [LYGlobalDefine getTextContent:_hospitalView.recommendLabel.text withFont:_hospitalView.recommendLabel.font];
        _hospitalView.nearbyLabel.frame = CGRectMake(APP_SPACE(20), - APP_SPACE(4), size.width, size.height);
        [_hospitalView.bgIconImageView addSubview:_hospitalView.nearbyLabel];
        
        image = [UIImage imageNamed:@"ic_location"];
        _hospitalView.bgIconImageView.image = image;
        _hospitalView.bgIconImageView.frame = CGRectMake(_hospitalView.width - size.width+10, _hospitalView.topIconImageView.top +3, image.size.width,image.size.height);
        [_hospitalView addSubview:_hospitalView.bgIconImageView];
        
        
        //scrollView
        _hospitalView.subScrollView.frame = CGRectMake(0, _hospitalView.lineIconImageView.bottom, SCREEN_WIDTH, APP_SPACE(100));
        [_hospitalView addSubview:_hospitalView.subScrollView];
        
        LYButtonArea *doctorBtn = [LYButtonArea buttonWithType:UIButtonTypeCustom];
        doctorBtn.frame = CGRectMake(0, 0, 44, 44);
        doctorBtn.left = _hospitalView.bgIconImageView.left;
        
        doctorBtn.backgroundColor = [UIColor clearColor];
        [doctorBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
        doctorBtn.tag = 1006;
        [_hospitalView addSubview:doctorBtn];
        
        _hospitalView.height =_hospitalView.subScrollView.bottom;

        
    }
    [self setContentSize:CGSizeMake(0, _hospitalView.bottom + APP_SPACE(10))];
    
    
    
}


-(void)refreshView
{
    UIButton *btn1 = (UIButton *)[_middleView viewWithTag:1000];//免费咨询 和 医师端的 义诊
    
    UIButton *btn2 = (UIButton *)[_middleView viewWithTag:1001];//自我诊断 和 医师端的 诊所
    UIButton *btn3 = (UIButton *)[_middleView viewWithTag:1002];//科普知识 和 医师端的 我的病人
    UIButton *btn4 = (UIButton *)[_middleView viewWithTag:1003];// vip服务 和 医师端的 抢答
    SHHealthButton *btn5 = (SHHealthButton *)[_middleView viewWithTag:1004];//心理咨询  和 医师端的 论文议题
    
    
    if(IS_Doctor)//医师端
    {
        [btn1 setImage:UIImageByName(@"btn_thhe-clinic_n") forState:UIControlStateNormal];
        [btn1 setImage:UIImageByName(@"btn_thhe-clinic_p") forState:UIControlStateHighlighted];
        
        [btn2 setImage:UIImageByName(@"btn_clinic_n") forState:UIControlStateNormal];
        [btn2 setImage:UIImageByName(@"btn_clinic_p") forState:UIControlStateHighlighted];
        
        [btn3 setImage:UIImageByName(@"btn_my-patient_n") forState:UIControlStateNormal];
        [btn3 setImage:UIImageByName(@"btn_my-patient_p") forState:UIControlStateHighlighted];
        
        [btn4 setImage:UIImageByName(@"btn_answer_n") forState:UIControlStateNormal];
        [btn4 setImage:UIImageByName(@"btn_answer_p") forState:UIControlStateHighlighted];
        
        [btn5 setImage:UIImageByName(@"bg_yiwen") forState:UIControlStateNormal];
        
        btn5.contentLabel.text = @"论文议题";
        CGSize size = [LYGlobalDefine getTextContent:btn5.contentLabel.text withFont:btn5.contentLabel.font];
        btn5.contentLabel.frame = CGRectMake(50, btn5.useLabel.bottom+5, size.width, size.height);
        btn5.contentLabel.center = CGPointMake(btn5.width/2., btn5.height/2.);
        btn5.useLabel.hidden = YES;
        
    }else
    {
        [btn1 setImage:UIImageByName(@"btn_consult_n") forState:UIControlStateNormal];
        [btn1 setImage:UIImageByName(@"btn_consult_p") forState:UIControlStateHighlighted];
        
        [btn2 setImage:UIImageByName(@"btn_diagnosis_n") forState:UIControlStateNormal];
        [btn2 setImage:UIImageByName(@"btn_diagnosis_p") forState:UIControlStateHighlighted];
        
        [btn3 setImage:UIImageByName(@"btn_knowledge_n") forState:UIControlStateNormal];
        [btn3 setImage:UIImageByName(@"btn_knowledge_p") forState:UIControlStateHighlighted];
        
        [btn4 setImage:UIImageByName(@"btn_vip_n") forState:UIControlStateNormal];
        [btn4 setImage:UIImageByName(@"btn_vip_p") forState:UIControlStateHighlighted];
        
        [btn5 setImage:UIImageByName(@"bg_column") forState:UIControlStateNormal];
        
        btn5.contentLabel.text = @"两性话题，最佳避孕方法";
        CGSize size = [LYGlobalDefine getTextContent:btn5.contentLabel.text withFont:btn5.contentLabel.font];
        btn5.contentLabel.frame = CGRectMake(50, btn5.useLabel.bottom+5, size.width, size.height);
        btn5.useLabel.hidden = NO;
        
    }
    
}


#pragma mark ---data
- (void)initData
{
    if (_docData == nil) {
        _docData = [[NSMutableArray alloc]init];
    }
    if (_hosData == nil) {
        _hosData = [[NSMutableArray alloc]init];
    }
    _docModel = [SHHealthDoctorModel loadLocalDataForDoctorModel];
    if (_docModel && _docModel.datasource && _docModel.datasource.count > 0) {
        [self handleRemoteDataForDoc:_docModel];
    }
    if (!_docModel.hadload) {
        [self requestRemoteDataForDoc];
    }
    
    _hosModel = [SHHealthHospitalModel loadLocalDataForHospitalModel];
    if (_hosModel && _hosModel.datasource && _hosModel.datasource.count > 0) {
        [self handleRemoteDataForHos:_hosModel];
    }
    if (!_hosModel.hadload) {
        [self requestRemoteDataForHos];
    }
}


//刷新
-(void)refrashData
{
    [self requestRemoteDataForDoc];
    [self requestRemoteDataForHos];
    
}
- (void)refreshDocData
{
    if (_docData.count <= 0) {
        _doctorView.hidden = YES;
        _hospitalView.top = _middleView.bottom;
    }else
    {
        _doctorView.hidden =NO;
        _hospitalView.top = _doctorView.bottom;
    }
    for (int i = 0; i < _docData.count; i++) {
        SHHealthDoctorInfo *info = _docData[i];
        
        SHHealthButton *doctorBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        doctorBtn.frame = CGRectMake(APP_SPACE(10) + (APP_SPACE(80) + APP_SPACE(10))*i, APP_SPACE(10), APP_SPACE(80), APP_SPACE(110));
        doctorBtn.backgroundColor = [UIColor clearColor];
        [doctorBtn addTarget:self action:@selector(bt_action_docEvent:) forControlEvents:UIControlEventTouchUpInside];
        doctorBtn.tag = kDoctorIndex + i;
        [_doctorView.subScrollView addSubview:doctorBtn];
        
        doctorBtn.layer.borderColor = colorWith05.CGColor;
        doctorBtn.layer.borderWidth = 2.0f;
        doctorBtn.layer.cornerRadius = 6.0f;
        doctorBtn.layer.masksToBounds = YES;
        if ([info.iconStr hasPrefix:@"http://"]) {
            [doctorBtn.iconImageView sd_setImageWithURL:[NSURL URLWithString:info.iconStr]];
        }else
            doctorBtn.iconImageView.image = [UIImage imageNamed:info.iconStr];
        doctorBtn.iconImageView.size = doctorBtn.size;
        [doctorBtn addSubview:doctorBtn.iconImageView];
        
        doctorBtn.rightIconImageView.backgroundColor = RGBACOLOR(255, 255, 255, 0.8);
        doctorBtn.rightIconImageView.frame = CGRectMake(0, doctorBtn.height - APP_SPACE(25), doctorBtn.width, APP_SPACE(25));
        [doctorBtn addSubview:doctorBtn.rightIconImageView];
        
        doctorBtn.nameLabel.text = info.nameStr;
        doctorBtn.nameLabel.textAlignment = NSTextAlignmentCenter;
        doctorBtn.nameLabel.frame = doctorBtn.rightIconImageView.frame;
        doctorBtn.nameLabel.textColor = colorWith02;
        doctorBtn.nameLabel.font = [UIFont systemFontOfSize:12.0f];
        [doctorBtn addSubview:doctorBtn.nameLabel];
        
        [_doctorView.subScrollView addSubview:doctorBtn];
    }
    _doctorView.subScrollView.contentSize = CGSizeMake(APP_SPACE(90) * _docData.count, 0);
}
- (void)refreshHosData
{
    if (_hosData.count <= 0) {
        _hospitalView.hidden = YES;
    }
    for (int i = 0; i < _hosData.count; i++) {
        SHHealthHospitalInfo *info = _hosData[i];
        SHHealthButton *hosBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
        hosBtn.frame = CGRectMake(APP_SPACE(10) + (APP_SPACE(100) + APP_SPACE(10))*i, APP_SPACE(10), APP_SPACE(100), APP_SPACE(80));
        hosBtn.backgroundColor = [UIColor clearColor];
        [hosBtn addTarget:self action:@selector(bt_action_hosEvent:) forControlEvents:UIControlEventTouchUpInside];
        hosBtn.tag = kHospitalIndex + i;
        [_hospitalView.subScrollView addSubview:hosBtn];
        
        hosBtn.layer.borderColor = colorWith05.CGColor;
        hosBtn.layer.borderWidth = 2.0f;
        hosBtn.layer.cornerRadius = 6.0f;
        hosBtn.layer.masksToBounds = YES;
        if([info.iconStr hasPrefix:@"http://"])
        {
            [hosBtn.iconImageView sd_setImageWithURL:[NSURL URLWithString:info.iconStr]];
        }else
            hosBtn.iconImageView.image = [UIImage imageNamed:info.iconStr];
        hosBtn.iconImageView.size = hosBtn.size;
        [hosBtn addSubview:hosBtn.iconImageView];
        
        hosBtn.rightIconImageView.backgroundColor = RGBACOLOR(255, 255, 255, 0.8);
        hosBtn.rightIconImageView.frame = CGRectMake(0, hosBtn.height - APP_SPACE(25), hosBtn.width, APP_SPACE(25));
        [hosBtn addSubview:hosBtn.rightIconImageView];
        
        hosBtn.nameLabel.text = info.nameStr;
        hosBtn.nameLabel.textAlignment = NSTextAlignmentCenter;
        hosBtn.nameLabel.frame = hosBtn.rightIconImageView.frame;
        hosBtn.nameLabel.textColor = colorWith02;
        hosBtn.nameLabel.font = [UIFont systemFontOfSize:12.0f];
        [hosBtn addSubview:hosBtn.nameLabel];
        [_hospitalView.subScrollView addSubview:hosBtn];
    }
    _hospitalView.subScrollView.contentSize = CGSizeMake(APP_SPACE(110) * _hosData.count, 0);
    
}
#pragma mark ---网络数据
/**
 *  医师 数据
 */
-(void)handleRemoteDataForDoc:(SHHealthDoctorModel*)model
{
    [_docData removeAllObjects];
    [_docData addObjectsFromArray:_docModel.datasource];
    [self refreshDocData];
}
-(void)requestRemoteDataForDoc
{
    [SHHealthDoctorModel loadRemoteDataForDoctorModel:_docModel flag:NO cb:^(BOOL isOK, SHHealthDoctorModel *model) {
        if (isOK) {
            [self handleRemoteDataForDoc:model];
        }
    }];
}
/**
 *  医院 数据
 */
-(void)handleRemoteDataForHos:(SHHealthHospitalModel*)model
{
    [_hosData removeAllObjects];
    [_hosData addObjectsFromArray:_hosModel.datasource];
    [self refreshHosData];
}
-(void)requestRemoteDataForHos
{
    [SHHealthHospitalModel loadRemoteDataForHospitalModel:_hosModel flag:NO cb:^(BOOL isOK, SHHealthHospitalModel *model) {
        if (isOK) {
            [self handleRemoteDataForHos:model];
        }
    }];
}


#pragma mark ---action 事件
- (void)bt_action_event:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (IS_Doctor) {//医师端
        
        if (index == 1000) {//义诊
            
            
        } else if (index == 1001) {// 诊所
            SHDCVisitVC *vc=[[SHDCVisitVC alloc] init];
            [self.mainVC.navigationController pushViewController:vc animated:YES];
            
        } else if (index == 1002) {// 我的病人
            SHDCPictureTextVC *vc=[[SHDCPictureTextVC alloc] init];
            [self.mainVC.navigationController pushViewController:vc animated:YES];
            
        } else if (index == 1003) {// 抢答
            [SHVIPVC gotoMySelf:self.mainVC withType:SHExternalTypeVip];
            
        } else if (index == 1004) {// 论文咨询
            [SHPaperConsultVC gotoMySelf:self.mainVC];
            
            
        } else if (index == 1005) {// 附近医师
            [SHNearbyDoctorVC gotoMySelf:self.mainVC];
            
        } else if (index == 1006) {// 附近医院
            [SHNearbyHospitalVC gotoMySelf:self.mainVC];
        }

    }else
    {
        if (index == 1000) {//免费咨询
            [SHVIPVC gotoMySelf:self.mainVC withType:SHExternalTypeFree];
            
        } else if (index == 1001) {// 自我诊断
            [SHDiagnoseVC gotoMySelf:self.mainVC];
            
        } else if (index == 1002) {// 科普知识
            [SHCopeVC gotoMySelf:self.mainVC withType:normalType andObject:nil];
            
        } else if (index == 1003) {// vip服务
            [SHVIPVC gotoMySelf:self.mainVC withType:SHExternalTypeVip];
            
        } else if (index == 1004) {// 心理咨询
            [SHPsychologyVC gotoMySelf:self.mainVC];
            
            
        } else if (index == 1005) {// 附近医师
            [SHNearbyDoctorVC gotoMySelf:self.mainVC];
            
        } else if (index == 1006) {// 附近医院
            [SHNearbyHospitalVC gotoMySelf:self.mainVC];
        }
 
    }
    
}
- (void)bt_action_docEvent:(UIButton*)sender
{
    NSInteger index = sender.tag;
    //    SHMydoctorInfo *info = _docData[index - kDoctorIndex];
    
    SHHealthDoctorInfo *info = _docData[index - kDoctorIndex];
    [SHDoctorDetailVC gotoMySelf:self.mainVC withModel:info.idStr];
}
- (void)bt_action_hosEvent:(UIButton*)sender
{
    NSInteger index = sender.tag;
    SHNearbyHospitalInfo *info = _hosData[index - kHospitalIndex];
    [SHHospitalDetailVC gotoMySelf:self.mainVC withModel:info];
}


@end
