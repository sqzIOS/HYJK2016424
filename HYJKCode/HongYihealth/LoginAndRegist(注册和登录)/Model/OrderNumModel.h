//
//  OrderNumModel.h
//  
//
//  Created by apple on 16/1/14.
//
//

#import <Foundation/Foundation.h>

@interface OrderNumModel : NSObject

@property (nonatomic,copy) NSString *await_pay;
@property (nonatomic,copy) NSString *await_ship;
@property (nonatomic,copy) NSString *finished;
@property (nonatomic,copy) NSString *shipped;

+ (instancetype)orderNumModelWithDict:(NSDictionary *)dict;

@end


//"await_pay" = 0;
//"await_ship" = 0;
//finished = 0;
//shipped = 0;