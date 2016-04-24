//
//  PatientCaseModel.h
//  
//
//  Created by apple on 16/1/19.
//
//

#import <Foundation/Foundation.h>

@interface PatientCaseModel : NSObject

@property (nonatomic,copy) NSString *case_id;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *blood_type;
@property (nonatomic,copy) NSString *bmi;
@property (nonatomic,copy) NSString *disease_desc;
@property (nonatomic,copy) NSString *disease_history;
@property (nonatomic,copy) NSString *height;
@property (nonatomic,copy) NSString *last_time;
@property (nonatomic,copy) NSString *rhblood_type;
@property (nonatomic,copy) NSString *weight;

/**
 * 是否被选中
 */
@property (nonatomic) BOOL isSelected;


+ (instancetype)patientCaseModelWithDict:(NSDictionary *)dict;


@end


