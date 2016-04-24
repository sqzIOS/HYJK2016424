//
//  AdressModel.h
//  
//
//  Created by apple on 16/1/20.
//
//

#import <Foundation/Foundation.h>

@interface AddressModel : NSObject

@property (nonatomic,copy) NSString *addressID;
@property (nonatomic,copy) NSString *consignee;
@property (nonatomic,copy) NSString *email;
@property (nonatomic,copy) NSString *country;
@property (nonatomic,copy) NSString *province;
@property (nonatomic,copy) NSString *city;
@property (nonatomic,copy) NSString *district;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *zipcode;
@property (nonatomic,copy) NSString *tel;
@property (nonatomic,copy) NSString *mobile;
@property (nonatomic,copy) NSString *sign_building;
@property (nonatomic,copy) NSString *best_time;
@property (nonatomic,copy) NSString *default_address;


+ (instancetype)addressModelWithDict:(NSDictionary *)dict;

@end

//id:
//name:
//email:
//country:
//province:
//city:
//district:
//address:
//zipcode:
//tel:
//mobile:
//sign_building:
//best_time:
//default_address
