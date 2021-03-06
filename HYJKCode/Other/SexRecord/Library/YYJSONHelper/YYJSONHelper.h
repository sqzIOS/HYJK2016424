//
// Created by ivan on 13-7-17.
//
//
/*
   可惜只能单层解析 
   TMD
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@protocol YYJSONHelperProtocol

@end

@interface NSObject (YYJSONHelper)

+ (void)copyPropertiesFrom:(id)object to:(id)targetObject ignoreNil:(BOOL)ignore;

/**
*   如果model需要取父类的属性，那么需要自己实现这个方法，并且返回YES
*/
+ (BOOL)YYSuper;

/**
 *  要忽略的属性名
 */
+ (NSArray*)YYIgnorePropertyNames;

/**
*   映射好的字典
*   {jsonkey:property}
*/
+ (NSDictionary *)YYJSONKeyDict;

/**
*   自己绑定jsonkey和property
*   如果没有自己绑定，默认为 {jsonkey:property} 【jsonkey=property】
*/
+ (void)bindYYJSONKey:(NSString *)jsonKey toProperty:(NSString *)property;

/**
*   返回jsonString
*/
- (NSString *)YYJSONString;

/**
*   返回jsonData
*/
- (NSData *)YYJSONData;

/**
*   返回json字典，不支持NSArray
*/
- (NSDictionary *)YYJSONDictionary;


@end

@interface NSObject (YYProperties)
/**
*   根据传入的class返回属性集合
*/
const char * property_getTypeString( objc_property_t property );
- (NSArray *)yyPropertiesOfClass:(Class)aClass;
+ (NSString *)propertyConformsToProtocol:(Protocol *)protocol propertyName:(NSString *)propertyName;
@end


@interface NSString (YYJSONHelper)
- (NSData*)toData;

- (id)toModel:(Class)modelClass;

- (id)toModel:(Class)modelClass forKey:(NSString *)jsonKey;

- (NSArray *)toModels:(Class)modelClass;

- (NSArray *)toModels:(Class)modelClass forKey:(NSString *)jsonKey;
@end

@interface NSDictionary (YYJSONHelper)
/**
*   返回jsonString
*/
- (NSString *)YYJSONString;

- (id)yyObjectForKey:(id)key;

-(id)toModel:(Class)modelClass;
@end

/**
*   默认采用iOS5自带的解析，经过我不科学的测试，系统自带的解析是最快的，所以推荐大家使用系统自带的
*   这里的枚举只作用于 json to NSObject ，NSObject to jsonString jsonData等全部使用系统自带的
*/
typedef enum
{
    YYNSJSONSerialization = 0,
    YYJSONKit,
    YYJsonLiteParser,
    YYOKJSONParser

} YYJSONParserType;

@interface NSData (YYJSONHelper)
- (id)toYYJSONObject;
/**
*   传入modelClass，返回对应的实例
*/
- (id)toModel:(Class)modelClass;

/**
*   传入modelClass和json的key，返回对用的实例
*/
- (id)toModel:(Class)modelClass forKey:(NSString *)key;

/**
*   传入modelClass，返回对应的实例集合
*/
- (NSArray *)toModels:(Class)modelClass;

/**
*   传入modelClass和key，返回对应的实例集合
*/
- (NSArray *)toModels:(Class)modelClass forKey:(NSString *)key;

/**
*   返回jsonString
*/
- (NSString *)YYJSONString;

/**
 *  返回指定key的值
 */
- (id)valueForJsonKey:(NSString *)key;
@end

@interface NSArray (YYJSONHelper)
/**
*   返回jsonString
*/
- (NSString *)YYJSONString;

/**
*   返回jsonData
*/
- (NSData *)YYJSONData;

/**
 *   传入modelClass，返回对应的实例
 */
- (NSArray*)toModels:(Class)modelClass;
/**
 *   传入modelClass，返回对应的实例
 */
- (NSMutableArray *)toModelsEx:(Class)modelClass;
@end