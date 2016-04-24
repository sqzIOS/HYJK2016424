//
//  MedicalSwitch.h
//  
//
//  Created by wenzhizheng on 15/12/31.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    switchStateLeft = 1,
    switchStateRight = 2
} switchState;


@protocol MedicalSwitchDeletage <NSObject>

- (void)medicaSwitchChangeState:(switchState)state;

@end

@interface MedicalSwitch : UIView

+ (instancetype)medicalSwitch;

@property (nonatomic,weak) id<MedicalSwitchDeletage> delegete;
@end
