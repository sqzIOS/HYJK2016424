//
//  UIButton+Extend.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/27.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "UIButton+Extend.h"

@implementation UIButton (Extend)
//图片+文字 == 按钮
-(void)lkCustomTitleStr:(NSString*)title imageStr:(UIImage*)image
{
    UIView *view = [[UIView alloc]init];
    
    UIImageView *img = [[UIImageView alloc]init];
    img.frame = CGRectMake(0, (self.height - image.size.height)/2, image.size.width, image.size.width);
    img.backgroundColor = [UIColor clearColor];
    img.image = image;
    [view addSubview:img];
    //
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    CGSize size = [LYGlobalDefine getTextContent:title withFont:label.font];
    label.frame = CGRectMake(img.width, (self.height - image.size.height)/2, size.width, size.height);
    label.text = title;
    [view addSubview:label];
    //
    view.size = CGSizeMake(label.right - img.left, img.height);
    [self addSubview:view];
}
-(void)lkTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:colorWith01 forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateHighlighted];
}
-(void)lkTitleColor:(UIColor *)color
{
    [self lkTitleColor:color highl:color];
}
-(void)lkTitleColor:(UIColor *)color1 highl:(UIColor *)color2
{
    [self setTitleColor:color1 forState:UIControlStateNormal];
    [self setTitleColor:color2 forState:UIControlStateHighlighted];
}

-(void)lkImage:(id)image
{
    [self lkImage:image highl:image];
}
-(void)lkImage:(id)img1 highl:(id)img2
{
    [self lkImage:img1 highl:img2 stretch:NO];
}
-(void)lkImage:(id)img1 highl:(id)img2 stretch:(BOOL)stretch
{
    //正常
    UIImage* image = nil;
    if([img1 isKindOfClass:[NSString class]])
        image = [UIImage imageNamed:img1];
    if([img1 isKindOfClass:[UIImage class]])
        image = img1;
    if(image && stretch==NO)
    {
        float edgeWidth = (self.width-image.size.width)/2;
        float edgeHeight = (self.height-image.size.height)/2;
        if(edgeWidth>0 && edgeHeight>0)
            [self setImageEdgeInsets:UIEdgeInsetsMake(edgeHeight, edgeWidth, edgeHeight, edgeWidth)];
    }
    //点击
    UIImage* highimage = nil;
    if([img2 isKindOfClass:[NSString class]])
        highimage = [UIImage imageNamed:img2];
    if([img2 isKindOfClass:[UIImage class]])
        highimage = img2;
    
    if(stretch)
    {
        image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
        highimage = [highimage stretchableImageWithLeftCapWidth:highimage.size.width/2 topCapHeight:highimage.size.height/2];
    }
    [self setImage:image forState:UIControlStateNormal];
    
    do {
        if(image&&IOS7&&highimage==nil)
            break;
        
        [self setImage:highimage forState:UIControlStateHighlighted];
    } while (0);
    
}

-(void)lkBackgroupImage:(id)image
{
    [self lkBackgroupImage:image highl:image];
}
-(void)lkBackgroupImage:(id)img1 highl:(id)img2
{
    [self lkBackgroupImage:img1 highl:img2 stretch:NO];
}
-(void)lkBackgroupImage:(id)img1 highl:(id)img2 stretch:(BOOL)stretch
{
    //正常
    UIImage* image = nil;
    if([img1 isKindOfClass:[NSString class]])
        image = [UIImage imageNamed:img1];
    if([img1 isKindOfClass:[UIImage class]])
        image = img1;
    
    //点击
    UIImage* highimage = nil;
    if([img2 isKindOfClass:[NSString class]])
        highimage = [UIImage imageNamed:img2];
    if([img2 isKindOfClass:[UIImage class]])
        highimage = img2;
    
    if(stretch)
    {
        image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
        highimage = [highimage stretchableImageWithLeftCapWidth:highimage.size.width/2 topCapHeight:highimage.size.height/2];
    }
    
    [self setBackgroundImage:image forState:UIControlStateNormal];
    
    do {
        if(image&&IOS7&&highimage==nil)
            break;
        
        [self setBackgroundImage:highimage forState:UIControlStateHighlighted];
    } while (0);
}
@end
