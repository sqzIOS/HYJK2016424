//
//  ServiceModel.h
//  
//
//  Created by apple on 16/1/19.
//
//

#import <Foundation/Foundation.h>

@interface ServiceModel : NSObject

@property (nonatomic,copy) NSString *contact_name;
@property (nonatomic,copy) NSString *custom_id;
@property (nonatomic,copy) NSString *custom_time;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *disease_desc;
@property (nonatomic,copy) NSString *mobile;
@property (nonatomic,copy) NSString *region;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *update_time;
@property (nonatomic,copy) NSString *user_id;

+ (instancetype)serviceModelWithDict:(NSDictionary *)dict;

@end


