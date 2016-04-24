//
//  BookingModel.h
//  
//
//  Created by wenzhizheng on 16/1/3.
//
//

#import <Foundation/Foundation.h>

@interface BookingModel : NSObject

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@property (nonatomic,copy) NSString *patientName;
@property (nonatomic,copy) NSString *patientPhone;
@property (nonatomic,copy) NSString *progress;
@property (nonatomic,copy) NSString *doctorID;
@property (nonatomic,copy) NSString *doctorName;
@property (nonatomic,copy) NSString *doctorPhoto;
@property (nonatomic,copy) NSString *doctorDetail;
@property (nonatomic,copy) NSString *treatDay;
@property (nonatomic,copy) NSString *treatTime;
@property (nonatomic,copy) NSString *orderNumber;
@property (nonatomic,copy) NSString *orderID;

@property (nonatomic,strong) NSDictionary *doctorInfo;
@property (nonatomic,strong) NSDictionary *patientInfo;
@property (nonatomic,strong) NSDictionary *orderInfo;



@end
