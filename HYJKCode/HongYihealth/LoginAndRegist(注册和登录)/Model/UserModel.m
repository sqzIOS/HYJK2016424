//
//  UserModel.m
//  
//
//  Created by apple on 16/1/14.
//
//

#import "UserModel.h"

@implementation UserModel

+ (instancetype)uesrModelWithDict:(NSDictionary *)dict
{
    UserModel *model = [[UserModel alloc] init];
    model.avatar = dict[@"avatar"];
    model.collection_num = [NSString stringWithFormat:@"%@",dict[@"collection_num"]];
    model.email = [NSString stringWithFormat:@"%@",dict[@"email"]];
    model.ID = [NSString stringWithFormat:@"%@",dict[@"id"]];
    model.mobile_phone = [NSString stringWithFormat:@"%@",dict[@"mobile_phone"]];
    model.name = [NSString stringWithFormat:@"%@",dict[@"name"]];
    model.nick_name = [NSString stringWithFormat:@"%@",dict[@"nick_name"]];
    model.order_num = [OrderNumModel orderNumModelWithDict:dict[@"order_num"]];
    model.rank_level = [NSString stringWithFormat:@"%@",dict[@"rank_level"]];
    model.rank_name = [NSString stringWithFormat:@"%@",dict[@"rank_name"]];

    
    return model;
}

@end

