//
//  SHPersonalViewController.m
//  sexduoduo
//
//  Created by 王四的mac air on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHPersonalViewController.h"
#import "SHNavigationBar.h"
#import "ViewConstructUtil.h"
#import "ListItemControl.h"

#import "SHModifiePerSonalViewController.h"
#import "SHModifiePsdViewController.h"

@interface SHPersonalViewController (){
    UIScrollView *_bgView;
    UIImageView *_avatarView;
    UIView *_pathOneBg;
    UIView *_pathTwoBg;

}
@property (nonatomic, strong) SHNavigationBar *navbar;

@end

@implementation SHPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
}

- (SHNavigationBar *)navbar{
    if (!_navbar) {
        _navbar = [[SHNavigationBar alloc] initWithTitle:@"个人资料" rightBtn:nil leftClick:^{
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
    [self createQuitBtn];
}

- (void)createPathOne{
    _pathOneBg = [[UIView alloc] initWithFrame:CGRectMake(0, GTFixHeightFlaotIpad(8), k_screenWidth, GTFixHeightFlaotIpad(44) * 5)];
    _pathOneBg.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:_pathOneBg];
    
    ListItemControl *avatarCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, 0, k_screenWidth, GTFixHeightFlaotIpad(88))
                                                                imgUrl:nil
                                                                 title:@"头像"
                                                         hideAccessory:NO
                                                          cellLocation:CellLocation_Top];
    [avatarCtl addTarget:self action:@selector(changeAvatar) forControlEvents:UIControlEventTouchUpInside];
    
    [_pathOneBg addSubview:avatarCtl];
    
    _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(k_screenWidth - GTFixWidthFlaotIpad(60) - GTFixWidthFlaotIpad(24), 0, GTFixWidthFlaotIpad(60), GTFixHeightFlaotIpad(60))];
    [_avatarView setImage:[ImageUtil createImageWithColor:GRAY_COLOR_BG]];
    _avatarView.centerY = avatarCtl.height / 2;
    [avatarCtl addSubview:_avatarView];
    _avatarView.userInteractionEnabled = YES;
    _avatarView.layer.masksToBounds = YES;
    _avatarView.layer.cornerRadius = _avatarView.width/2.0;

    
    ListItemControl *nickNameCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, avatarCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(44))
                                                                 imgUrl:nil
                                                                  title:@"昵称"
                                                          hideAccessory:YES
                                                           cellLocation:CellLocation_Middle];
    
    [_pathOneBg addSubview:nickNameCtl];
    UILabel *nickNameLabel = [ViewConstructUtil constructLabel:CGRectZero
                                                  text:nil
                                                  font:[UIFont systemFontOfSize:14]
                                             textColor:COLOR_TEXT_1];
    //    _nickNameLabel.text = NICKNAME;
    nickNameLabel.text = @"王四";
    [nickNameLabel sizeToFit];
    nickNameLabel.textAlignment = NSTextAlignmentRight;
    [nickNameCtl addSubview:nickNameLabel];
    [UIView setSubviewCenterOnVertical:nickNameLabel
                                   AtX:k_screenWidth - nickNameLabel.width - GTFixWidthFlaotIpad(8)
                             superView:nickNameCtl];


    ListItemControl *levelCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, nickNameCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(44))
                                                                   imgUrl:nil
                                                                    title:@"等级"
                                                            hideAccessory:YES
                                                             cellLocation:CellLocation_Middle];
    
    [_pathOneBg addSubview:levelCtl];
    
    UILabel *levelLabel = [ViewConstructUtil constructLabel:CGRectZero
                                                          text:nil
                                                          font:[UIFont systemFontOfSize:14]
                                                     textColor:COLOR_TEXT_1];
    //    _nickNameLabel.text = NICKNAME;
    levelLabel.text = @"超级会员";
    [levelLabel sizeToFit];
    levelLabel.textAlignment = NSTextAlignmentRight;
    [levelCtl addSubview:levelLabel];
    [UIView setSubviewCenterOnVertical:levelLabel
                                   AtX:k_screenWidth - levelLabel.width - GTFixWidthFlaotIpad(8)
                             superView:levelCtl];

    
    ListItemControl *sexCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, levelCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(44))
                                                                imgUrl:nil
                                                                 title:@"性别"
                                                         hideAccessory:YES
                                                          cellLocation:CellLocation_Bottom];
    
    [_pathOneBg addSubview:sexCtl];
    
    UILabel *sexLabel = [ViewConstructUtil constructLabel:CGRectZero
                                                       text:nil
                                                       font:[UIFont systemFontOfSize:14]
                                                  textColor:COLOR_TEXT_1];
    //    _nickNameLabel.text = NICKNAME;
    sexLabel.text = @"男";
    [sexLabel sizeToFit];
    sexLabel.textAlignment = NSTextAlignmentRight;
    [sexCtl addSubview:sexLabel];
    [UIView setSubviewCenterOnVertical:sexLabel
                                   AtX:k_screenWidth - sexLabel.width - GTFixWidthFlaotIpad(8)
                             superView:sexCtl];
    

}

- (void)createPathTwo{
    
    _pathTwoBg = [[UIView alloc] initWithFrame:CGRectMake(0,_pathOneBg.bottom + GTFixHeightFlaotIpad(8), k_screenWidth, GTFixHeightFlaotIpad(44) * 2)];
    _pathTwoBg.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:_pathTwoBg];
    
    ListItemControl *passWordCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, 0, k_screenWidth, GTFixHeightFlaotIpad(44))
                                                              imgUrl:nil
                                                               title:@"修改密码"
                                                       hideAccessory:NO
                                                        cellLocation:CellLocation_Top];
    [passWordCtl addTarget:self action:@selector(gotoModifiePassWord) forControlEvents:UIControlEventTouchUpInside];
    [_pathTwoBg addSubview:passWordCtl];

    ListItemControl *personalCtl = [[ListItemControl alloc] initWithFrame:CGRectMake(0, passWordCtl.bottom, k_screenWidth, GTFixHeightFlaotIpad(44))
                                                                   imgUrl:nil
                                                                    title:@"编辑个人信息"
                                                            hideAccessory:NO
                                                             cellLocation:CellLocation_Bottom];
    [personalCtl addTarget:self action:@selector(gotoModifiePerSonal) forControlEvents:UIControlEventTouchUpInside];
    [_pathTwoBg addSubview:personalCtl];

}

- (void)createQuitBtn{
    UIButton *quitBtn = [[UIButton alloc] initWithFrame:CGRectMake(GTFixWidthFlaotIpad(40), _pathTwoBg.bottom + GTFixHeightFlaotIpad(24), GTFixWidthFlaotIpad(240), GTFixHeightFlaotIpad(44))];
    [quitBtn setBackgroundColor:[UIColor greenColor]];
    quitBtn.layer.masksToBounds = YES;
    quitBtn.layer.cornerRadius = 4.0f;
    [quitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [quitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [quitBtn setTitleColor:RGBACOLOR(255, 255, 255, 0.48) forState:UIControlStateHighlighted];
    quitBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [quitBtn addTarget:self action:@selector(quit) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:quitBtn];

}

#pragma mark - mothed

- (void)changeAvatar{
    NSLog(@"修改头像");
}

- (void)quit{
    
}

- (void)gotoModifiePassWord{
    SHModifiePsdViewController *modifiePsdViewController = [[SHModifiePsdViewController alloc] init];
    [self.navigationController pushViewController:modifiePsdViewController animated:YES];

}

- (void)gotoModifiePerSonal{
    SHModifiePerSonalViewController *modifiePerSonalViewController = [[SHModifiePerSonalViewController alloc] init];
    [self.navigationController pushViewController:modifiePerSonalViewController animated:YES];

    
}


@end
