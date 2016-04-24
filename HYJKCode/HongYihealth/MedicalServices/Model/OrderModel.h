//
//  OrderModel.h
//  
//
//  Created by 刘朝涛 on 16/1/23.
//
//  功能: 订单model

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject

@property (nonatomic, copy) NSString *oderID;   //订单id

@property (nonatomic, copy) NSString *yuyue_time; //预约时间

@property (nonatomic, copy) NSString *shipping_id; //医师地址id

@property (nonatomic, copy) NSString *pay_id;   //支付方式id

@property (nonatomic, copy) NSString *goodsName;    //商品名称

@property (nonatomic, copy) NSString *doctor_hospital;  //商品介绍

@property (nonatomic, copy) NSString *userName; //用户姓名

@property (nonatomic, copy) NSString *userPhone;    //用户电话

@property (nonatomic, copy) NSString *shop_price; //价格

@property (nonatomic, copy) NSString *order_sn; //订单预约号

@property (nonatomic, copy) NSString *order_status_name;    //订单状态

@end
