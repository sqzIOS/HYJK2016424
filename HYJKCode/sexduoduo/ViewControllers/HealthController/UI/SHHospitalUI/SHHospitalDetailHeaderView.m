//
//  SHHospitalDetailHeaderView.m
//  SexHealth
//
//  Created by ly1992 on 15/6/30.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHHospitalDetailHeaderView.h"

@interface SHHospitalDetailHeaderView()
//图标
@property (nonatomic,strong) UIImageView *iconImageView;
//预约挂号
@property (nonatomic,strong) UIButton *doctorBtn;
//医院名称
@property (nonatomic,strong) UILabel *nameLabel;
//介绍
@property (nonatomic,strong) UILabel *contentLabel;
//地址
@property (nonatomic,strong) UILabel *addressLabel;
//详情
@property (nonatomic,strong) UILabel *detailLabel;
//地图
@property (nonatomic,strong) UILabel *mapLabel;
//
@property (nonatomic,strong) UIImageView *rightOneIconImageView;
@property (nonatomic,strong) UIImageView *rightTwoIconImageView;

@end

@implementation SHHospitalDetailHeaderView

-(id)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}
- (void)initView
{
    //
    self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.iconImageView.frame = CGRectMake(APP_SPACE(15), APP_SPACE(15), SCREEN_WIDTH -  APP_SPACE(30), APP_SPACE(140));
    self.iconImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.iconImageView];
    
    //
    self.doctorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.doctorBtn.backgroundColor = colorWith01;
    self.doctorBtn.frame = CGRectMake(SCREEN_WIDTH -  APP_SPACE(95), self.iconImageView.bottom + APP_SPACE(10), APP_SPACE(80), APP_SPACE(30));
    self.doctorBtn.layer.cornerRadius = 2.0f;
    self.doctorBtn.layer.masksToBounds = YES;
    self.doctorBtn.titleLabel.font = Font_Small_bold;
    [self.doctorBtn setTitleColor:colorWithLYWhite forState:UIControlStateNormal];
    [self.doctorBtn setTitle:NSLocalizedString(@"预约挂号", nil) forState:UIControlStateNormal];
    [self addSubview:self.doctorBtn];
    
    //
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.nameLabel.backgroundColor = [UIColor clearColor];
    self.nameLabel.font = Font_Middle_bold;
    self.nameLabel.textColor = colorWith02;
    [self addSubview:self.nameLabel];
    
    //
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.contentLabel.backgroundColor = [UIColor clearColor];
    self.contentLabel.font = Font_Small;
    self.contentLabel.textColor = colorWith03;
    [self addSubview:self.contentLabel];
    //
    self.rightOneIconImageView = [[UIImageView alloc]init];
    self.rightOneIconImageView.backgroundColor = [UIColor clearColor];
    self.rightOneIconImageView.image = [UIImage imageNamed:@"health_authSingele"];
    [self addSubview:self.rightOneIconImageView];
    //
    self.addressLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.addressLabel.backgroundColor = [UIColor clearColor];
    self.addressLabel.font = Font_Small;
    self.addressLabel.textColor = colorWith03;
    [self addSubview:self.addressLabel];
    //
    self.rightTwoIconImageView = [[UIImageView alloc]init];
    self.rightTwoIconImageView.backgroundColor = [UIColor clearColor];
    self.rightTwoIconImageView.image = [UIImage imageNamed:@"health_authSingele"];
    [self addSubview:self.rightTwoIconImageView];
   
}
/**
 *  数据刷新
 */
- (void)refreshDataWithModel:(SHNearbyHospitalInfo*)model
{
    if([model.iconStr hasPrefix:@"http://"])
    {
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.iconStr]];
    }else
        self.iconImageView.image = [UIImage imageNamed:model.iconStr];
    
    self.nameLabel.text =  model.nameStr; // @"隔壁老王医院"
    CGSize size = [LYGlobalDefine getTextContent:self.nameLabel.text withFont:self.nameLabel.font];
    self.nameLabel.frame = CGRectMake(APP_SPACE(15), self.iconImageView.bottom + APP_SPACE(10), size.width,25);
    
    self.contentLabel.text = model.contentStr; // @"厦门大学附属第一医院"
    self.contentLabel.numberOfLines=1;
//    size = [LYGlobalDefine getTextContent:self.contentLabel.text withFont:self.contentLabel.font];
    self.contentLabel.frame = CGRectMake(self.nameLabel.left, self.nameLabel.bottom + APP_SPACE(20), k_screenWidth-60, 30);
    
    UIImage *image = [UIImage imageNamed:@"health_next"];
    self.rightOneIconImageView.image = image;
    self.rightOneIconImageView.frame = CGRectMake(SCREEN_WIDTH - image.size.width - APP_SPACE(15), self.contentLabel.top + (self.contentLabel.height - image.size.height)/2, image.size.width, image.size.height);
    
    self.addressLabel.text = model.addressStr; //@"仙岳路110号";
//     size = [LYGlobalDefine getTextContent:self.addressLabel.text withFont:self.addressLabel.font];
    self.addressLabel.frame = CGRectMake(self.nameLabel.left, self.contentLabel.bottom + APP_SPACE(20), k_screenWidth-60, 30);
    
    self.rightTwoIconImageView.image = image;
    self.rightTwoIconImageView.frame = CGRectMake(SCREEN_WIDTH - image.size.width - APP_SPACE(15), self.addressLabel.top + (self.contentLabel.height - image.size.height)/2, image.size.width, image.size.height);
    
}

+(CGFloat)getHospitalDetailHeaderViewHeightWithModel:(SHNearbyHospitalInfo*)model
{
    return 300;
}

@end
