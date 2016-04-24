//
//  SHHospitalDetailVC.h
//  SexHealth
//
//  Created by ly1992 on 15/6/30.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHNearbyHospitalModel.h"

@interface SHHospitalDetailVC : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic,strong)SHNearbyHospitalInfo *model;

+(void)gotoMySelf:(id)pvc withModel:(SHNearbyHospitalInfo*)model;

@end
