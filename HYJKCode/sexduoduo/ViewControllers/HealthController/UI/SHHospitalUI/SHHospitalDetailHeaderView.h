//
//  SHHospitalDetailHeaderView.h
//  SexHealth
//
//  Created by ly1992 on 15/6/30.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHNearbyHospitalModel.h"

@interface SHHospitalDetailHeaderView : UIView
/**
 *  初始化
 */
-(id)init;
/**
 *  数据刷新
 */
- (void)refreshDataWithModel:(SHNearbyHospitalInfo*)model;

+(CGFloat)getHospitalDetailHeaderViewHeightWithModel:(SHNearbyHospitalInfo*)model;

@end
