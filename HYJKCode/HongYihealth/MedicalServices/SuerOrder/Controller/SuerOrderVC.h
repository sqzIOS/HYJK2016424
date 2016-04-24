//
//  SuerOrderVC.h
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能：订单确认

#import <UIKit/UIKit.h>
#import "SuerOrderHeadView.h"

@interface SuerOrderVC : MyCenterBaseController<SuerOrderHeadViewDelegate>

@property (nonatomic, strong) ConsultingModel *model;

@property (nonatomic, strong) SuerOrderHeadView *headView;

@property (nonatomic, assign) PayHeadViewType type;

- (instancetype)initWithType:(PayHeadViewType)type;

@end
