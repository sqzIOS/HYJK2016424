//
//  UserModel.h
//  
//
//  Created by apple on 16/1/14.
//
//

#import <Foundation/Foundation.h>
#import "OrderNumModel.h"

@interface UserModel : NSObject

@property (nonatomic,copy) NSString *avatar;
@property (nonatomic,copy) NSString *collection_num;
@property (nonatomic,copy) NSString *email;
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *mobile_phone;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,copy) NSString *nick_name;
@property (nonatomic,strong) OrderNumModel *order_num;
@property (nonatomic,copy) NSString *rank_level;
@property (nonatomic,copy) NSString *rank_name;

+ (instancetype)uesrModelWithDict:(NSDictionary *)dict;

@end


//avatar = "http://test.hyyl.cc/images/Avator/avator436_201601.png";
//"collection_num" = 0;
//email = "760949821@qq.com";
//id = 436;
//"mobile_phone" = 18065217998;
//name = 18065217998;
//"nick_name" = iamt;
//"order_num" =     {
//    "await_pay" = 0;
//    "await_ship" = 0;
//    finished = 0;
//    shipped = 0;
//};
//"rank_level" = 0;
//"rank_name" = "\U8d35\U5bbe\U7528\U6237";