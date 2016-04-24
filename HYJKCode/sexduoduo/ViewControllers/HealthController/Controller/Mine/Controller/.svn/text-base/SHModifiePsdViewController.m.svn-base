//
//  SHModifiePsdViewController.m
//  sexduoduo
//
//  Created by 王四的mac air on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHModifiePsdViewController.h"
#import "SHNavigationBar.h"
#import "ViewConstructUtil.h"
#import "ListItemControl.h"


@interface SHModifiePsdViewController (){
    UIScrollView *_bgView;
    UIView *_pathOneBg;
    UIView *_pathTwoBg;
}
@property (nonatomic, strong) SHNavigationBar *navbar;

@end

@implementation SHModifiePsdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
}

- (SHNavigationBar *)navbar{
    if (!_navbar) {
        _navbar = [[SHNavigationBar alloc] initWithTitle:@"修改密码" rightBtn:nil leftClick:^{
            [self.navigationController popViewControllerAnimated:YES];
        } rightClick:^{
            
        }];
    }
    return _navbar;
}


- (void)createViews{
    self.view.backgroundColor = GRAY_COLOR_BG;
    [self.view addSubview:self.navbar];
    _bgView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _navbar.bottom, k_screenWidth, k_screenHeight - _navbar.height)];
    _bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bgView];
}

@end
