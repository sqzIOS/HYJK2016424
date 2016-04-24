//
//  PhotoScrollViewCtrl.h
//  HardwareExpert
//
//  Created by R-E on 12-9-10.
//  Copyright (c) 2012年 .com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GUIDE_NUM 4

#define RAIDERS_NUM 8


@class MyPageControl;

typedef enum animationStep
{
    STEP_ONE = 100,
    STEP_TWO,
    STEP_THREE,
    STEP_FOUR,
    STEP_FIVE
} ANIMAITON_STEP;

typedef enum editImgStep
{
    ESTEP_ONE = 200,
    ESTEP_TWO,
    ESTEP_THREE,
    ESTEP_FOUR
} EDITIMG_STEP;

@interface PhotoScrollViewCtrl : UIViewController<UIScrollViewDelegate>
{
    UIScrollView*   _scrollView;
    //    MyPageControl*  _pageControl;
    UIImageView*        _bgImgView;
    
    //IOS8
    UIView *_todayLeadView;
    float _todayOrigin;//today的起始位置
    UIView *_editView;//编辑的VIew
    UIButton* _overBtn;
    
    UIImageView *_firstImgView;//第一张
    UIImageView *_lastImgView;//第一张
    
    //编辑
    UIImageView *_editImgOne;
    UIImageView *_editImgTwo;
    UIImageView *_editImgThree;
    UIImageView *_myAppImg;
    UILabel     *_overLable;
    
    //手
    UIImageView *_handImgView;
    UIImageView *_clickImgView;
    
    ANIMAITON_STEP _animationStep;//进行到第几部
    EDITIMG_STEP   _editimgStep;
    
    BOOL _isTodayNow;//现在在todayView
    BOOL _haveLook;//已经看了animation
    //    BOOL _quitAnimation;//是否退出了Today动画
    
    //new
    UIView*         _guideBGView;
    float           _lastContentX;
    UIImageView*    _earthImgView;
    NSTimer*        _ballTimer;
    int             _ballShowNum;//显示第几个
    int             _lastIndex;//上一次是在哪一页停止
    BOOL            _isIOS8Later;//ios8系统或更高版本
    
    UIImageView*    _secondImgView;//第二个引导页的动画
    UIImageView*    _thirdImgView;//第三个引导页的动画
    UIImageView*    _fourthImgView;//第四个引导页的动画
    
    UIButton*       _scorllBtn;//体检
    
}

@end
