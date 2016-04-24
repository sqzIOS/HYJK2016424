//
//  SetAddressInfoController.h
//  
//
//  Created by apple on 16/1/25.
//
//

#import <UIKit/UIKit.h>
#import "AddressEditCell.h"

@class AddressModel;

@interface SetAddressInfoController : MyCenterBaseController

@property (nonatomic,strong) NSArray *dataArry;

+ (instancetype)controllerWithAddressModel:(AddressModel *)addressModel controllerTitle:(NSString *)title;

@end
