//
//  CommentsController.h
//  
//
//  Created by apple on 16/1/29.
//
// 评价医生

#import <UIKit/UIKit.h>

@interface CommentsController : MyCenterBaseController


/**
 *  对医师进行评价界面
 *
 *  @param doctorID    医生id
 *  @param orderID     订单id
 *  @param deseaseName 疾病名字
 */
+ (instancetype)controllerWithDoctorID:(NSString *)doctorID andOrderID:(NSString *)orderID andDeseaseName:(NSString *)deseaseName;

@end
