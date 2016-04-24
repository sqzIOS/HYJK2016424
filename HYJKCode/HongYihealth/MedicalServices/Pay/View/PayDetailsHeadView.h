//
//  PayDetailsHeadView.h
//  
//
//  Created by 刘朝涛 on 16/1/6.
//
//  功能：预约详情headView

#import <UIKit/UIKit.h>
#import "OrderModel.h"
typedef enum {
    
    ForWithServerOrder = 0,
    ForWithPhysicalOrder
    
}PayHeadViewType;

@protocol PayDetailsHeadViewDelegate <NSObject>

- (void)telprompt:(NSString *)phone;

- (void)goPay;

- (void)cancel;

- (void)goEvaluation;

- (void)sureOrder;

@end

@interface PayDetailsHeadView : UIView

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

@property (nonatomic, assign) PayHeadViewType type;

@property (nonatomic, assign) id<PayDetailsHeadViewDelegate> delegate;

@property (nonatomic, strong) UIButton *goPayBtn;   //去支付

@property (nonatomic, strong) UIButton *cancelBtn;  //取消预约

@property (nonatomic, strong) UIButton *sureBtn;    //去评价

@property (nonatomic, strong) UIButton *goEvaluationBtn;    //去评价

- (instancetype)initWithFrame:(CGRect)frame Type:(PayHeadViewType)type;

- (void)refreshHeadView:(OrderModel *)model;

@end
