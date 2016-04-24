//
//  PayVC.h
//  
//
//  Created by 刘朝涛 on 16/1/4.
//
//  功能：支付

#import <UIKit/UIKit.h>
#import "PayHeadView.h"
#import "OrderModel.h"

@interface PayVC : MyCenterBaseController

@property (nonatomic, assign) PayHeadViewType type;

//@property (nonatomic, strong) ConsultingModel *model;

@property (nonatomic, strong) OrderModel *orderModel;

@property (nonatomic, strong) NSMutableArray *paymentArr;   //支付方式

- (instancetype)initWithType:(PayHeadViewType)type;

@end
