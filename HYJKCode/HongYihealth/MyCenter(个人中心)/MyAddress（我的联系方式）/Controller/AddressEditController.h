//
//  AddressEditController.h
//  
//
//  Created by wenzhizheng on 16/1/25.
//
//

#import "MyCenterBaseController.h"
#import "MyAddressController.h"
#import "AddressModel.h"

@interface AddressEditController : MyCenterBaseController

@property (nonatomic,weak) MyAddressController *controller;


@property (nonatomic,getter=isComeFromeSureOrder) BOOL comeFromeSureOrder;


+ (instancetype)controllerWithAddressID:(NSString *)addressID;

@end
