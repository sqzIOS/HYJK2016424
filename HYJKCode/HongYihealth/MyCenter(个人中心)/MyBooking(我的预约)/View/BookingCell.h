//
//  BookingCell.h
//  
//
//  Created by wenzhizheng on 16/1/3.
//
//

#import <UIKit/UIKit.h>
#import "BookingModel.h"

@class BookingCell;

@protocol BookingCellDelegate <NSObject>

- (void)bookingCellSetClock:(BookingCell *)cell;

@end

@interface BookingCell : UITableViewCell

@property (nonatomic,strong) BookingModel *model;
@property (nonatomic,weak) id<BookingCellDelegate> delegate;

+ (instancetype)bookingCellWithTableView:(UITableView *)tableView andIsNeedClock:(BOOL)isNeedClock;

- (void)setNotiTimeHour:(int)hour minute:(int)minute;

@end
