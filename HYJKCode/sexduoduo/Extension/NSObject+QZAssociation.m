//
//  NSObject+QZAssociation.m
//  sexduoduo
//
//  Created by showm on 15/10/14.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "NSObject+QZAssociation.h"
#import <objc/runtime.h>

@implementation NSObject (QZAssociation)
static char associatedObjectsKey;

- (id)qzAssociatedObjectForKey:(NSString*)key
{
    NSMutableDictionary *dict = objc_getAssociatedObject(self, &associatedObjectsKey);
    
    return [dict objectForKey:key];
}
    
- (void)qzSetAssociatedObject:(id)object forKey:(NSString*)key
{
    NSMutableDictionary *dict = objc_getAssociatedObject(self, &associatedObjectsKey);
    
    if (!dict) {
        
        dict = [[NSMutableDictionary alloc] init];
        
        objc_setAssociatedObject(self, &associatedObjectsKey, dict,OBJC_ASSOCIATION_RETAIN);
        
    }
    
    [dict setObject:object forKey:key];
}

@end
