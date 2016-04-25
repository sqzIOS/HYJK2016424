//
//  BuyNowViewController.h
//  sexduoduo
//
//  Created by sqz on 14-11-27.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//  限时抢购

#import <UIKit/UIKit.h>
#import "UIScrollView+SVInfiniteScrolling.h"
@interface BuyNowViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    int currentPage;
}
@property (strong, nonatomic) UITableView *goodsTableView;
@property (strong, nonatomic)  UILabel *promptLab;
@property (strong, nonatomic) NSMutableArray *goodsArray;
@property (strong, nonatomic) NSString *classifyStr;

@property (strong, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIView *noNetView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;


@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImg;

@property (strong, nonatomic) UILabel *countLabel;
@property (nonatomic, retain) NSString *countDownStr;


@end