//
//  MessageModel.m
//  
//
//  Created by apple on 16/1/22.
//
//

#import "MessageModel.h"

@implementation MessageModel

+ (instancetype)messageModelWithDict:(NSDictionary *)dict
{
    MessageModel *model = [[MessageModel alloc] init];
    model.time = dict[@"time"];
    model.title = [NSString stringWithFormat:@"【%@】",dict[@"title"]];
    model.content = dict[@"content"];
    model.ID = dict[@"id"];
    model.type = dict[@"type"];
    model.typeName = dict[@"type_name"];
    model.isRead = [NSString stringWithFormat:@"%@",dict[@"is_read"]].boolValue;

    
    return model;
}

@end
