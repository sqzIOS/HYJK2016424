//
//  CommentModel.h
//  
//
//  Created by apple on 16/1/29.
//
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject

@property (nonatomic,copy) NSString *commentID;
@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *disease_types;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *rank;
@property (nonatomic,copy) NSString *effect_rank;
@property (nonatomic,copy) NSString *attitude_rank;
@property (nonatomic,copy) NSString *recommend_rank;
@property (nonatomic,copy) NSString *create;
@property (nonatomic,copy) NSString *re_content;


+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
