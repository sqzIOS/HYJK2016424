//
//  ConsultingModel.h
//  
//
//  Created by 刘朝涛 on 16/1/1.
//
//  功能: 医师数据模型

#import <Foundation/Foundation.h>

@interface ConsultingModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *doctoeHead;

@property (nonatomic, copy) NSString *goods_id; //医师id

@property (nonatomic, copy) NSString *doctorName;   //姓名

@property (nonatomic, copy) NSString *doctorDeparment;  //科室

@property (nonatomic, copy) NSString *doctorJobName;    //职称

@property (nonatomic, copy) NSString *doctor_hospital;  //医院

@property (nonatomic, copy) NSString *market_price;    // 优惠前价格

@property (nonatomic, copy) NSString *shop_price;   // 实际价格

@property (nonatomic, copy) NSString *doctorIntroduce;    //医师简介

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *address;  //预约地点

@property (nonatomic, copy) NSString *job2Str;

@property (nonatomic, copy) NSString *starNum;  //分数

@property (nonatomic, copy) NSString *collected;  // 是否关注

@property (nonatomic, copy) NSString *isAbout;    // 是否可预约

@property (nonatomic, copy) NSString *brand_id; //医院id

@property (nonatomic, copy) NSString *cat_id;   //科室id

@property (nonatomic, copy) NSString *click_count;  //什么点击数量

@property (nonatomic, copy) NSString *orderTime;    //预约时间


- (instancetype)initWithDic:(NSDictionary *)dict;

@end
