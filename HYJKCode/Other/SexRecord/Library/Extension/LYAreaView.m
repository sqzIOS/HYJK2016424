//
//  LYAreaView.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/27.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "LYAreaView.h"

@implementation LYAreaView

@end

@implementation LYViewArea
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if(_extendTouchRange == 0)
        _extendTouchRange = 15;
    
    if(_extendTouchRangeX == 0)
        _extendTouchRangeX = _extendTouchRange;
    
    if(_extendTouchRangeY == 0)
        _extendTouchRangeY = _extendTouchRange;
    
    CGRect bounds = self.bounds;
    bounds.origin = CGPointMake(-_extendTouchRangeX,-_extendTouchRangeY);
    bounds.size = CGSizeMake(bounds.size.width + _extendTouchRangeX * 2, bounds.size.height+ _extendTouchRangeY * 2);
    return CGRectContainsPoint(bounds, point);
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
    
}

@end

//点击区域扩大Button
@implementation LYButtonArea
{
    NSMutableDictionary *_colors;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _colors = [NSMutableDictionary dictionary];
    }
    return self;
}
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    // If it is normal then set the standard background here
    if(state == UIControlStateNormal)
    {
        [super setBackgroundColor:backgroundColor];
    }
    // Store the background colour for that state
    [_colors setValue:backgroundColor forKey:[self keyForState:state]];
}
- (UIColor *)backgroundColorForState:(UIControlState)state
{
    return [_colors valueForKey:[self keyForState:state]];
}
- (void)setHighlighted:(BOOL)highlighted
{
    // Do original Highlight
    [super setHighlighted:highlighted];
    // Highlight with new colour OR replace with orignial
    NSString *highlightedKey = [self keyForState:UIControlStateHighlighted];
    UIColor *highlightedColor = [_colors valueForKey:highlightedKey];
    if (highlighted && highlightedColor) {
        [super setBackgroundColor:highlightedColor];
    } else {
        // 由于系统在调用setSelected后，会再触发一次setHighlighted，故做如下处理，否则，背景色会被最后一次的覆盖掉。
        if ([self isSelected]) {
            NSString *selectedKey = [self keyForState:UIControlStateSelected];
            UIColor *selectedColor = [_colors valueForKey:selectedKey];
            [super setBackgroundColor:selectedColor];
        } else {
            NSString *normalKey = [self keyForState:UIControlStateNormal];
            [super setBackgroundColor:[_colors valueForKey:normalKey]];
        }
    }
}
- (void)setSelected:(BOOL)selected
{
    // Do original Selected
    [super setSelected:selected];
    // Select with new colour OR replace with orignial
    NSString *selectedKey = [self keyForState:UIControlStateSelected];
    UIColor *selectedColor = [_colors valueForKey:selectedKey];
    if (selected && selectedColor) {
        [super setBackgroundColor:selectedColor];
    } else {
        NSString *normalKey = [self keyForState:UIControlStateNormal];
        [super setBackgroundColor:[_colors valueForKey:normalKey]];
    }
}
- (NSString *)keyForState:(UIControlState)state
{
    return [NSString stringWithFormat:@"state_%d", state];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if(_extendTouchRange == 0)
        _extendTouchRange = 15;
    
    if(_extendTouchRangeX == 0)
        _extendTouchRangeX = _extendTouchRange;
    
    if(_extendTouchRangeY == 0)
        _extendTouchRangeY = _extendTouchRange;
    
    CGRect bounds = self.bounds;
    bounds.origin = CGPointMake(-_extendTouchRangeX,-_extendTouchRangeY);
    bounds.size = CGSizeMake(bounds.size.width + _extendTouchRangeX * 2, bounds.size.height+ _extendTouchRangeY * 2);
    return CGRectContainsPoint(bounds, point);
}
@end