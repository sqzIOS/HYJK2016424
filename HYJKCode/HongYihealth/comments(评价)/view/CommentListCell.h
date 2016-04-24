//
//  CommentListCell.h
//  
//
//  Created by apple on 16/2/1.
//
//

#import <UIKit/UIKit.h>

@interface CommentListCell : UITableViewCell


+ (instancetype)commentListCellInTableView:(UITableView *)tableView;

@property (nonatomic) int value1;
@property (nonatomic) int value2;
@property (nonatomic) int value3;


@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *desease;


@end
