//
//  AddressEditCell.h
//  
//
//  Created by apple on 16/1/25.
//
//

#import <UIKit/UIKit.h>

@interface AddressEditCell : UITableViewCell

@property (nonatomic,copy) NSString *content;


+ (instancetype)cellWithTitle:(NSString *)title;

@end
