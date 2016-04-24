//
//  PayDetailsVC.h
//  
//
//  Created by 刘朝涛 on 16/1/6.
//
//  功能：预约详情

#import <UIKit/UIKit.h>
#import "PayDetailsHeadView.h"

@interface PayDetailsVC : MyCenterBaseController

@property (nonatomic, assign) PayHeadViewType type;

@property (nonatomic, strong) NSString *orderID;

- (instancetype)initWithType:(PayHeadViewType)type;

@end
