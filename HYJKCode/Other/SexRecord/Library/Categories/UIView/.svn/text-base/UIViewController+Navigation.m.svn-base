//
//  UIViewController+Navigation.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/27.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "UIViewController+Navigation.h"

#define kNavigationTitleViewHeight 28
#define kNavigationLeftViewHeight 44
#define kNavigationLeftViewWidth 66

#define topLeftButtonTag   11111
#define topRightButtonTag  22222


@implementation UIViewController (Navigation)


#pragma mark ---外部接口调用
/**
 *  左边导航条按钮
 *
 *  @return
 */
-(UIButton*)topLeftButton
{
    return [self barButtonItemWithLeft:YES];
}
/**
 *  右边导航条按钮
 *
 *  @return
 */
-(UIButton*)topRightButton
{
    return [self barButtonItemWithLeft:NO];
}
/**
 *  默认左边导航条按钮
 *
 *  @return
 */
-(void)topLeftButtonIsBack
{
    self.topLeftButton.width += APP_SPACE(20);
    UIImage* image = [UIImage imageNamed:@"navigation_back"];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0, (self.topLeftButton.height - APP_SPACE(30))/2, APP_SPACE(30), APP_SPACE(30));
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = image;
    [self.topLeftButton addSubview:imageView];
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.text = NSLocalizedString(@"返回", nil);
    label.textColor = colorWith01;
    CGSize size =  [LYGlobalDefine getTextContent:label.text withFont:label.font];
    label.frame = CGRectMake(imageView.width - APP_SPACE(5), (self.topLeftButton.height - size.height)/2, size.width + 10, size.height);
    [self.topLeftButton addSubview:label];
    [self.topLeftButton addTarget:self action:@selector(bt_top_action_back) forControlEvents:UIControlEventTouchUpInside];
//    self.topLeftButton.backgroundColor = [UIColor redColor];
    //    [self.topLeftButton setImage:image forState:UIControlStateNormal];
//    [self.topLeftButton setTitle:NSLocalizedString(@"fanhui", nil) forState:UIControlStateNormal];
    
    
}
/**
 *  导航条中间添加图片
 *
 *  @return
 */
-(void)titleView:(UIImage*)image
{
    UIImageView *imageView = [[UIImageView alloc]init];
    CGSize size = [UIImage sizeWithHeightImage:image scaledToWidth:kNavigationTitleViewHeight];
    imageView.size = CGSizeMake(size.width, size.height);
    imageView.image = image;
    self.navigationItem.titleView = imageView;
}
/**
 *  导航条中间添加文字
 *  color 默认主题色
 *  @return
 */
-(void)titleText:(NSString*)title withColor:(UIColor*)color
{
    if (color == nil) {
        color = colorWith01;
    }
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.font = Font_ExtraLarge;
    label.textColor = color;
    label.text = title;
    CGSize size = [LYGlobalDefine getTextContent:label.text withFont:label.font];
    label.size = CGSizeMake(size.width, size.height);
    self.navigationItem.titleView = label;
}

#pragma mark ---内部接口方法
-(UIButton*)barButtonItemWithLeft:(BOOL)isLeft
{
    UIView* btBox = nil;
    if (IOS7) {
        btBox = (isLeft?(UIBarButtonItem *)self.navigationItem.leftBarButtonItems.lastObject:(UIBarButtonItem *)self.navigationItem.rightBarButtonItems.lastObject).customView;
    } else {
        btBox = (isLeft?self.navigationItem.leftBarButtonItem:self.navigationItem.rightBarButtonItem).customView;
    }
    
    if(btBox.tag == (isLeft?topLeftButtonTag:topRightButtonTag)) {
        if(btBox.subviews.count>0)
            return [btBox.subviews objectAtIndex:0];
    }
    btBox = [[LYViewArea alloc]initWithFrame:CGRectMake(0, 0, kNavigationLeftViewWidth, kNavigationLeftViewHeight)];
    btBox.tag = isLeft?topLeftButtonTag:topRightButtonTag;
    UIButton* bt = [LYButtonArea buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(0, 0, kNavigationLeftViewWidth, kNavigationLeftViewHeight);
    bt.titleLabel.font = Font_Middle;
    [bt setTitleColor:colorFrom16RGB(0xffffff) forState:UIControlStateNormal];
    //使按钮X轴 对齐
    if (isLeft) {
        bt.left -= 15;
    } else {
        bt.left += 15;
    }
    [btBox addSubview:bt];
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:btBox];
    if(isLeft)
        self.navigationItem.leftBarButtonItem = item;
    else
        self.navigationItem.rightBarButtonItem = item;
    return bt;
}

#pragma mark ---事件
-(void)bt_top_action_back
{
    [self leftBarButtonItemTouchUpInside:nil];
}
- (void)leftBarButtonItemTouchUpInside:(id)sender
{
    [self pop:YES];
}
- (void)pop:(BOOL)animated
{
    id popVC = [self.navigationController popViewControllerAnimated:animated];
    if (!popVC)
    {
        [self dismissViewControllerAnimated:animated completion:nil];
    }
}


@end
