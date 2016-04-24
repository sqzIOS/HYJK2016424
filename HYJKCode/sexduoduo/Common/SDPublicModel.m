//
//  SDPublicModel.m
//  sexduoduo
//
//  Created by shown on 15/12/7.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SDPublicModel.h"
#import <objc/runtime.h>

@implementation SDPublicModel

#pragma mark -- 通过字符串来创建该字符串的Setter方法，并返回
- (SEL)creatSetterWithPropertyName:(NSString *)propertyName {
    
    //1.首字母大写
    //    propertyName = propertyName.capitalizedString;
    NSString *a = [propertyName substringToIndex:1];
    
    NSString *c = a.capitalizedString;
    
    NSString *b = [propertyName substringFromIndex:1];
    
    //2.拼接上set关键字
    propertyName = [NSString stringWithFormat:@"set%@%@:",c,b];
    
    //返回set方法
    return NSSelectorFromString(propertyName);
}

- (SEL)creatGetterWithPropertyName:(NSString *)propertyName {
    
    //返回set方法
    return NSSelectorFromString(propertyName);
}

/************************************************************************
 *把字典赋值给当前实体类的属性
 *参数：字典
 *适用情况：当网络请求的数据的key与实体类的属性相同时可以通过此方法吧字典的Value
 *        赋值给实体类的属性
 ************************************************************************/

-(void) assginToPropertyWithDictionary: (NSDictionary *) data {
    
    if (data == nil) {
        return;
    }
    
    //1.获取字典的key
    NSArray *dicKey = [data allKeys];
    
    ///2.循环遍历字典key, 并且动态生成实体类的setter方法，把字典的Value通过setter方法
    ///赋值给实体类的属性
    
    for (int i = 0; i < dicKey.count; i++) {
        
        ///2.1 通过getSetterSelWithAttibuteName 方法来获取实体类的set方法
        SEL setSel = [self creatSetterWithPropertyName:dicKey[i]];
        
        if ([self respondsToSelector:setSel]) {
            
            ///2.2 获取字典中key对应的value
            if ([data[dicKey[i]] isKindOfClass:[NSArray class]]) {
                NSArray *value = data[dicKey[i]];
                //2.3 把值通过setter方法赋值给实体类的属性
                [self performSelectorOnMainThread:setSel withObject:value waitUntilDone:[NSThread isMainThread]];
            }else {
                NSString *value = [NSString stringWithFormat:@"%@",data[dicKey[i]]];
                //2.3 把值通过setter方法赋值给实体类的属性
                [self performSelectorOnMainThread:setSel withObject:value waitUntilDone:[NSThread isMainThread]];
            }
        }
    }
}


///通过运行时获取当前对象的所有属性的名称，以数组的形式返回
- (NSArray *) allPropertyNames{
    ///存储所有的属性名称
    NSMutableArray *allNames = [[NSMutableArray alloc] init];
    
    ///存储属性的个数
    unsigned int propertyCount = 0;
    
    ///通过运行时获取当前类的属性
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    
    //把属性放到数组中
    for (int i = 0; i < propertyCount; i ++) {
        ///取出第一个属性
        objc_property_t property = propertys[i];
        
        const char * propertyName = property_getName(property);
        
        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
    }
    
    ///释放
    free(propertys);
    
    return allNames;
}

- (void) displayCurrentModleProperty{
    
    //获取实体类的属性名
    NSArray *array = [self allPropertyNames];
    
    //拼接参数
    NSMutableString *resultString = [[NSMutableString alloc] init];
    
    for (int i = 0; i < array.count; i ++) {
        
        //获取get方法
        SEL getSel = [self creatGetterWithPropertyName:array[i]];
        
        if ([self respondsToSelector:getSel]) {
            
            //获得类和方法的签名
            NSMethodSignature *signature = [self methodSignatureForSelector:getSel];
            
            //从签名获得调用对象
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            
            //设置target
            [invocation setTarget:self];
            
            //设置selector
            [invocation setSelector:getSel];
            
            //接收返回的值
            NSObject *__unsafe_unretained returnValue = nil;
            
            //调用
            [invocation invoke];
            
            //接收返回值
            [invocation getReturnValue:&returnValue];
            
            [resultString appendFormat:@"%@\n", returnValue];
        }
    }
    NSLog(@"%@", resultString);
}

#pragma 返回属性和字典key的映射关系
-(NSDictionary *) propertyMapDic {
    return @{@"keyBoy1":@"boy1",
             @"keyBoy2":@"boy2",
             @"keyBoy3":@"boy3",
             @"keyBoy4":@"boy4",};
}

#pragma 根据映射关系来给Model的属性赋值
-(void) assginToPropertyWithNoMapDictionary: (NSDictionary *) data{
    ///获取字典和Model属性的映射关系
    NSDictionary *propertyMapDic = [self propertyMapDic];
    
    ///转化成key和property一样的字典，然后调用assginToPropertyWithDictionary方法
    
    NSArray *dicKey = [data allKeys];
    
    
    NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] initWithCapacity:dicKey.count];
    
    for (int i = 0; i < dicKey.count; i ++) {
        NSString *key = dicKey[i];
        [tempDic setObject:data[key] forKey:propertyMapDic[key]];
    }
    
    [self assginToPropertyWithDictionary:tempDic];
    
}

- (instancetype)initWithDictionary:(NSDictionary *)data {
    
    if (self = [super init]) {
        
        if ([self propertyMapDic] == nil) {
            [self assginToPropertyWithDictionary:data];
        } else {
            [self assginToPropertyWithNoMapDictionary:data];
        }
    }
    return self;
}

+ (id)SDPublicModelWithDictionary:(NSDictionary *)data {
    return [[self alloc] initWithDictionary:data];
}


@end
