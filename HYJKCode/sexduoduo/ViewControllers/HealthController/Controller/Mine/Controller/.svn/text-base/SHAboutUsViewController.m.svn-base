//
//  SHAboutUsViewController.m
//  sexduoduo
//
//  Created by 王四的mac air on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHAboutUsViewController.h"
#import "SHNavigationBar.h"
#import "ViewConstructUtil.h"
#import "ListItemControl.h"

#import "SHFeedbackViewController.h"

@interface SHAboutUsViewController (){
    UIScrollView *_bgView;

}
@property (nonatomic, strong) SHNavigationBar *navbar;

@end

@implementation SHAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GRAY_COLOR_BG;
    [self createViews];
}

- (SHNavigationBar *)navbar{
    if (!_navbar) {
        _navbar = [[SHNavigationBar alloc] initWithTitle:@"关于我们" rightBtn:nil leftClick:^{
            [self.navigationController popViewControllerAnimated:YES];
        } rightClick:^{
            
        }];
    }
    return _navbar;
}

- (void)createViews{
    [self.view addSubview:self.navbar];
    
    _bgView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _navbar.bottom, k_screenWidth, k_screenHeight - _navbar.height)];
    _bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bgView];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, GTFixHeightFlaotIpad(44), GTFixWidthFlaotIpad(68), GTFixHeightFlaotIpad(68))];
    [icon setImage:[ImageUtil createImageWithColor:[UIColor greenColor]]];
    icon.centerX = k_screenWidth / 2.0;
    icon.layer.masksToBounds = YES;
    icon.layer.cornerRadius = 4;
    [_bgView addSubview:icon];
    
    UILabel *titleLabel = [ViewConstructUtil constructLabel:CGRectZero
                                                       text:nil
                                                       font:[UIFont systemFontOfSize:10]
                                                  textColor:COLOR_TEXT_1];
    titleLabel.text = @"为人民性健康服务";
    [titleLabel sizeToFit];
    titleLabel.centerX = icon.centerX;
    titleLabel.top = icon.bottom + GTFixHeightFlaotIpad(8);
    [_bgView addSubview:titleLabel];
    
    UILabel *versionLabel = [ViewConstructUtil constructLabel:CGRectZero
                                                       text:nil
                                                       font:[UIFont systemFontOfSize:10]
                                                  textColor:[UIColor greenColor]];
    versionLabel.text = @"未知版本";
    [versionLabel sizeToFit];
    versionLabel.centerX = icon.centerX;
    versionLabel.top = titleLabel.bottom + GTFixHeightFlaotIpad(8);
    [_bgView addSubview:versionLabel];
    
    ListItemControl *feedbackCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, versionLabel.bottom + GTFixHeightFlaotIpad(44), k_screenWidth, GTFixHeightFlaotIpad(44))
                                                                  imgUrl:nil
                                                                   title:@"意见反馈"
                                                           hideAccessory:NO
                                                            cellLocation:CellLocation_TopAndBottom];
    [feedbackCtl addTarget:self action:@selector(gotoFeedBack) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:feedbackCtl];

}


- (void)gotoFeedBack{
    SHFeedbackViewController *feedbackViewController = [[SHFeedbackViewController alloc] init];
    [self.navigationController pushViewController:feedbackViewController animated:YES];
}

@end
