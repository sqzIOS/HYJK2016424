//
//  MyAddressCell.h
//  
//
//  Created by apple on 16/1/25.
//
//

#import <UIKit/UIKit.h>
#import "AddressModel.h"

@protocol MyAddressCellDelegate <NSObject>

- (void)myAddressCellsetDefaultWithAddressID:(NSString *)addressID;

@end

@interface MyAddressCell : UITableViewCell

@property (nonatomic,weak) id<MyAddressCellDelegate> delegate;

@property (nonatomic,strong) AddressModel *model;

@end
