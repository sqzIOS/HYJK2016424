//
//  SHDoctorDetailVC.h
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHMydoctorModel.h"

@interface SHDoctorDetailVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)SHMydoctorInfo *model;
@property (nonatomic,strong)NSString *doctorIdStr;
@property (nonatomic,strong)NSMutableArray *listArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


+(void)gotoMySelf:(id)pvc withModel:(NSString*)idStr;

@end
