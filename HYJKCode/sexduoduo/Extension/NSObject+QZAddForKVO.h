//
//  NSObject+QZAddForKVO.h
//  sexduoduo
//
//  Created by showm on 15/12/11.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (QZAddForKVO)

/**
 Registers a block to receive KVO notifications for the specified key-path
 relative to the receiver.
 
 @discussion The block and block captured objects are retained. Call
 `removeObserverBlocksForKeyPath:` or `removeObserverBlocks` to release.
 
 @param keyPath The key path, relative to the receiver, of the property to
 observe. This value must not be nil.
 
 @param block   The block to register for KVO notifications.
 */
- (void)qzAddObserverBlockForKeyPath:(NSString*)keyPath block:(void (^)( id obj, id oldVal, id newVal))block;

/**
 Stops all blocks (associated by `addObserverBlockForKeyPath:block:`) from
 receiving change notifications for the property specified by a given key-path
 relative to the receiver, and release these blocks.
 
 @param keyPath A key-path, relative to the receiver, for which blocks is
 registered to receive KVO change notifications.
 */
- (void)qzRemoveObserverBlocksForKeyPath:(NSString*)keyPath;

/**
 Stops all blocks (associated by `addObserverBlockForKeyPath:block:`) from
 receiving change notifications, and release these blocks.
 */
- (void)qzRemoveObserverBlocks;



@end
