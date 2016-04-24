//
//  SHMIneViewController.m
//  sexduoduo
//
//  Created by 王四的mac air on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHMIneViewController.h"
#import "SHNavigationBar.h"
#import "ListItemControl.h"
#import "ViewConstructUtil.h"
#import "SHAboutUsViewController.h"
#import "SHSettingViewController.h"
#import "SHPersonalViewController.h"

#define CellHeight 44

@interface SHMIneViewController (){
    UIScrollView *_bgView;
    ListItemControl *_avatarCtl;
    UIImageView *_avatarView;
    UIImageView *_levelFlag;
    UIImageView *_coinFlag;
    UILabel *_coinLabel;
    UILabel *_nickNameLabel;
    
    UIView *_pathOneBg;
    UIView *_pathTwoBg;
    
}

@property (nonatomic, strong) SHNavigationBar *navbar;


@end

@implementation SHMIneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
    
}

- (UIColor *)backGroundColor{
    return RGBCOLOR(246, 246, 252);
}

- (SHNavigationBar *)navbar{
    if (!_navbar) {
        _navbar = [[SHNavigationBar alloc] initWithTitle:@"我" rightBtn:nil leftClick:^{

        } rightClick:^{
            
        }];
    }
    return _navbar;
}


- (void)createViews{
    self.view.backgroundColor = [self backGroundColor];
    [self.view addSubview:self.navbar];
    
    _bgView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _navbar.bottom, k_screenWidth, k_screenHeight - _navbar.height - 49)];
    _bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bgView];
    
    [self createFirstPath];
    [self createPathOne];
    [self createPathTwo];
    
}

- (void)createFirstPath{
    
    _avatarCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, 0, k_screenWidth, GTFixHeightFlaotIpad(CellHeight) * 2)
                                                 imgUrl:nil
                                                  title:nil
                                          hideAccessory:YES
                                           cellLocation:CellLocation_TopAndBottom];
    [_bgView addSubview:_avatarCtl];
    [_avatarCtl addTarget:self action:@selector(gotoPersonalView) forControlEvents:UIControlEventTouchUpInside];
    
    _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(GTFixWidthFlaotIpad(8), 0, GTFixWidthFlaotIpad(60), GTFixHeightFlaotIpad(60))];
    [_avatarView setImage:[ImageUtil createImageWithColor:GRAY_COLOR_BG]];
    _avatarView.centerY = _avatarCtl.height / 2;
    [_avatarCtl addSubview:_avatarView];
    _avatarView.userInteractionEnabled = YES;
    _avatarView.layer.masksToBounds = YES;
    _avatarView.layer.cornerRadius = _avatarView.width/2.0;

    _nickNameLabel = [ViewConstructUtil constructLabel:CGRectZero
                                                  text:nil
                                                  font:[UIFont systemFontOfSize:14]
                                             textColor:COLOR_TEXT_1];
//    _nickNameLabel.text = NICKNAME;
    _nickNameLabel.text = @"王四";
    [_nickNameLabel sizeToFit];
    _nickNameLabel.textAlignment = NSTextAlignmentLeft;
    _nickNameLabel.origin = CGPointMake(_avatarView.right + GTFixWidthFlaotIpad(12), _avatarView.top + GTFixHeightFlaotIpad(8));
    [_avatarCtl addSubview:_nickNameLabel];
    
    _levelFlag = [[UIImageView alloc] initWithFrame:CGRectMake(_nickNameLabel.right + GTFixWidthFlaotIpad(8), 0, GTFixWidthFlaotIpad(22), GTFixHeightFlaotIpad(22))];
    [_levelFlag setImage:[ImageUtil createImageWithColor:GRAY_COLOR_BG]];
    _levelFlag.centerY = _nickNameLabel.centerY;
    _levelFlag.layer.masksToBounds = YES;
    _levelFlag.layer.cornerRadius = 4.0;
    [_avatarCtl addSubview:_levelFlag];
    
    _coinFlag = [[UIImageView alloc] initWithFrame:CGRectMake(_nickNameLabel.left, 0, GTFixWidthFlaotIpad(18), GTFixHeightFlaotIpad(18))];
    [_coinFlag setImage:[ImageUtil createImageWithColor:GRAY_COLOR_BG]];
    _coinFlag.bottom = _avatarView.bottom - GTFixHeightFlaotIpad(8);
    [_avatarCtl addSubview:_coinFlag];
    
    _coinLabel = [ViewConstructUtil constructLabel:CGRectZero
                                                  text:nil
                                                  font:[UIFont systemFontOfSize:14]
                                             textColor:COLOR_TEXT_1];
    _coinLabel.text = @"100";
    [_coinLabel sizeToFit];
    _coinLabel.textAlignment = NSTextAlignmentLeft;
    _coinLabel.centerY = _coinFlag.centerY;
    _coinLabel.left = _coinFlag.right + GTFixWidthFlaotIpad(8);
    [_avatarCtl addSubview:_coinLabel];
    
    
}

- (void)createPathOne{
    _pathOneBg = [[UIView alloc] initWithFrame:CGRectMake(0, _avatarCtl.bottom + GTFixHeightFlaotIpad(8), k_screenWidth, GTFixHeightFlaotIpad(CellHeight) * 4)];
    _pathOneBg.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:_pathOneBg];
    
    ListItemControl *doctorCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, 0, k_screenWidth, GTFixHeightFlaotIpad(CellHeight))
                                                 imgUrl:@"myCenter_1"
                                                  title:@"我的医师"
                                          hideAccessory:YES
                                           cellLocation:CellLocation_Top];
    [_pathOneBg addSubview:doctorCtl];
    
    ListItemControl *historyCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, doctorCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(CellHeight))
                                                                 imgUrl:@"myCenter_1"
                                                                  title:@"提问历史"
                                                          hideAccessory:YES
                                                           cellLocation:CellLocation_Middle];
    [_pathOneBg addSubview:historyCtl];
    
    
    ListItemControl *coinCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, historyCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(CellHeight))
                                                                  imgUrl:@"myCenter_1"
                                                                   title:@"我的多币"
                                                           hideAccessory:YES
                                                            cellLocation:CellLocation_Middle];
    [_pathOneBg addSubview:coinCtl];
    
    

    ListItemControl *bbsCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, coinCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(CellHeight))
                                                               imgUrl:@"myCenter_1"
                                                                title:@"我的泡吧"
                                                        hideAccessory:YES
                                                         cellLocation:CellLocation_Bottom];
    [_pathOneBg addSubview:bbsCtl];
    
}

- (void)createPathTwo{
    _pathTwoBg = [[UIView alloc] initWithFrame:CGRectMake(0, _pathOneBg.bottom + GTFixHeightFlaotIpad(8), k_screenWidth, GTFixHeightFlaotIpad(CellHeight) * 3)];
    _pathTwoBg.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:_pathTwoBg];
    
    if (_pathTwoBg.bottom > _bgView.height) {
        [_bgView setContentSize:CGSizeMake(0, _pathTwoBg.bottom + GTFixHeightFlaotIpad(CellHeight))];

    }else{
        [_bgView setContentSize:CGSizeMake(0, _bgView.height + 1)];
    }
    
    ListItemControl *noticeCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, 0, k_screenWidth, GTFixHeightFlaotIpad(CellHeight))
                                                              imgUrl:@"myCenter_1"
                                                               title:@"系统通知"
                                                       hideAccessory:YES
                                                        cellLocation:CellLocation_Top];
    [_pathTwoBg addSubview:noticeCtl];
    
    ListItemControl *settingCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, noticeCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(CellHeight))
                                                                 imgUrl:@"myCenter_1"
                                                                  title:@"高级设置"
                                                          hideAccessory:YES
                                                           cellLocation:CellLocation_Middle];
    [settingCtl addTarget:self action:@selector(gotoSetting) forControlEvents:UIControlEventTouchUpInside];
    [_pathTwoBg addSubview:settingCtl];
    
    ListItemControl *aboutUsCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, settingCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(CellHeight))
                                                                  imgUrl:@"myCenter_1"
                                                                   title:@"关于我们"
                                                           hideAccessory:YES
                                                            cellLocation:CellLocation_Bottom];
    [aboutUsCtl addTarget:self action:@selector(gotoAboutUs) forControlEvents:UIControlEventTouchUpInside];
    [_pathTwoBg addSubview:aboutUsCtl];
    
}


#pragma mark - 个人信息修改

- (void)gotoPersonalView{
    SHPersonalViewController *personalViewController = [[SHPersonalViewController alloc] init];
    [self.navigationController pushViewController:personalViewController animated:YES];

}

- (void)gotoSetting{
    SHSettingViewController *settingViewController = [[SHSettingViewController alloc] init];
    [self.navigationController pushViewController:settingViewController animated:YES];

}
    

- (void)gotoAboutUs{
    SHAboutUsViewController *aboutUsViewController = [[SHAboutUsViewController alloc] init];
    [self.navigationController pushViewController:aboutUsViewController animated:YES];
}


@end
