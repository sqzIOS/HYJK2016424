//
//  HBButton.m
//  TaQu
//
//  Created by haibaoIos on 15/2/9.
//  Copyright (c) 2015年 厦门海豹信息技术. All rights reserved.
//


#import "HBButton.h"

@implementation HBButton

@synthesize userInfo;
@synthesize hlColor = _hlColor;
@synthesize slColor = _slColor;
@synthesize cornerRadius = _cornerRadius;
@synthesize imageRoundCorner = _imageRoundCorner;
@synthesize fillColor = _fillColor;

- (id)init{
    self = [super init];
    if (self) {
        self.adjustsImageWhenHighlighted = NO;
        self.hlColor = COLOR_HIGHTLIGHT1;
        self.slColor = nil;
        self.showRealImg = NO;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.adjustsImageWhenHighlighted = NO;
        self.hlColor = COLOR_HIGHTLIGHT1;
        self.slColor = nil;
        self.showRealImg = NO;
    }
    return self;
}

//存在问题，暂时注释
- (CGRect)imageRectForContentRect:(CGRect)bounds{
    if (self.showRealImg) {
        return CGRectMake(0.0, 0.0, self.size.width, self.size.height);
    }
    else{
        return [super imageRectForContentRect:bounds];
    }
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    _coverView.frame = self.bounds;
}


- (void)setImageRoundCorner:(ImageRoundCorner)imageRoundCorner{
    _imageRoundCorner = imageRoundCorner;
    [self setNeedsDisplay];
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    if (_coverView.image) {
        _coverView.hidden = YES;
    }
    else{
        if (selected) {
            _coverView.backgroundColor = self.slColor;
        }
        else {
            _coverView.backgroundColor = [UIColor clearColor];
        }
    }
}

- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    //存在点按图标
    if (_coverView.image) {
        if (highlighted) {
            _coverView.hidden = NO;
        }
        else{
            _coverView.hidden = YES;
        }
    }
    else{
        if (highlighted) {
            _coverView.backgroundColor = self.hlColor;
        }
        else{
            _coverView.backgroundColor = [UIColor clearColor];
        }
    }

}

/*
 * imageURL 可以为NSURL，也可以为NSString
 * placeholderImage 默认图片
 * by hyk
 */
- (void)hb_setImageURL:(id)imageURL placeholderImage:(UIImage *)placeholderImage {
    if (!imageURL && !placeholderImage) {
        return;
    }
    
    if ([imageURL isKindOfClass:[NSString class]]) {
        if (![StringUtil isEmpty:imageURL]){
            imageURL = [NSURL URLWithString:imageURL];
        }
    }
    
    if (![imageURL isKindOfClass:[NSURL class]] && !placeholderImage){
        return;
    }
    [self sd_setBackgroundImageWithURL:imageURL forState:UIControlStateNormal placeholderImage:placeholderImage];
}

/*
 * imageURL 可以为NSURL，也可以为NSString
 * placeholderColor 根据颜色设置的默认图片
 * by hyk
 */
- (void)hb_setImageURL:(id)imageURL placeholderColor:(UIColor *)placeholderColor {
    UIImage *img = [UIImage imageWithColor:placeholderColor];
    [self hb_setImageURL:imageURL placeholderImage:img];
    
}

/*
 * 使用setImageView来加载图片而不是setBackgroundImageView
 * imageURL 可以为NSURL，也可以为NSString
 * placeholderColor 根据颜色设置的默认图片
 * by hyk
 */
- (void)hb_setRealImageURL:(id)imageURL placeholderImage:(UIImage *)placeholderImage{
    self.clipsToBounds = YES;
    if (!imageURL && !placeholderImage) {
        return;
    }
    
    self.showRealImg = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    if ([imageURL isKindOfClass:[NSString class]]) {
        if (![StringUtil isEmpty:imageURL]){
            imageURL = [NSURL URLWithString:imageURL];
        }
    }
    
    if (![imageURL isKindOfClass:[NSURL class]] && !placeholderImage){
        return;
    }
    
    [self sd_setImageWithURL:imageURL forState:UIControlStateNormal placeholderImage:placeholderImage];
}

/*
 * 使用setImageView来加载图片而不是setBackgroundImageView
 * imageURL 可以为NSURL，也可以为NSString
 * placeholderColor 根据颜色设置的默认图片
 * by hyk
 */
- (void)hb_setRealImageURL:(id)imageURL placeholderColor:(UIColor *)placeholderColor{
    UIImage *img = [UIImage imageWithColor:placeholderColor];
    [self hb_setRealImageURL:imageURL placeholderImage:img];
}

/*
 * imageURL 可以为NSURL，也可以为NSString
 * 自带默认图片 灰色背景
 * by lxq
 */
- (void)hb_setImageURL:(id)imageURL{
    UIImage *img = [ImageUtil defaultPlaceholderImageWithView:self];
    [self hb_setImageURL:imageURL placeholderImage:img];
}

/*
 * 使用setImageView来加载图片而不是setBackgroundImageView
 * imageURL 可以为NSURL，也可以为NSString
 * 自带默认图片 灰色背景
 * by lxq
 */
- (void)hb_setRealImageURL:(id)imageURL{
    UIImage *img = [ImageUtil defaultPlaceholderImageWithView:self];
    [self hb_setRealImageURL:imageURL placeholderImage:img];
}

//by soldier
- (void)setAvatarButton:(id)imageURL {
    [self setRoundButton];
    [self hb_setImageURL:imageURL placeholderImage:[ImageUtil createImageWithColor:GRAY_COLOR_BG]];
}

//by soldier
- (void)setRoundButton {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.width);
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width / 2.0;
    self.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)constructCoverView{
    _coverView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _coverView.backgroundColor = [UIColor clearColor];
    _coverView.userInteractionEnabled = NO;

    [self addSubview:_coverView];
}

- (void)setHlColor:(UIColor *)color{
    if (!_coverView) {
        [self constructCoverView];
    }
    _hlColor = color;
}

- (void)setSlColor:(UIColor *)color{
    if (!_coverView) {
        [self constructCoverView];
    }
    _slColor = color;
}

- (void)setHlImage:(UIImage *)hlImage{
    if (!_coverView) {
        [self constructCoverView];
    }
    
    self.hlColor = [UIColor clearColor];
    _coverView.image = hlImage;
    _coverView.hidden = YES;
}


- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    if(_cornerRadius <= 0){
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, _fillColor.CGColor);
    
    CGFloat minx = CGRectGetMinX(rect);
    CGFloat midx = CGRectGetMidX(rect);
    CGFloat maxx = CGRectGetMaxX(rect);
    
    CGFloat miny = CGRectGetMinY(rect);
    CGFloat midy = CGRectGetMidY(rect);
    CGFloat maxy = CGRectGetMaxY(rect);
    
    CGContextMoveToPoint(context, minx, midy);
    
    if(_imageRoundCorner & ImageRoundCorner_TopLeft){
        CGContextAddArcToPoint(context, minx, miny, midx, miny, _cornerRadius);
        CGContextAddLineToPoint(context, midx, miny);
    }
    else{
        CGContextAddLineToPoint(context, minx, miny);
        CGContextAddLineToPoint(context, midx, miny);
    }
    
    if(_imageRoundCorner & ImageRoundCorner_TopRight){
        CGContextAddArcToPoint(context, maxx, miny, maxx, midy, _cornerRadius);
        CGContextAddLineToPoint(context, maxx, midy);
    }
    else{
        CGContextAddLineToPoint(context, maxx, miny);
        CGContextAddLineToPoint(context, maxx, midy);
    }
    
    if(_imageRoundCorner & ImageRoundCorner_BottomRight){
        CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, _cornerRadius);
        CGContextAddLineToPoint(context, midx, maxy);
    }
    else{
        CGContextAddLineToPoint(context, maxx, maxy);
        CGContextAddLineToPoint(context, midx, maxy);
    }
    
    if(_imageRoundCorner & ImageRoundCorner_BottomLetf){
        CGContextAddArcToPoint(context, minx, maxy, minx, midy, _cornerRadius);
        CGContextAddLineToPoint(context, minx, midy);
    }
    else{
        CGContextAddLineToPoint(context, minx, maxy);
        CGContextAddLineToPoint(context, minx, midy);
    }
    
    CGContextDrawPath(context, kCGPathFill);
    
    
}

@end