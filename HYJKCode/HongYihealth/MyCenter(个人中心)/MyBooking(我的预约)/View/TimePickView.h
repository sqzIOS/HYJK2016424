//
//  TimePickView.h
//  
//
//  Created by apple on 16/1/11.
//
//

#import <UIKit/UIKit.h>

@protocol TimePickViewDelegate <NSObject>

- (void)timePickViewDidChooseHour:(int)hour andMinute:(int)minute;

@end

@interface TimePickView : UIView

@property (nonatomic,weak) id<TimePickViewDelegate> delegate;
@property (nonatomic) CGFloat heightForRow;

+ (instancetype)timePickViewWithFrame:(CGRect)frame;

@end
