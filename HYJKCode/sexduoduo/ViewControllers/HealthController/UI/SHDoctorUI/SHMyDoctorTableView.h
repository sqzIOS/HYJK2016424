//
//  SHMyDoctorTableView.h
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//  个人中心的医师列表 和 附近医师列表

#import <UIKit/UIKit.h>

#define kNearbyHospitalCellHeight  APP_SPACE(230)

@interface SHMyDoctorTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
/**
 *  表视图数据
 */
@property (strong, nonatomic) NSMutableArray *docData;
@property (strong, nonatomic) NSMutableArray *hisData;
@property (strong, nonatomic) UIViewController *mainVC;
@property (nonatomic) NSInteger type;

/**
 *  初始化
 *  type 入口 1: 医师列表    2：服务历史  3: 附近医师
 */
- (id)initWithTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC withType:(NSInteger)type;
@end
