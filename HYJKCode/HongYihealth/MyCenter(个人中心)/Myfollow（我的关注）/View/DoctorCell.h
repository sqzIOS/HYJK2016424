//
//  DoctorCell.h
//  
//
//  Created by wenzhizheng on 16/1/24.
//
//

#import <UIKit/UIKit.h>
#import "DorctorModel.h"

@interface DoctorCell : UITableViewCell

@property (nonatomic ,strong) DorctorModel *model;

+ (instancetype)cellWithModel:(DorctorModel *)model inTableView:(UITableView *)tableView;

@end
