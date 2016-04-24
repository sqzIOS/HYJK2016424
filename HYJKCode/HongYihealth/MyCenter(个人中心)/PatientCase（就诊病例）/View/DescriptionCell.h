//
//  DescriptionCell.h
//  
//
//  Created by wenzhizheng on 16/1/2.
//
//

#import <UIKit/UIKit.h>

@class DescriptionCell;

@protocol DescriptionCellDelegate <NSObject>

- (void)descriptionCellTextDidChange:(DescriptionCell *)cell;

@end

@interface DescriptionCell : UITableViewCell

@property (nonatomic,copy) NSString *descriptionStr;

/**
 * 代理
 */
@property (nonatomic,weak) id<DescriptionCellDelegate> delegate;



+ (instancetype)descriptionCellWithTitle:(NSString *)title andPlaceHolder:(NSString *)palceHolder;

@end
