//
//  MyMessageCell.h
//  
//
//  Created by wenzhizheng on 16/1/24.
//
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface MyMessageCell : UITableViewCell

@property (nonatomic ,strong) MessageModel *model;

+ (instancetype)cellWithModel:(MessageModel *)model inTableView:(UITableView *)tableView;

@end
