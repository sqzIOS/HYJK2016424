//
//  SHDiagnoseDetailHeadView.h
//  sexduoduo
//
//  Created by showm on 15/9/11.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  病情详情的header

#import <UIKit/UIKit.h>
#import "MMGridView.h"
@interface SHDiagnoseDetailHeadView : UIView<MMGridViewDataSource,MMGridViewDelegate>
{
    NSArray *dataArray;
    NSInteger _numIndexColor;
    BOOL isChangeSelectColor;//是否变化选中的颜色
}
@property(strong,nonatomic)MMGridView * gridView;
@property(strong,nonatomic)UIViewController *mainVC;

@property(strong,nonatomic)NSMutableArray *detailArray;

-(id)initWithVC:(UIViewController *)vc ;

@end
