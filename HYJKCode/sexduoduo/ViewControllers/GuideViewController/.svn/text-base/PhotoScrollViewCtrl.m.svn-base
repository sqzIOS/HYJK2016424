//
//  PhotoScrollViewCtrl.m
//  HardwareExpert
//
//  Created by R-E on 12-9-10.
//  Copyright (c) 2012年 talk007.com. All rights reserved.
//

#import "PhotoScrollViewCtrl.h"
//#import "MyPageControl.h"

#define BACKGROUND_DX   (-15)

//#define BACKCOLOR UIColorFromRGB(0xececec)

#define BACKCOLOR mybackcolor

#define degreesToRadians(x) (M_PI*(x)/180.0)

UIColor *mybackcolor;
@interface PhotoScrollViewCtrl ()
{
    UIButton* _btn;
}
@end

@implementation PhotoScrollViewCtrl


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mybackcolor=UICOLOR_RGB_A(31, 103, 208, 1);

    
    UIView* v = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];//CGRectOffset([[UIScreen mainScreen] bounds], 0, -20)
    v.backgroundColor =UICOLOR_RGB(255,116,116);//RGBCOLOR(0xec, 0xec, 0xec);
    v.clipsToBounds = YES;
    self.view = v;
    
    _haveLook = NO;
    _lastIndex = 0;
    _isIOS8Later = YES;
    //    _isIOS8Later = NO;
    
    [self createMainBody];
    
    //创建today引导图
    //    if (_isIOS8Later)
    //    {
    //        _todayOrigin = GUIDE_NUM*320;
    //        [self createTodayLeadView];
    //    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)loadView
{
   
    
    
    
}

-(void)createMainBody
{
    float screenH = [UIScreen mainScreen].bounds.size.height;
    
    
    
    //地球
    _earthImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 970, 970)];
    _earthImgView.image = UIImageByName(@"新手引导图/earth.png");
    _earthImgView.userInteractionEnabled = YES;
    if(IS_IPHONE_5)
    {
        _earthImgView.center = CGPointMake(320/2, screenH + 230);
    }
    else
    {
        _earthImgView.center = CGPointMake(320/2, screenH + 230 + 15);
    }
    
   [self.view addSubview:_earthImgView];
    
    
    //超过范围的大view
    _guideBGView = [[UIView alloc]initWithFrame:CGRectMake(-320, 0, 320*3, screenH*2 + 320)];
    _guideBGView.backgroundColor = CLEAR_COLOR;
    [self.view addSubview:_guideBGView];
    

    
    
    for (int i = 1; i < 5; i ++)
    {
        
        UIView *guideBGView2 = [[UIView alloc]initWithFrame:CGRectMake(320, 0, 320, _guideBGView.frame.size.height)];
        guideBGView2.backgroundColor = [UIColor clearColor];
        [_guideBGView addSubview:guideBGView2];
         /*
        if (i == 2)
        {
            //赞的按钮
            _secondImgView = [[UIImageView alloc]initWithFrame:CGRectMake(160, 0, 104/2, 118/2)];
            _secondImgView.center = CGPointMake(317/2 + 5, 694/2);
            _secondImgView.hidden = YES;
            _secondImgView.image = UIImageByName(@"新手引导图/good.png");
            [guideBGView2 addSubview:_secondImgView];
            
        }
        else if (i == 3)
        {
            
            UIView *thirdBGView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 40)];
            if (SCREEN_HEIGHT > 480)
            {
                thirdBGView.center = CGPointMake(324/2, 530/2 - 15);
            }
            else
            {
                thirdBGView.center = CGPointMake(324/2, 530/2 - 15 - 90 + 15);
            }
            thirdBGView.clipsToBounds = YES;
            thirdBGView.backgroundColor = [UIColor grayColor];
            [guideBGView2 addSubview:thirdBGView];
            
            _thirdImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0,40, 30, 40)];
            _thirdImgView.backgroundColor = UIColorFromRGB(0x99Fe72);
            
            [thirdBGView addSubview:_thirdImgView];
        }
        else if (i == 4)
        {
            _fourthImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 104/2, 118/2)];
            _fourthImgView.center = CGPointMake(317/2 + 5, 694/2);
            _fourthImgView.hidden = YES;
            _fourthImgView.image = UIImageByName(@"新手引导图/raiders.png");
            [guideBGView2 addSubview:_fourthImgView];
            
            int minH = 0;
            if(IS_IPHONE_5)
            {
                minH = 0;
            }
            else
            {
                
                minH = 80 - 15;
            }
            
            for (int j = 1; j <= RAIDERS_NUM; j++)
            {
                UIImageView *raidersImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
                NSString *str = [NSString stringWithFormat:@"新手引导图/raiders%d.png", j];
                raidersImgView.image = UIImageByName(str);
                
                switch (j)
                {
                    case 1:
                        raidersImgView.center = CGPointMake(212/2, 578/2 - minH);
                        raidersImgView.tag = 50 + 1;
                        break;
                    case 2:
                        raidersImgView.center = CGPointMake(440/2, 555/2 - minH);
                        raidersImgView.tag = 50 + 6;
                        break;
                    case 3:
                        raidersImgView.center = CGPointMake(108/2, 665/2 - minH);
                        raidersImgView.tag = 50 + 3;
                        break;
                    case 4:
                        raidersImgView.center = CGPointMake(462/2, 652/2 - minH);
                        raidersImgView.tag = 50 + 8;
                        break;
                    case 5:
                        raidersImgView.center = CGPointMake(179/2, 771/2 - minH);
                        raidersImgView.tag = 50 + 5;
                        break;
                    case 6:
                        raidersImgView.center = CGPointMake(537/2, 707/2 - minH);
                        raidersImgView.tag = 50 + 4;
                        break;
                    case 7:
                        raidersImgView.center = CGPointMake(176/2, 855/2 - minH);
                        raidersImgView.tag = 50 + 7;
                        break;
                    case 8:
                        raidersImgView.center = CGPointMake(493/2, 882/2 - minH);
                        raidersImgView.tag = 50 + 2;
                        break;
                        
                    default:
                        break;
                }
                raidersImgView.hidden = YES;
                [guideBGView2 addSubview:raidersImgView];
            }
            
        }
        
        
        */
        
        UIImageView *guideImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, screenH)];
        NSString* str;
        if(IS_IPHONE_5)
        {
            str = [NSString stringWithFormat:@"新手引导图/iphone5/引导 %d.png", i];
        }
        else
        {
            str = [NSString stringWithFormat:@"新手引导图/引导%d.png", i];
        }
        guideImg.image = UIImageByName(str);
        guideImg.backgroundColor=CLEAR_COLOR;
        
        
        
        guideImg.tag = 100 + i;
        [guideBGView2 addSubview:guideImg];
        
        guideBGView2.transform = CGAffineTransformRotate(guideBGView2.transform, degreesToRadians(90*(i-1)));
        
        
        
    }
    
    
    
//    UIView *overBtnBGView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _earthImgView.frame.size.width, _earthImgView.frame.size.height)];
//    overBtnBGView.backgroundColor = [UIColor clearColor];
//    overBtnBGView.userInteractionEnabled=YES;
//    [_earthImgView addSubview:overBtnBGView];
//    
//    _overBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    _overBtn.frame = CGRectMake(0, 0, 120, 39);
//    _overBtn.center = CGPointMake(_earthImgView.frame.size.width/2,50);
//    _overBtn.backgroundColor = UICOLOR_RGB_A(255, 0, 0, 0.6);
//    
//    _overBtn.layer.cornerRadius = 3;
//    _overBtn.hidden = YES;
//    _overBtn.layer.masksToBounds = YES;
//    [_overBtn setTitle:@"立即体验" forState:UIControlStateNormal];
//    [_overBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_overBtn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
//    [overBtnBGView addSubview:_overBtn];
//     overBtnBGView.transform = CGAffineTransformRotate(_earthImgView.transform, degreesToRadians(90*3));
   
    
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectOffset([[UIScreen mainScreen] bounds], 0, 0)];
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.scrollEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.delegate = self;

    _scrollView.contentSize = CGSizeMake(GUIDE_NUM*320, _scrollView.frame.size.height);
    _scorllBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _scorllBtn.frame = CGRectMake(3*320 + 100, SCREEN_HEIGHT - 90, 120, 39);
    _scorllBtn.backgroundColor =  UICOLOR_RGB_A(255, 0, 0, 0.8);
    [_scorllBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    _scorllBtn.layer.cornerRadius = 3;
    _scorllBtn.alpha = 0;
    _scorllBtn.layer.masksToBounds = YES;
    
    _scorllBtn.hidden = YES;
    [_scorllBtn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_scorllBtn];
    

    [self.view addSubview:_scrollView];
    
    
}

#pragma mark - 第二张引导页和第四张引导页的弹出动画
-(void)startUpAnimation:(UIImageView *)imgView
{
    NSLog(@"开始冒出的动画");
    
    imgView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    imgView.hidden = NO;
    if (SCREEN_HEIGHT > 480)
    {
        if (imgView == _fourthImgView)
        {
            imgView.center = CGPointMake(imgView.center.x, 694/2);
        }
        else if(imgView == _secondImgView)
        {
            imgView.center = CGPointMake(imgView.center.x, 376/2 + 100);
        }
        
    }
    else
    {
        if (imgView == _fourthImgView)
        {
            imgView.center = CGPointMake(imgView.center.x, 694/2 - 83 + 15);
        }
        else if(imgView == _secondImgView)
        {
            imgView.center = CGPointMake(imgView.center.x, 376/2 + 100 - 75 + 15);
        }
    }
    
    
    
    [UIView animateWithDuration:0.4 animations:^{
        imgView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        imgView.center = CGPointMake(imgView.center.x, imgView.center.y - 100); //位置移动边放大
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            imgView.center = CGPointMake(imgView.center.x, imgView.center.y + 15);//位置下移15像素
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                imgView.center = CGPointMake(imgView.center.x, imgView.center.y - 5);//位置上移5像素
            } completion:^(BOOL finished) {
                if (imgView == _fourthImgView)
                {
                    [self startBallAnimation];//如果是 第四个 散开的动画开始执行
                }
                
                
                //                [PublicMethod heartbeatView:imgView duration:3];
            }];
        }];
    }];
    
}

#pragma mark - 第三张引导页的填满动画
-(void)startFillInAnimation
{
    _thirdImgView.frame = CGRectMake(0, 40, _thirdImgView.frame.size.width, _thirdImgView.frame.size.height);
    [UIView animateWithDuration:0.6 animations:^{
        _thirdImgView.frame = CGRectMake(0, 0, _thirdImgView.frame.size.width, _thirdImgView.frame.size.height);
    } completion:^(BOOL finished) {
        _thirdImgView.frame = CGRectMake(0, 40, _thirdImgView.frame.size.width, _thirdImgView.frame.size.height);
        [UIView animateWithDuration:0.6 animations:^{
            _thirdImgView.frame = CGRectMake(0, 0, _thirdImgView.frame.size.width, _thirdImgView.frame.size.height);
        }];
    }];
}


#pragma mark - 第四张引导页的散开动画
-(void)startBallAnimation
{
    NSLog(@"开始弹动画");
    for (int i = 1; i <= RAIDERS_NUM; i ++)
    {
        UIImageView *raidersImgView = (UIImageView *)[self.view viewWithTag:50 + i];
        raidersImgView.hidden = YES;
    }
    _ballShowNum = 0;
    [self ballSEL];
    _ballTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(ballSEL) userInfo:nil repeats:YES];
}

-(void)ballSEL
{
    _ballShowNum ++;
    UIImageView *raidersImgView = (UIImageView *)[self.view viewWithTag:50 + _ballShowNum];
    [self showNow:raidersImgView];
    if (_ballShowNum == 8)
    {
        [_ballTimer invalidate];
        _ballTimer = nil;
        
        
        [self performSelector:@selector(showOverBtn) withObject:nil afterDelay:0.2];
        
        
    }
}

-(void)showOverBtn
{
    _overBtn.hidden = NO;
    _scorllBtn.hidden = NO;
    _overBtn.alpha = 0;
    _scorllBtn.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        _overBtn.alpha = 1;
        
        _scorllBtn.alpha = 1;
    }];
}

-(void)showNow:(UIImageView *)imgView
{
    CGPoint willCenter = imgView.center;
    
    imgView.hidden = NO;
    if (SCREEN_HEIGHT > 480)
    {
        imgView.center = CGPointMake(315/2, 745/2);
    }
    else
    {
        imgView.center = CGPointMake(315/2, 745/2 - 80);
    }
    imgView.transform = CGAffineTransformMakeScale(0.2f, 0.2f);
    [UIView beginAnimations:@"OpenViewShow" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.2f];
    imgView.center = willCenter;
    imgView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    //    imgView.alpha = 1.0f;
    [UIView commitAnimations];
}


-(void)createTodayLeadView
{
    //创建通知栏的引导图
    int relativeY = 10;
    if(SCREEN_HEIGHT > 480)
    {
        relativeY = 60 -  20;
    }
    
    _todayLeadView = [[UIView alloc]initWithFrame:CGRectMake(_todayOrigin, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    _todayLeadView.backgroundColor = BACKCOLOR;
    [_scrollView addSubview:_todayLeadView];
    
    UILabel *lable = [self createLableFrame:CGRectMake(0, relativeY, 320, 31)
                                    andFont:30
                                   andColor:[UIColor whiteColor]
                         andNSTextAlignment:NSTextAlignmentCenter
                                    andText:@"实时关注"];
    lable.font = [UIFont boldSystemFontOfSize:30];
    [_todayLeadView addSubview:lable];
    relativeY += lable.frame.size.height + 5;
    
    UILabel *lable2 = [self createLableFrame:CGRectMake(0, relativeY, 320, 16)
                                     andFont:15
                                    andColor:[UIColor whiteColor]
                          andNSTextAlignment:NSTextAlignmentCenter
                                     andText:@"专为ios8设计的通知中心"];
    [_todayLeadView addSubview:lable2];
    relativeY += lable2.frame.size.height + 20;
    
    UIImageView *todayImgView = [self createImgViewFrame:CGRectMake((640 - 372)/4, relativeY, 372/2, 760/2)
                                                  andImg:UIImageByName(@"新手引导图/picture_iphone.png")
                                            andSuperview:_todayLeadView];
    
    UIView *allBGView = [[UIView alloc]initWithFrame:CGRectMake(12, 47, 324/2, 574/2)];
    allBGView.backgroundColor = [UIColor clearColor];
    allBGView.clipsToBounds = YES;
    [todayImgView addSubview:allBGView];
    
    _firstImgView = [self createImgViewFrame:CGRectMake(0,0, 324/2, 574/2)
                                      andImg:UIImageByName(@"新手引导图/picture_1.png")
                                andSuperview:allBGView];
    _lastImgView = [self createImgViewFrame:CGRectMake(0,100, 324/2, 166/2)
                                     andImg:UIImageByName(@"新手引导图/picture_2.png")
                               andSuperview:allBGView];
    _lastImgView.hidden = YES;
    
    _editView = [[UIView alloc]initWithFrame:CGRectMake(0,574/2, 324/2, 574/2)];
    _editView.backgroundColor = [UIColor clearColor];
    [allBGView addSubview:_editView];
    
    //创建手
    _handImgView = [self createImgViewFrame:CGRectMake(0, 0, 60, 70)
                                     andImg:UIImageByName(@"新手引导图/hand.png")
                               andSuperview:allBGView];
    _handImgView.hidden = YES;
    _clickImgView = [self createImgViewFrame:CGRectMake(0, 0, 60, 70)
                                      andImg:UIImageByName(@"新手引导图/hand_p.png")
                                andSuperview:_handImgView];
    _clickImgView.hidden = YES;
    
    [self createEditView];
    
    _overBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (SCREEN_HEIGHT > 480)
    {
        _overBtn.frame = CGRectMake(100, SCREEN_HEIGHT - 50, 120, 39);
    }
    else
    {
        _overBtn.frame = CGRectMake(100, SCREEN_HEIGHT - 120, 120, 39);
    }
    _overBtn.backgroundColor = UICOLOR_RGB_A(255, 0, 0, 0.6);
    //    _overBtn.backgroundColor = RGBCOLOR(0x25, 0x7e, 0xda);
    _overBtn.layer.cornerRadius = 3;
    _overBtn.alpha = 0;
    _overBtn.layer.masksToBounds = YES;
    [_overBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [_overBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_overBtn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [_todayLeadView addSubview:_overBtn];
    
}

#pragma mark- 还原所有动画的位置
-(void)restoreAllView
{
    
    NSLog(@"恢复");
    //    for(UIView *view in [_todayLeadView subviews])
    //    {
    //        [view removeFromSuperview];
    //    }
    //    [self createTodayLeadView];
    
    _firstImgView.hidden = NO;
    _lastImgView.hidden = YES;
    _handImgView.frame = CGRectMake(0, 0, 60, 70);
    _handImgView.hidden = YES;
    _clickImgView.hidden = YES;
    _editView.frame = CGRectMake(0,574/2, 324/2, 574/2);
    int relative = 46;
    _editImgOne.frame = CGRectMake(0, relative, 324/2, 46/2);
    relative += _editImgOne.frame.size.height;
    _editImgTwo.frame = CGRectMake(0, relative, 324/2, 46/2);
    relative += _editImgOne.frame.size.height;
    _editImgThree.frame = CGRectMake(0, relative, 324/2, 46/2);
    relative += _editImgOne.frame.size.height + 70;
    _myAppImg.frame = CGRectMake(0, relative, 324/2, 46/2);
    _myAppImg.image = UIImageByName(@"新手引导图/entry_2.png");
    
    _overBtn.hidden = YES;
    _overBtn.alpha = 0;
    _scrollView.userInteractionEnabled = YES;
    
    
}

#pragma mark - 最后一张IOS8通知栏动画
-(void)startAnimation
{
    
    [self restoreAllView];
    //    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(startAnimation) object:nil];
    //    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(performSelectorAction) object:nil];
    //    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(moveEditImg) object:nil];
    [self startAnimationNow];
    
}

-(void)startAnimationNow
{
    //     [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(startAnimationNow) object:nil];
    _scrollView.userInteractionEnabled = NO;
    
    _handImgView.hidden = NO;
    _handImgView.frame = CGRectMake(324/2, 140, _handImgView.frame.size.width, _handImgView.frame.size.height);
    
    [UIView animateWithDuration:1 animations:^{
        _handImgView.frame = CGRectMake(324/4 - 15, 95, _handImgView.frame.size.width, _handImgView.frame.size.height);
    } completion:^(BOOL finished) {
        _clickImgView.hidden = NO;
        _animationStep = STEP_ONE;
        [self performSelector:@selector(performSelectorAction) withObject:nil afterDelay:0.3];
    }];
}

-(void)performSelectorAction
{
    
    switch (_animationStep)
    {
        case STEP_ONE:
        {
            _clickImgView.hidden = YES;
            _editView.frame = CGRectMake(0,574/2, 324/2, 574/2);
            [UIView animateWithDuration:1 animations:^{
                _handImgView.frame = CGRectMake(324/2, 140, _handImgView.frame.size.width, _handImgView.frame.size.height);
                _editView.frame = CGRectMake(0,0, 324/2, 574/2);
            } completion:^(BOOL finished) {
                _firstImgView.hidden = YES;
                _lastImgView.hidden = NO;
                [UIView animateWithDuration:1 animations:^{
                    _handImgView.frame = [self getHandImgFrameWith:_myAppImg.frame andOrightX:5];
                } completion:^(BOOL finished) {
                    _clickImgView.hidden = NO;
                    _animationStep = STEP_TWO;
                    [self performSelector:@selector(performSelectorAction) withObject:nil afterDelay:0.3];
                }];
            }];
        }
            break;
        case STEP_TWO:
        {
            _clickImgView.hidden = YES;
            _myAppImg.frame = CGRectMake(_myAppImg.frame.origin.x, _editImgThree.frame.size.height + _editImgThree.frame.origin.y, _myAppImg.frame.size.width, _myAppImg.frame.size.height);
            _myAppImg.image = UIImageByName(@"新手引导图/entry_3.png");
            [UIView animateWithDuration:1 animations:^{
                _handImgView.frame = [self getHandImgFrameWith:_myAppImg.frame andOrightX:_myAppImg.frame.size.width - 30];
            } completion:^(BOOL finished) {
                _clickImgView.hidden = NO;
                _animationStep = STEP_THREE;
                [self performSelector:@selector(performSelectorAction) withObject:nil afterDelay:0.3];
            }];
        }
            break;
        case STEP_THREE:
        {
            _editimgStep = ESTEP_ONE;
            [self performSelector:@selector(moveEditImg) withObject:nil afterDelay:0.5];
            [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                _myAppImg.frame = CGRectMake(_myAppImg.frame.origin.x, 46, _myAppImg.frame.size.width, _myAppImg.frame.size.height);
                _handImgView.frame = CGRectMake(_handImgView.frame.origin.x, 126.5 - 23*3, _handImgView.frame.size.width, _handImgView.frame.size.height);
            } completion:^(BOOL finished) {
                _clickImgView.hidden = YES;
                _animationStep = STEP_FOUR;
                [self performSelector:@selector(performSelectorAction) withObject:nil afterDelay:1];
            }];
        }
            break;
        case STEP_FOUR:
        {
            [UIView animateWithDuration:0.5  delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                _handImgView.frame = [self getHandImgFrameWith:_overLable.frame andOrightX:_overLable.frame.size.width - 25];
            } completion:^(BOOL finished) {
                _clickImgView.hidden = NO;
                _animationStep = STEP_FIVE;
                [self performSelector:@selector(performSelectorAction) withObject:nil afterDelay:0.3];
            }];
        }
            break;
        case STEP_FIVE:
        {
            _clickImgView.hidden = YES;
            [UIView animateWithDuration:0.5  delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                _editView.frame = CGRectMake(0,574/2, 324/2, 574/2);
                _handImgView.frame = CGRectMake(324/2, 140, _handImgView.frame.size.width, _handImgView.frame.size.height);
            } completion:^(BOOL finished) {
                _overBtn.hidden = NO;
                _overBtn.alpha = 0;
                [UIView animateWithDuration:0.3 animations:^{
                    _overBtn.alpha = 1.0f;
                } completion:^(BOOL finished) {
                    _scrollView.userInteractionEnabled = YES;
                    _haveLook = YES;
                }];
            }];
        }
            break;
        default:
            break;
    }
}

-(void)moveEditImg
{
    
    switch (_editimgStep) {
        case ESTEP_ONE:
        {
            _editimgStep = ESTEP_TWO;
            [self performSelector:@selector(moveEditImg) withObject:nil afterDelay:0.3];
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                _editImgThree.frame = CGRectMake(_editImgThree.frame.origin.x,115, _editImgThree.frame.size.width, _editImgThree.frame.size.height) ;
            }completion:^(BOOL finished) {
                
            }];
        }
            break;
        case ESTEP_TWO:
        {
            _editimgStep = ESTEP_THREE;
            [self performSelector:@selector(moveEditImg) withObject:nil afterDelay:0.3];
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                _editImgTwo.frame = CGRectMake(_editImgTwo.frame.origin.x, 92, _editImgTwo.frame.size.width, _editImgTwo.frame.size.height);
            }completion:^(BOOL finished) {
                
            }];
        }
            break;
        case ESTEP_THREE:
        {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                _editImgOne.frame = CGRectMake(_editImgOne.frame.origin.x, 69, _editImgOne.frame.size.width, _editImgOne.frame.size.height);
            }completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        default:
            break;
    }
    
}

-(CGRect)getHandImgFrameWith:(CGRect)frame andOrightX:(float)orightX
{
    return CGRectMake(orightX, frame.origin.y + frame.size.height/2, _handImgView.frame.size.width, _handImgView.frame.size.height);
}

-(void)createEditView
{
    int relative = 10;
    
    UIView *editBGView = [[UIView alloc]initWithFrame:CGRectMake(0,relative, 324/2, 574/2 - relative)];
    editBGView.backgroundColor = UIColorFromRGB(0x353e41);
    
    
    [_editView addSubview:editBGView];
    
    UILabel *todyLable = [self createLableFrame:CGRectMake(0, relative, _editView.frame.size.width, 11)
                                        andFont:10
                                       andColor:[UIColor whiteColor]
                             andNSTextAlignment:NSTextAlignmentCenter
                                        andText:@"今天"];
    [editBGView addSubview:todyLable];
    
    _overLable = [self createLableFrame:CGRectMake(0, relative, _editView.frame.size.width - 10, 11)
                                andFont:10
                               andColor:[UIColor whiteColor]
                     andNSTextAlignment:NSTextAlignmentRight
                                andText:@"完成"];
    [editBGView addSubview:_overLable];
    relative += _overLable.frame.size.height + 5;
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0,relative,320, 0.5)];
    line.backgroundColor = UIColorFromRGB(0x4a5255);
    
    [editBGView addSubview:line];
    relative += line.frame.size.height + 20;
    
    _editImgOne = [self createImgViewFrame:CGRectMake(0, relative, 324/2, 46/2)
                                    andImg:UIImageByName(@"新手引导图/entry_1.png")
                              andSuperview:editBGView];
    relative += _editImgOne.frame.size.height;
    
    _editImgTwo = [self createImgViewFrame:CGRectMake(0, relative, 324/2, 46/2)
                                    andImg:UIImageByName(@"新手引导图/entry_1.png")
                              andSuperview:editBGView];
    relative += _editImgTwo.frame.size.height;
    
    _editImgThree = [self createImgViewFrame:CGRectMake(0, relative, 324/2, 46/2)
                                      andImg:UIImageByName(@"新手引导图/entry_1.png")
                                andSuperview:editBGView];
    relative += _editImgThree.frame.size.height + 70;
    
    _myAppImg = [self createImgViewFrame:CGRectMake(0, relative, 324/2, 46/2)
                                  andImg:UIImageByName(@"新手引导图/entry_2.png")
                            andSuperview:editBGView];
}

#pragma mark - 引导页面看完，立即体验
-(void)start:(id)sender
{
  
        //    [self removeFromSuperview];
        //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        //    [defaults setBool:YES forKey:@"noFirstLogin"];
        //    [defaults synchronize];
    
    [self.view removeFromSuperview];
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [app setUpCustomTab];
    
    [[AppSet shareInstance] saveNewFunFlag];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];

    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //    if (scrollView.contentOffset.x > (scrollView.contentSize.width-scrollView.bounds.size.width+10))
    //    {
    //        if ((_isIOS8Later && _haveLook ) || !_isIOS8Later)
    //        {
    //            [self start:nil];//开始体验
    //        }
    //
    //    }
}

//减速停止的时候 出动画
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/scrollView.frame.size.width;
    //    [_pageControl setCurrentPageAt:index];
    
    if (_isIOS8Later)
    {
        if (scrollView.contentOffset.x > (scrollView.contentSize.width - 2*scrollView.bounds.size.width))
        {
            //            if (!_isTodayNow)
            //            {
            //                _scrollView.userInteractionEnabled = NO;
            //                [self performSelector:@selector(startAnimation) withObject:nil afterDelay:0.5];
            //            }
            
            _isTodayNow = YES;
        }
        else
        {
            [self restoreAllView];
            _isTodayNow = NO;
        }
    }
    
    //体验按钮
    if(index == 3)
    {
        [self performSelector:@selector(showOverBtn) withObject:nil afterDelay:0.2];
    }
    
    
    /*
     //弹动画
     if (index == 3 && _lastIndex != 3)
     {
     //        [self performSelectorOnMainThread:@selector(startBallAnimation) withObject:nil waitUntilDone:NO];
     [self startUpAnimation:_fourthImgView];
     }
     else if(index != 3)
     {
     if (!_isIOS8Later)
     {
     _overBtn.hidden = YES;
     _scorllBtn.hidden = YES;
     }
     
     _fourthImgView.hidden = YES;
     
     [_ballTimer invalidate];
     _ballTimer = nil;
     
     for (int i = 1; i <= RAIDERS_NUM; i ++)
     {
     UIImageView *raidersImgView = (UIImageView *)[self.view viewWithTag:50 + i];
     raidersImgView.hidden = YES;
     }
     }
     
     //崩出来动画
     if (index == 1 && _lastIndex != 1)
     {
     [self startUpAnimation:_secondImgView];
     }
     else if(index != 1)
     {
     _secondImgView.hidden = YES;
     }
     
     //电池动画
     if (index == 2 && _lastIndex != 2)
     {
     //        [self performSelector:@selector(startFillInAnimation) withObject:nil afterDelay:0.1];
     [self startFillInAnimation];
     }
     else if (index != 2)
     {
     _thirdImgView.frame = CGRectMake(0, 40, _thirdImgView.frame.size.width, _thirdImgView.frame.size.height);
     }
     
     
     */
    _lastIndex = index;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    float x = (_bgImgView.bounds.size.width-(320-2*BACKGROUND_DX)) * scrollView.contentOffset.x/(scrollView.contentSize.width-320);
    //    _bgImgView.frame = CGRectOffset(_bgImgView.bounds, -x+BACKGROUND_DX, 0);
    
    //    if (scrollView.contentOffset.x <= 0) {
    //        self.view.backgroundColor = RGBCOLOR(0xcf, 0x9a, 0x5b);
    //    }
    //    else if(scrollView.contentOffset.x < 100)
    //    {
    //        self.view.backgroundColor = [UIColor clearColor];
    //    }
    
    //new
    
    
    
    
    
    
    
    int index = fabs(scrollView.contentOffset.x)/scrollView.frame.size.width;
    
    
    // 255,116,116; 147,221,137; 255,116,116; 96,220,255
    
    CGFloat perChange=(scrollView.contentOffset.x - index*320)/320.;
    switch (index) {
        case 0:
        {
            
            CGFloat r,g,b;
            r=255 + (147-255)*perChange ; //255->147
            g=116 +(221-116)*perChange; //116->221
            b=116 +(137-116)*perChange;
            
            self.view.backgroundColor=UICOLOR_RGB(r, g, b);
        }
            break;
        case 1:
        {
            CGFloat r,g,b;
            r=147 + (255-147)*perChange ; //255->147
            g=221 +(116-221)*perChange; //116->221
            b=137 +(116-137)*perChange;
            
            self.view.backgroundColor=UICOLOR_RGB(r, g, b);
        }
            break;
        case 2:
        {
            CGFloat r,g,b;
            r=255 + (96-255)*perChange ; //255->147
            g=116 +(220-116)*perChange; //116->221
            b=116 +(255-116)*perChange;
            
            self.view.backgroundColor=UICOLOR_RGB(r, g, b);
        }
            break;
        case 3:
        {
            CGFloat r,g,b;
            r=96 + (255-96)*perChange ; //255->147
            g=220 +(116-220)*perChange; //116->221
            b=255 +(116-255)*perChange;
            
            self.view.backgroundColor=UICOLOR_RGB(r, g, b);
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    NSLog(@"动态第%d页,%f",index,scrollView.contentOffset.x);
    
    float degrees = fmod(-scrollView.contentOffset.x,scrollView.frame.size.width)*90/320;
    float degreesNow = degrees - index*90;
    //    if (degrees == 0)
    //    {
    //        return;
    //    }
    
    _guideBGView.transform = CGAffineTransformMakeRotation(degreesToRadians(degreesNow));
    _earthImgView.transform = CGAffineTransformMakeRotation(degreesToRadians(degreesNow));
    
    
    int imgIdext;
    
    if (scrollView.contentOffset.x > _lastContentX)//向左滑动
    {
        
        imgIdext = index + 1 + 1;
        if (imgIdext <= GUIDE_NUM)
        {
            NSLog(@"向左边滑动");
            int nextTag = imgIdext%5 + imgIdext/5;
            
            UIImageView *guideImg = (UIImageView *)[self.view viewWithTag:100 + nextTag];
            guideImg.hidden = NO;
            NSString* str;
            if(IS_IPHONE_5)
            {
                str = [NSString stringWithFormat:@"新手引导图/iphone5/引导 %d.png", imgIdext];
            }
            else
            {
                str = [NSString stringWithFormat:@"新手引导图/引导%d.png", imgIdext];
            }
            guideImg.image = UIImageByName(str);
        }
        else
        {
            //            NSLog(@"已经是最后一张了");
            //            int nextTag = 1;
            //
            //            UIImageView *guideImg = (UIImageView *)[self.view viewWithTag:100 + nextTag];
            //            guideImg.hidden = YES;
            //
            ////            UIImageView *guideImg2 = (UIImageView *)[self.view viewWithTag:101 + nextTag];
            ////            guideImg2.hidden = YES;
            //
            //            if (!_earthImgView.hidden)//避免IOS8引导图滑动的时候下面出现地球图片
            //            {
            //                if (_isIOS8Later && scrollView.contentOffset.x > (scrollView.contentSize.width - scrollView.bounds.size.width))
            //                {
            //                    _earthImgView.hidden = YES;
            //                }
            //                else
            //                {
            //                    _earthImgView.hidden = NO;
            //                }
            //
            //            }
            
        }
        
    }
    else
    {
        if (scrollView.contentOffset.x < (scrollView.contentSize.width - scrollView.bounds.size.width))
        {
            _earthImgView.hidden = NO;
        }
        
        imgIdext = index + 1 - 1;
        if (imgIdext >= 1)
        {
            NSLog(@"向右边滑动");
            int lastTag = imgIdext%5 + imgIdext/5;
            
            UIImageView *guideImg = (UIImageView *)[self.view viewWithTag:100 + lastTag];
            guideImg.hidden = NO;
            NSString* str;
            if(IS_IPHONE_5)
            {
                str = [NSString stringWithFormat:@"新手引导图/iphone5/引导 %d.png", imgIdext];
            }
            else
            {
                str = [NSString stringWithFormat:@"新手引导图/引导%d.png", imgIdext];
            }
            guideImg.image = UIImageByName(str);
        }
        else
        {
            NSLog(@"已经是第一张了");
            UIImageView *guideImg = (UIImageView *)[self.view viewWithTag:104];
            //            guideImg.hidden = YES;
        }
        
    }
    
    _lastContentX = scrollView.contentOffset.x;
    
}

-(UIImageView *)createImgViewFrame:(CGRect)frame andImg:(UIImage *)image andSuperview:(UIView *)imgSuperView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = image;
    [imgSuperView addSubview:imageView];
    
    return imageView;
}

-(UILabel *)createLableFrame:(CGRect)frame
                     andFont:(int)font
                    andColor:(UIColor *)color
          andNSTextAlignment:(NSTextAlignment)alignment
                     andText:(NSString *)text
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = alignment;
    label.text = text;
    
    return label;
}

@end
