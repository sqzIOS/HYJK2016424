//
//  MyCustomCell.h
//  
//
//  Created by apple on 16/1/27.
//
//

#import <UIKit/UIKit.h>
#import "ServiceModel.h"
#import "ExaminationModel.h"

@interface MyCustomCell : UITableViewCell

@property (nonatomic,strong) NSObject *model;

+ (instancetype)cellWithModel:(NSObject *)model inTableView:(UITableView *)tableView;

@end
