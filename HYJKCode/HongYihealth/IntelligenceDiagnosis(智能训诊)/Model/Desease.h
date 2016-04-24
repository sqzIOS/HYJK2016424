//
//  Desease.h
//  
//
//  Created by wenzhizheng on 16/1/10.
//
//

#import <Foundation/Foundation.h>

@interface Desease : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *category_img;
@property (nonatomic,strong) NSArray *children;
@property (nonatomic,copy) NSString *category_id;


+ (instancetype)deseaseWithDict:(NSDictionary *)dict;

@end
