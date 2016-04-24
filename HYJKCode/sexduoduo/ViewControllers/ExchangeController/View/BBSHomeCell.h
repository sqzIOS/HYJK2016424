//
//  BBSHomeCell.h
//  sexduoduo
//
//  Created by dsz on 15-1-22.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExchangeTwoViewController.h"

@protocol BBSHomeCellDelegate

-(void)addBtnClickWithIndexRow:(NSInteger )indexRow;

@optional
-(void)minBtnClickWithIndexRow:(NSInteger )indexRow;

@end
@interface BBSHomeCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *headImageView;
@property (strong, nonatomic) IBOutlet UIButton *addBtn;

@property (strong, nonatomic) IBOutlet UIButton *minBtn;


@property (assign, nonatomic) id<BBSHomeCellDelegate> delegate;
@property (assign, nonatomic)NSInteger indexRow;



-(void)configCellWithArray:(NSArray *)array indexRow:(int)row;
@end
