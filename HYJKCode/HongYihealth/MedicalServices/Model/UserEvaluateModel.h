//
//  UserEvaluateModel.h
//  
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能: 用户评价

#import <Foundation/Foundation.h>

@interface UserEvaluateModel : NSObject

@property (nonatomic, copy) NSString *author;   //回复人昵称

@property (nonatomic, copy) NSString *content;  //回复内容

@property (nonatomic, copy) NSString *attitude_rank;    //医师态度

@property (nonatomic, copy) NSString *effect_rank;  //治疗效果

@property (nonatomic, copy) NSString *recommend_rank;   //总推荐数

@property (nonatomic, copy) NSString *idStr;    //id

@property (nonatomic, copy) NSString *disease_types;   //类别

@property (nonatomic, copy) NSString *rank; //总评价数量

- (instancetype)initWithDic:(NSDictionary *)dict;

@end
