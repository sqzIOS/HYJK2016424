//
//  SuerOrderHeadView.h
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能：确认订单view

#import <UIKit/UIKit.h>
#import "ConsultingModel.h"
#import "AddressVC.h"
#import "PayVC.h"
#import "CalenderVC.h"
#import "PatientCaseController.h"
#import "OrderModel.h"

@protocol SuerOrderHeadViewDelegate <NSObject>

- (void)changeHeight;

- (void)gotoPayVC:(int)type;

@end

@interface SuerOrderHeadView : UIView<CalenderVCDelegate>

@property (nonatomic, strong) UIImageView *headImageView;   //头像

@property (nonatomic, strong) UILabel *nameLab; //姓名

@property (nonatomic, strong) UILabel *jobLab;  //主任医师

@property (nonatomic, strong) UILabel *jobLab2;  //教授

@property (nonatomic, strong) UILabel *deparmentLab;    //科室

@property (nonatomic, strong) UILabel *hospitalLab; //医院名称

@property (nonatomic, strong) UIView *bgView1;

@property (nonatomic, strong) UIView *bgView2;

@property (nonatomic, strong) UIView *line; //分割线

@property (nonatomic, strong) CTBtn *selectedBtn;

@property (nonatomic, strong) ConsultingModel *model;

@property (nonatomic, assign) id<SuerOrderHeadViewDelegate> delegate;

@property (nonatomic, assign) BOOL isSelectedWithAgeenBtn;

@property (nonatomic, assign) BOOL isSelectedWithUnfoldBtn;

@property (nonatomic, assign) UIViewController *mainVC;

@property (nonatomic, assign) PayHeadViewType type;

@property (nonatomic, assign) BOOL isOK_1;

@property (nonatomic, assign) BOOL isOK_2;

@property (nonatomic, assign) BOOL isOK_3;

@property (nonatomic, strong) UIButton *submitBtn;

@property (nonatomic, strong) OrderModel *orderModel;

@property (nonatomic, strong) NSMutableArray *shopArr;  //医师地址

- (instancetype)initWithFrame:(CGRect)frame Model:(ConsultingModel *)model Controller:(UIViewController *)vc Type:(PayHeadViewType)type;

- (void)changeValueWithAddress:(NSString *)hospitalName ID:(NSString *)idStr;

- (void)changeBingLi:(BOOL)isOK;

@end
