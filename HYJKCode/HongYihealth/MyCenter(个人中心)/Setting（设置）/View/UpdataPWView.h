//
//  UpdataPWView.h
//  
//
//  Created by wenzhizheng on 16/1/8.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    UpdataPWViewChangePasswordTypeForget,
    UpdataPWViewChangePasswordTypeReset
} UpdataPWViewChangePasswordType;


@interface UpdataPWView : UIView


+ (instancetype)viewWithType:(UpdataPWViewChangePasswordType)type;


@property (nonatomic) UpdataPWViewChangePasswordType changePasswordType;


@end
