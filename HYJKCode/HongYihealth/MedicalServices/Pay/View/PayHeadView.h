//
//  PayHeadView.h
//  
//
//  Created by 刘朝涛 on 16/1/4.
//
//  功能:支付headView

#import <UIKit/UIKit.h>
#import "Method0fPaymentVC.h"
#import "OrderModel.h"

//@protocol PayHeadViewDelegate <NSObject>
//
//- (void)submitOrder;
//
//@end

@interface PayHeadView : UIView

@property (nonatomic, strong) UILabel *orderNumLab; //订单号

@property (nonatomic, strong) UILabel *stateLab;    //支付状态

@property (nonatomic, strong) UIView *bgView1;

@property (nonatomic, strong) UIView *bgView2;

@property (nonatomic, strong) UIView *bgView3;

@property (nonatomic, strong) UILabel *doctorNameLab;

@property (nonatomic, strong) UILabel *doctorJob1Lab;

@property (nonatomic, strong) UILabel *doctorJob2Lab;

@property (nonatomic, strong) UILabel *hospitalAddressLab;

@property (nonatomic, strong) UILabel *deparmentLab;

@property (nonatomic, strong) UILabel *hospitalNameLab;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UILabel *userNameLab; //患者姓名

@property (nonatomic, strong) UILabel *userPhoneLab;    //患者电话

@property (nonatomic, strong) UIButton *payBtn; //支付方式

@property (nonatomic, strong) UIButton *submitBtn;  //提交

@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic, assign) UIViewController *mainVC;

@property (nonatomic, copy) void (^headBlock)();

@property (nonatomic, assign) PayHeadViewType type;

@property (nonatomic, assign) BOOL isOK;   //是否选择了支付方式

@property (nonatomic, copy) void (^submitBlock)();

- (instancetype)initWithFrame:(CGRect)frame Controller:(UIViewController *)vc Type:(PayHeadViewType)type Model:(OrderModel *)model;

- (void)changeBtnBg:(BOOL)isOK;

@end
