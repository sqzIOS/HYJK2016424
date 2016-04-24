//
//  SHSettingViewController.m
//  sexduoduo
//
//  Created by 王四的mac air on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHSettingViewController.h"
#import "SHNavigationBar.h"
#import "ViewConstructUtil.h"
#import "ListItemControl.h"


@interface SHSettingViewController (){
    UIScrollView *_bgView;
    
    UIView *_pathOneBg;
    UIView *_pathTwoBg;
}

@property (nonatomic, strong) SHNavigationBar *navbar;

@end

@implementation SHSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
}

- (SHNavigationBar *)navbar{
    if (!_navbar) {
        _navbar = [[SHNavigationBar alloc] initWithTitle:@"高级设置" rightBtn:nil leftClick:^{
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
    
    [self createPathOne];
    [self createPathTwo];
}

- (void)createPathOne{
    _pathOneBg = [[UIView alloc] initWithFrame:CGRectMake(0, GTFixHeightFlaotIpad(8), k_screenWidth, GTFixHeightFlaotIpad(44) * 3)];
    _pathOneBg.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:_pathOneBg];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, k_screenWidth, GTFixHeightFlaotIpad(44))];
    [_pathOneBg addSubview:titleView];
    
    UILabel *titleLabel = [ViewConstructUtil constructLabel:CGRectMake(GTFixWidthFlaotIpad(8), 0, GTFixWidthFlaotIpad(100), GTFixHeightFlaotIpad(44))
                                                       text:@"消息提醒"
                                                       font:[UIFont systemFontOfSize:14]
                                                  textColor:COLOR_TEXT_1];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleView addSubview:titleLabel];
    
    UIView *segLine = [[UIView alloc] initWithFrame:CGRectMake(0, titleView.height - 0.5, k_screenWidth, 0.5)];
    segLine.backgroundColor = RGBCOLOR(246, 246, 252);
    [titleView addSubview:segLine];
    
    ListItemControl *voiceCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, titleView.bottom , k_screenWidth, GTFixHeightFlaotIpad(44))
                                                                   imgUrl:nil
                                                                    title:@"声音提示"
                                                            hideAccessory:YES
                                                             cellLocation:CellLocation_Top];
    
    [_pathOneBg addSubview:voiceCtl];

    ListItemControl *shakeCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, voiceCtl.bottom , k_screenWidth, GTFixHeightFlaotIpad(44))
                                                                imgUrl:nil
                                                                 title:@"震动提示"
                                                         hideAccessory:YES
                                                          cellLocation:CellLocation_Bottom];
    
    [_pathOneBg addSubview:shakeCtl];


    
}

- (void)createPathTwo{
    
    _pathTwoBg = [[UIView alloc] initWithFrame:CGRectMake(0,_pathOneBg.bottom + GTFixHeightFlaotIpad(8), k_screenWidth, GTFixHeightFlaotIpad(44) * 3)];
    _pathTwoBg.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:_pathTwoBg];
    
    if (_pathTwoBg.bottom > _bgView.height) {
        [_bgView setContentSize:CGSizeMake(0, _pathTwoBg.bottom + GTFixHeightFlaotIpad(44))];
        
    }else{
        [_bgView setContentSize:CGSizeMake(0, _bgView.height + 1)];
    }

    ListItemControl *cleanCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, 0, k_screenWidth, GTFixHeightFlaotIpad(44))
                                                                imgUrl:nil
                                                                 title:@"清空缓存"
                                                         hideAccessory:NO
                                                          cellLocation:CellLocation_Top];
    
    [_pathTwoBg addSubview:cleanCtl];
    
    ListItemControl *saveCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, cleanCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(44))
                                                                imgUrl:nil
                                                                 title:@"省流量模式"
                                                         hideAccessory:YES
                                                          cellLocation:CellLocation_Middle];
    
    [_pathTwoBg addSubview:saveCtl];


    ListItemControl *secretCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, saveCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(44))
                                                                imgUrl:nil
                                                                 title:@"隐私密码"
                                                         hideAccessory:YES
                                                          cellLocation:CellLocation_Bottom];
    
    [_pathTwoBg addSubview:secretCtl];

}




@end
