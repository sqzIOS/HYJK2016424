//
//  KKMessageCell.h
//  XmppDemo
//
//  Created by showm on 12-7-16.
//  Copyright (c) 2012年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHMessageCell : UITableViewCell


@property(nonatomic, strong) UILabel *senderAndTimeLabel;
@property(nonatomic, strong) UILabel *messageContentView;
@property(nonatomic, strong) UIImageView *bgImageView;


@end
