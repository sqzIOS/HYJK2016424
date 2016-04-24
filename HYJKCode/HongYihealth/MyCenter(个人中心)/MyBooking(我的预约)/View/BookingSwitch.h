//
//  MyBookingSwitch.h
//  
//
//  Created by wenzhizheng on 16/1/3.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    bookingSwitchValueLeft = 0,
    bookingSwitchValueRight = 1
}bookingSwitchValue;

@protocol BookingSwitchDelegate <NSObject>

- (void)bookingSwitchVlaueChange:(bookingSwitchValue)value;

@end

@interface BookingSwitch : UIView


@property (nonatomic,weak) id<BookingSwitchDelegate> delegate;

+ (instancetype)bookingSwitchWithFrame:(CGRect)frame andLeftStr:(NSString *)leftStr andRightStr:(NSString *)rightStr;

@end
