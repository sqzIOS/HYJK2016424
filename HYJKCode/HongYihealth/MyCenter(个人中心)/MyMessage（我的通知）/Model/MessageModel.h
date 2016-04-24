//
//  MessageModel.h
//  
//
//  Created by apple on 16/1/22.
//
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *type;
@property (nonatomic) BOOL isRead;
@property (nonatomic,copy) NSString *typeName;


+ (instancetype)messageModelWithDict:(NSDictionary *)dict;

@end
