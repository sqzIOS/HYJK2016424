//
//  DeseaseView.h
//  
//
//  Created by wenzhizheng on 16/1/10.
//
//

#import <UIKit/UIKit.h>
#import "Desease.h"

@class DeseaseView;

@protocol  DeseaseViewdelegate <NSObject>

- (void)deseaseViewDidChoose:(DeseaseView *)deseaseView;

@end

@interface DeseaseView : UIView

@property (nonatomic,weak) id<DeseaseViewdelegate> delegate;
@property (nonatomic,strong) Desease *desease;



@end
