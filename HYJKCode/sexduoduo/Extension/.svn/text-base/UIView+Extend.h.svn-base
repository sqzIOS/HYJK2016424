//
//  UIView+Extend.h
//  LY
//
//  Created by ly1992 on 15/4/21.
//  Copyright (c) 2015年 ly1992. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extend)
/**
 *常用属性参数
 **/
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;
/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;



- (id)initWithView:(UIView *)aView;

-(void)removeAllSubviews;
-(UIViewController*)viewController;

-(id)findViewParentWithClass:(Class)clazz;

- (void)debug;
- (void)debug:(BOOL)enable;

- (void)fuckBlur;
+ (id)bolang;
+ (id)bolangForWindow;


@end
