//
//  CommentBar.h
//  
//
//  Created by apple on 16/1/29.
//
//

#import <UIKit/UIKit.h>

@class  CommentBar;

@protocol CommentBarDelegate <NSObject>

- (void)commentBar:(CommentBar *)commentBar didSetValue:(int)value;

@end

@interface CommentBar : UIView

@property (nonatomic) int value;

@property (nonatomic,weak) id<CommentBarDelegate> delegate;

+ (instancetype)commentBarWithFrame:(CGRect)frame andMargin:(CGFloat)margin;


@end
