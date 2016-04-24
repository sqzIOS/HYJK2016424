//
//  CommentsListController.h
//  
//
//  Created by apple on 16/1/29.
//
// 医生评价列表

#import "MyCenterBaseController.h"

@interface CommentsListController : MyCenterBaseController

/**
 *  医师评价列表控制器
 *
 *  @param doctorID 医生id
 */
+ (instancetype)controllerWithDoctorID:(NSString *)doctorID;

@end
