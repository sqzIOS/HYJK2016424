//
//  AreaModel.h
//  
//
//  Created by apple on 16/1/22.
//
//

#import <Foundation/Foundation.h>

@interface AreaModel : NSObject

@property (nonatomic,copy) NSString *areaID;
@property (nonatomic,copy) NSString *name;


+ (instancetype)areaModelWithDict:(NSDictionary *)dict;

@end
