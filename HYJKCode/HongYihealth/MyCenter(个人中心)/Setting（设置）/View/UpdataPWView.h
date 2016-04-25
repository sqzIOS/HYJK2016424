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

@protocol UpdataPWViewDelegate <NSObject>

- (void)updataPWViewUpdataSucceed;

@end

@interface UpdataPWView : UIView


+ (instancetype)viewWithType:(UpdataPWViewChangePasswordType)type;


@property (nonatomic) UpdataPWViewChangePasswordType changePasswordType;
@property (nonatomic,weak) id<UpdataPWViewDelegate> delegate;



@end
