//
//  ExaminationModel.h
//  
//
//  Created by apple on 16/1/27.
//
//

#import <Foundation/Foundation.h>

@interface ExaminationModel : NSObject

@property (nonatomic,copy) NSString *custom_id;
@property (nonatomic,copy) NSString *user_id;
@property (nonatomic,copy) NSString *id_card;
@property (nonatomic,copy) NSString *medical_institutions;
@property (nonatomic,copy) NSString *mobile;
@property (nonatomic,copy) NSString *contact_name;
@property (nonatomic,copy) NSString *region;
@property (nonatomic,copy) NSString *disease_desc;
@property (nonatomic,copy) NSString *custom_time;
@property (nonatomic,copy) NSString *update_time;
@property (nonatomic,copy) NSString *status;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end


