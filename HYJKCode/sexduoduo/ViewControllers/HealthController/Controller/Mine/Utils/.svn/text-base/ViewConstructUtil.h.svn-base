//
//  ViewConstructUtil.h
//  TaQu
//
//  Created by haibaoIos on 15/2/9.
//  Copyright (c) 2015年 厦门海豹信息技术. All rights reserved.
//

#import "HBButton.h"
#import "HBImageView.h"

@interface ViewConstructUtil : NSObject
/*
 * 创建基本Label，并且是居中
 */
+ (UILabel *)constructLabel:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)color;

/*
 * 创建Label，大小自适应
 */
+ (UILabel *)constructLabelSizeToFitWithText:(NSString *)text
                                        font:(UIFont *)font
                                   textColor:(UIColor *)color;


/*
 * 基本创建HBButton
 */
+ (HBButton *)constructHBButton:(CGRect)frame
                         target:(id)target
                         action:(SEL)action
                       userInfo:(id)userInfo;

/*
 * 基本创建UIButton
 */
+ (UIButton *)constructButton:(CGRect)frame
                       target:(id)target
                       action:(SEL)action;


/*
 * 创建基本HBButton,基于背景图片的
 */
+ (HBButton *)constructHBButton:(CGRect)frame
                        nlBgImg:(UIImage *)nlBgImg
                        hlBgImg:(UIImage *)hlBgImg
                        slBgImg:(UIImage *)slBgImg
                         target:(id)target
                         action:(SEL)action
                       userInfo:(id)userInfo;

/*
 * 创建基本HBButton,基于背景图片的
 */
+ (HBButton *)constructHBButton:(CGRect)frame
                        hlColor:(UIColor *)hlColor
                        slColor:(UIColor *)slColor
                         target:(id)target
                         action:(SEL)action
                       userInfo:(id)userInfo;

/*
 * 创建基本的UIButton,基于背景图片的
 */
+ (UIButton *)constructButton:(CGRect)frame
                      nlBgImg:(UIImage *)nlBgImg
                      hlBgImg:(UIImage *)hlBgImg
                      slBgImg:(UIImage *)slBgImg
                       target:(id)target
                       action:(SEL)action;

/*
 * 创建基本的UIButton,基于背景图片的
 */
+ (UIButton *)constructAutoLayoutButtonForNlBgImg:(UIImage *)nlBgImg
                                          hlBgImg:(UIImage *)hlBgImg
                                          slBgImg:(UIImage *)slBgImg
                                           target:(id)target
                                           action:(SEL)action;

/*
 * 基本创建UIImageView,基于图片的名字的
 */
+ (UIImageView *)constructImageView:(CGRect)frame
                            imgName:(NSString *)imgName;

/*
 * 基本创建UIImageView
 */
+ (UIImageView *)constructImageView:(CGRect)frame;

+ (UIImageView *)constructHBImgView:(NSString *)imgName;


+ (UIImageView *)constructHBImgViewIpad:(NSString *)imgName;

/*
 * 基本创建HBImageView,基于图片的名字的
 */
+ (HBImageView *)constructHBImageView:(CGRect)frame
                              imgName:(NSString *)imgName
                             userInfo:(id)userInfo;

/*
 * 创建基本UITextField,基于delegate的
 */
+ (UITextField *)constructTextField:(id <UITextFieldDelegate>)delegate;

/*
 * 创建基本constructTextView,基于delegate的
 */
+ (UITextView *)constructTextView:(id <UITextViewDelegate>)delegate;

/*
 * 创建基本UIScrollView,基于frame的
 */
+ (UIScrollView *)constructScrollView:(CGRect)frame;



/*
 * view子类的复制方法
 */
+ (id)deepViewCopy:(id)view;

@end