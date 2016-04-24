//
//  BookingDetailController.h
//  
//
//  Created by wenzhizheng on 16/1/9.
//
//

#import "MyCenterBaseController.h"

@class BookingModel;

@interface BookingDetailController : MyCenterBaseController

+ (instancetype)bookingDetailControllerWithModel:(BookingModel *)model;

@end
