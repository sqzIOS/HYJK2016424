//
//  DorctorModel.h
//  
//
//  Created by wenzhizheng on 16/1/24.
//
//

#import <Foundation/Foundation.h>

@interface DorctorModel : NSObject



@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *detail;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *ID;

+ (instancetype)dorctorModelWithDict:(NSDictionary *)dict;


@end
