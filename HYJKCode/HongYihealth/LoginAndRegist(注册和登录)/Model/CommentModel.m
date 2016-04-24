//
//  CommentModel.m
//  
//
//  Created by apple on 16/1/29.
//
//

#import "CommentModel.h"

@implementation CommentModel

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    CommentModel *model = [[CommentModel alloc] init];
    
    model.commentID = dict[@"id"];
    model.author = dict[@"author"];
    model.disease_types = dict[@"disease_types"];
    model.content = dict[@"content"];
    model.rank = dict[@"rank"];
    model.effect_rank = dict[@"effect_rank"];
    model.attitude_rank = dict[@"attitude_rank"];
    model.recommend_rank = dict[@"recommend_rank"];
    model.create = dict[@"create"];
    model.re_content = dict[@"re_content"];
    
    return model;
}

@end


//@property (nonatomic,copy) NSString *commentID;
//@property (nonatomic,copy) NSString *author;
//@property (nonatomic,copy) NSString *disease_types;
//@property (nonatomic,copy) NSString *content;
//@property (nonatomic,copy) NSString *rank;
//@property (nonatomic,copy) NSString *effect_rank;
//@property (nonatomic,copy) NSString *attitude_rank;
//@property (nonatomic,copy) NSString *recommend_rank;
//@property (nonatomic,copy) NSString *create;
//@property (nonatomic,copy) NSString *re_content;