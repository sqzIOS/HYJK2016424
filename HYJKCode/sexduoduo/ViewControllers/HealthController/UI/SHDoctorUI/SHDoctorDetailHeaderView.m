//
//  SHDoctorDetailHeaderView.m
//  SexHealth
//
//  Created by ly1992 on 15/6/30.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHDoctorDetailHeaderView.h"

@interface SHDoctorDetailHeaderView()
//头像
@property (nonatomic,strong) UIImageView *iconImageView;
//选 TA
@property (nonatomic,strong) UIButton *doctorBtn;
//用户名
@property (nonatomic,strong) UILabel *nameLabel;
//职位
@property (nonatomic,strong) UILabel *postLabel;
//是否认证
@property (nonatomic,strong) UIImageView *sAuthImageView;
@property (nonatomic,strong) UIImageView *authImageView;
//评分
@property (nonatomic,strong) UIImageView *scoreImageView;
@property (nonatomic,strong) UILabel *scoreLabel;
//地址
@property (nonatomic,strong) UILabel *addLablel;
//距离
@property (nonatomic,strong) UILabel *spaceLablel;
//医院
//医院
@property (nonatomic,strong) UILabel *hosNameLabel;
@property (nonatomic,strong) UILabel *hosLabel;
//擅长范围
@property (nonatomic,strong) UILabel *goodNameLabel;
@property (nonatomic,strong) UILabel *goodLabel;
//简介
@property (nonatomic,strong) UILabel *contentLabel;
//分割线
@property (nonatomic,strong) UIImageView *lineImageView;
@end

@implementation SHDoctorDetailHeaderView

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
    self.iconImageView.frame = CGRectMake(APP_SPACE(10), APP_SPACE(10), APP_SPACE(75), APP_SPACE(100));
    self.iconImageView.backgroundColor = [UIColor clearColor];
    self.iconImageView.layer.cornerRadius = 4.0f;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.borderColor = colorWith05.CGColor;
    self.iconImageView.layer.borderWidth = 2.0f;
    [self addSubview:self.iconImageView];
    //
    self.doctorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.doctorBtn.backgroundColor = colorWith01;
    self.doctorBtn.frame = CGRectMake(APP_SPACE(15), self.iconImageView.bottom + APP_SPACE(5), self.iconImageView.width - APP_SPACE(10), APP_SPACE(20));
    self.doctorBtn.layer.cornerRadius = 2.0f;
    self.doctorBtn.layer.masksToBounds = YES;
    self.doctorBtn.titleLabel.font = Font_Small_bold;
    [self.doctorBtn setTitleColor:colorWithLYWhite forState:UIControlStateNormal];
    [self.doctorBtn setTitle:NSLocalizedString(@"选TA", nil) forState:UIControlStateNormal];
    [self addSubview:self.doctorBtn];
    //
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.nameLabel.backgroundColor = [UIColor clearColor];
    self.nameLabel.font = Font_Large_bold;
    self.nameLabel.textColor = colorWith02;
    [self addSubview:self.nameLabel];
    //
    self.postLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.postLabel.backgroundColor = [UIColor clearColor];
    self.postLabel.font = Font_Small;
    self.postLabel.textColor = colorWith01;
    [self addSubview:self.postLabel];
    //
    self.sAuthImageView = [[UIImageView alloc]init];
    self.sAuthImageView.backgroundColor = [UIColor clearColor];
    self.sAuthImageView.image = [UIImage imageNamed:@"health_authSingele"];

    [self addSubview:self.sAuthImageView];
    //
    self.authImageView = [[UIImageView alloc]init];
    self.authImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.authImageView];
    //
    self.scoreImageView = [[UIImageView alloc]init];
    self.scoreImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.scoreImageView];
    self.scoreLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.scoreLabel.backgroundColor = [UIColor clearColor];
    self.scoreLabel.font = Font_Middle_bold;
    self.scoreLabel.textColor = RGBCOLOR16(0xf45e5e);
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.scoreImageView addSubview:self.scoreLabel];
    //
    self.addLablel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.addLablel.backgroundColor = [UIColor clearColor];
    self.addLablel.font = Font_Small;
    self.addLablel.textColor = colorWith03;
    [self addSubview:self.addLablel];
    //
    self.spaceLablel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.spaceLablel.backgroundColor = [UIColor clearColor];
    self.spaceLablel.font = Font_Small;
    self.spaceLablel.textColor = colorWith04;
    [self addSubview:self.spaceLablel];
    //
    self.hosNameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.hosNameLabel.backgroundColor = [UIColor clearColor];
    self.hosNameLabel.font = Font_Small;
    self.hosNameLabel.textColor = colorWith03;
    [self addSubview:self.hosNameLabel];
    //
    self.hosLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.hosLabel.backgroundColor = [UIColor clearColor];
    self.hosLabel.font = Font_Small;
    self.hosLabel.textColor = colorWith04;
    [self addSubview:self.hosLabel];
    //
    self.goodNameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.goodNameLabel.backgroundColor = [UIColor clearColor];
    self.goodNameLabel.font = Font_Small;
    self.goodNameLabel.textColor = colorWith03;
    [self addSubview:self.goodNameLabel];
    //
    self.goodLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.goodLabel.backgroundColor = [UIColor clearColor];
    self.goodLabel.font = Font_Small;
    self.goodLabel.textColor = colorWith04;
    self.goodLabel.numberOfLines = 0;
    [self addSubview:self.goodLabel];
    //
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.contentLabel.backgroundColor = [UIColor clearColor];
    self.contentLabel.font = Font_Small;
    self.contentLabel.textColor = colorWith04;
    self.contentLabel.numberOfLines = 0;
    [self addSubview:self.contentLabel];
    //
    self.lineImageView = [UIImageView imageViewLineWithX:0 withY:0 withWidth:SCREEN_WIDTH withHeight:1];
    [self addSubview:self.lineImageView];
}

- (CGFloat)refreshDataWithModel:(SHMydoctorInfo*)model
{
    if ([model.headimgurl hasPrefix:@"http://"]) {
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.headimgurl] placeholderImage:nil];
    }
    //self.iconImageView.image = [UIImage imageNamed:model.iconStr];
    self.nameLabel.text = model.doctorName;//model.nameStr;
    CGSize size = [LYGlobalDefine getTextContent:self.nameLabel.text withFont:self.nameLabel.font];
    self.nameLabel.frame = CGRectMake(self.iconImageView.right + APP_SPACE(10), self.iconImageView.top, size.width, size.height);
    //
    self.postLabel.text = @"主任医师"; //model.postStr;
    size = [LYGlobalDefine getTextContent:self.postLabel.text withFont:self.postLabel.font];
    self.postLabel.frame = CGRectMake(self.nameLabel.left, self.nameLabel.bottom + APP_SPACE(5), size.width, size.height);
    //
    self.sAuthImageView.frame = CGRectMake(self.postLabel.right, self.postLabel.top + (self.postLabel.height - APP_SPACE(10)), APP_SPACE(10), APP_SPACE(10));
    //
    //if ([model.headimgurl hasPrefix:@"http://"]) {
        [self.authImageView sd_setImageWithURL:[NSURL URLWithString:model.headimgurl] placeholderImage:nil];
    //}
    UIImage *image = [UIImage imageNamed:@"health_auth"];
    self.authImageView.image =[UIImage imageNamed:model.headimgurl];
    self.authImageView.frame = CGRectMake(self.postLabel.right + APP_SPACE(35), self.postLabel.top, image.size.width, image.size.height);
    //
    image = [UIImage imageNamed:@"health_lovescore"];
    self.scoreImageView.image = [UIImage imageNamed:model.headimgurl];
    self.scoreImageView.frame = CGRectMake(SCREEN_WIDTH - APP_SPACE(35) - image.size.width, APP_SPACE(20), image.size.width, image.size.height);
    self.scoreLabel.text =@"999"; // model.scoreStr;
    self.scoreLabel.frame = CGRectMake(0, APP_SPACE(15), self.scoreImageView.width, APP_SPACE(20));
    //
    self.addLablel.text = model.area;//model.addressStr;
    size = [LYGlobalDefine getTextContent:self.addLablel.text withFont:self.addLablel.font];
    self.addLablel.frame = CGRectMake(self.nameLabel.left, self.postLabel.bottom + APP_SPACE(5), size.width, size.height);
    //
    self.spaceLablel.text = model
    .lat; //model.nameStr;
    size = [LYGlobalDefine getTextContent:self.spaceLablel.text withFont:self.spaceLablel.font];
    self.spaceLablel.frame = CGRectMake(self.addLablel.right + APP_SPACE(20), self.addLablel.top, size.width, size.height);
    //
    self.hosNameLabel.text = @"所属医院：";//model.nameStr;
    size = [LYGlobalDefine getTextContent:self.hosNameLabel.text withFont:self.hosNameLabel.font];
    self.hosNameLabel.frame = CGRectMake(self.nameLabel.left, self.addLablel.bottom + APP_SPACE(10), size.width, size.height);
    //
    self.hosLabel.text = model.hopital;//model.nameStr;
    size = [LYGlobalDefine getTextContent:self.hosLabel.text withFont:self.hosLabel.font];
    self.hosLabel.frame = CGRectMake(self.hosNameLabel.right + APP_SPACE(10), self.hosNameLabel.top, size.width, size.height);
    //
    self.goodNameLabel.text =@"擅长范围: ";// model.nameStr;
    size = [LYGlobalDefine getTextContent:self.goodNameLabel.text withFont:self.goodNameLabel.font];
    self.goodNameLabel.frame = CGRectMake(self.nameLabel.left, self.hosNameLabel.bottom + APP_SPACE(10), size.width, size.height);
    //
    self.goodLabel.text = @"精神科";//model.nameStr;
    size = [LYGlobalDefine getTextMultilineContent:self.goodLabel.text withFont:self.goodLabel.font withSize:CGSizeMake(SCREEN_WIDTH - (self.goodNameLabel.right + APP_SPACE(10) - APP_SPACE(10)), SCREEN_HEIGHT)];
    self.goodLabel.frame = CGRectMake(self.goodNameLabel.right + APP_SPACE(10), self.goodNameLabel.top, size.width, size.height);
    //
    self.lineImageView.top = self.goodLabel.bottom + APP_SPACE(20);
    //
    
    self.contentLabel.text = model.introduce; //model.nameStr;
    size = [LYGlobalDefine getTextMultilineContent:self.contentLabel.text withFont:self.contentLabel.font withSize:CGSizeMake(SCREEN_WIDTH - APP_SPACE(20), SCREEN_HEIGHT)];
    self.contentLabel.frame = CGRectMake(APP_SPACE(10), self.lineImageView.bottom + APP_SPACE(10), size.width, size.height);
    
    
    CGFloat height = self.lineImageView.bottom + size.height +10;
    
    self.height = height;
    
    return height;
}
+(CGFloat)getDoctorDetailHeaderViewHeightWithModel:(SHMydoctorInfo*)model
{

    
    UILabel *label = [[UILabel alloc]init];
    CGFloat lastBottom = label.frame.size.height;
    label.font = Font_Small;
    label.numberOfLines = 0;
//    label.text =@"你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗;";
    label.text = model.nearbyIntroduce;
    
    CGSize size = [LYGlobalDefine getTextMultilineContent:label.text withFont:label.font withSize:CGSizeMake(SCREEN_WIDTH - APP_SPACE(20), SCREEN_HEIGHT)];
    lastBottom += size.height + APP_SPACE(20);
    [LYGlobalDefine getTextMultilineContent:label.text withFont:label.font withSize:CGSizeMake(SCREEN_WIDTH - APP_SPACE(20), SCREEN_HEIGHT)];
    lastBottom += size.height + APP_SPACE(20);
    
    return APP_SPACE(65) + lastBottom;
}

@end
