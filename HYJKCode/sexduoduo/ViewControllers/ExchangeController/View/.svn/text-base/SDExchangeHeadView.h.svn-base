//
//  SDExchangeHeadView.h
//  sexduoduo
//
//  Created by showm on 15/12/3.
//  Copyright © 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLCycleScrollView.h"

@interface SDExchangeHeadView : UIView<XLCycleScrollViewDelegate,XLCycleScrollViewDatasource>
//顶部滚动 UIScrollView
@property(strong, nonatomic) XLCycleScrollView *scrollView;
//父视图
@property(weak,nonatomic)UIViewController* parentVC;
/**
 * 初始化 SDHomeHeaderView
 */
- (id)initWithFrameAndType:(CGRect)frame pvc:(id)pvc;
/**
 * 远程获取数据用来显示View
 */
-(void)requestData;


@end
