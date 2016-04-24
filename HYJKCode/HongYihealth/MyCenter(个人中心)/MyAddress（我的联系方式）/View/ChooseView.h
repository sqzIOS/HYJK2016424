//
//  ChooseView.h
//  
//
//  Created by apple on 16/1/25.
//
//

#import <UIKit/UIKit.h>

@protocol ChooseViewDelegate <NSObject>

- (void)chooseViewDidSelected:(NSInteger)index;

@end

@interface ChooseView : UIView


@property (nonatomic,weak) id<ChooseViewDelegate> delegate;

+ (instancetype)chooseViewWithTitleArry:(NSArray *)titleArry andChosseTitle:(NSString *)choosetitle andTitle:(NSString *)title;

- (void)showInView:(UIView *)view;
- (void)dismiss;

@end
