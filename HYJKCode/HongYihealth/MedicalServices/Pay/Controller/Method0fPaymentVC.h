//
//  Method0fPaymentVC.h
//  
//
//  Created by 刘朝涛 on 16/1/4.
//
//  功能：提交成功

#import <UIKit/UIKit.h>
#import "PayDetailsVC.h"

@interface Method0fPaymentVC : MyCenterBaseController

@property (nonatomic, assign) PayHeadViewType type;

@property (nonatomic, strong) NSString *orderID;

- (instancetype)initwithType:(PayHeadViewType)type;

@end
