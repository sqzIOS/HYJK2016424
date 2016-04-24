//
//  NoNetworkView.h
//  sexduoduo
//
//  Created by dsz on 15-4-14.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef void (^NoNetworkViewBlock)(id noNetworkObject);



@protocol NoNetworkViewProtocol;
@interface NoNetworkView : UIView

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (strong, nonatomic) IBOutlet UIView *noNetView;

@property (assign, nonatomic)id<NoNetworkViewProtocol>delegate;
@end



@protocol NoNetworkViewProtocol <NSObject>

-(void)noNetworkViewRefreshBtnClick;

@end

