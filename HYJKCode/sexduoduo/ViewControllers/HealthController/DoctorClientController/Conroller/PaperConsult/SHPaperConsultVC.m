//
//  SHPaperConsultVC.m
//  sexduoduo
//
//  Created by showm on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  论文咨询

#import "SHPaperConsultVC.h"
#import "SHPaperTableView.h"
#import "SHPaperTableView2.h"
@interface SHPaperConsultVC ()
{
    UIView *headView;
    
    NSInteger segmentSelect;
}
@property(strong,nonatomic)SHPaperTableView *leftTbView;
@property(strong,nonatomic)SHPaperTableView2 *rightTbView;

@end

@implementation SHPaperConsultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleStr:@"论文咨询"];
    UIButton *rightBtn=[UIButton buttonWithType:0];
    [rightBtn setTitleColor:colorWith01 forState:UIControlStateNormal];
    [rightBtn setTitle:@"咨询" forState:UIControlStateNormal];
    [rightBtn.titleLabel setFont:FONT_WITH_SIZE(14)];
    rightBtn.frame=CGRectMake(k_screenWidth-60, 20 + 45/2.-25/2., 45, 25);
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn qzSetCornerRadius:rightBtn.height/2.];
    [rightBtn qzSetBorderColor:colorWith01];
    [rightBtn qzSetBorderWidth:1];
    [self.view addSubview:rightBtn];
    
    
    self.view.backgroundColor = WHITE_COLOR;
    [self initView];
    
}

-(void)initHeadView
{
    segmentSelect = 0;
    
    headView = [[UIView alloc] initWithFrame:CGRectMake(0, STAR_Y, k_screenWidth, 44)];
    headView.backgroundColor = WHITE_COLOR;
    [self.view addSubview:headView];
    
    UILabel *leftLab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, headView.width/2., headView.height)];
    leftLab.text =@"中文";
    leftLab.textAlignment =NSTextAlignmentCenter;
    leftLab.font = [UIFont fontWithName:k_Font size:15];
    leftLab.textColor = colorWith01;
    leftLab.tag = 1000;
    [headView addSubview:leftLab];
    
    UILabel *rightLab=[[UILabel alloc] initWithFrame:CGRectMake(headView.width/2., 0, headView.width/2., headView.height)];
    rightLab.text = @"English";
    rightLab.textAlignment =NSTextAlignmentCenter;
    rightLab.font = [UIFont fontWithName:k_Font size:15];
    rightLab.textColor = colorWith01;
    rightLab.tag = 1001;
    [headView addSubview:rightLab];
    
    UIView *line1 =[[UIView alloc] initWithFrame:CGRectMake( headView.width/2. , 8, 1, headView.height-16)];
    line1.backgroundColor = GRAY_COLOR_TABLEVIEWLINE;
    [headView addSubview:line1];
    
    
    UIButton *leftBtn = [UIButton buttonWithType: 0];
    [leftBtn setFrame:leftLab.frame] ;
    leftBtn.tag = 1002;
    [headView addSubview:leftBtn];
    [leftBtn addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightBtn = [UIButton buttonWithType: 0];
    [rightBtn setFrame:rightLab.frame] ;
    rightBtn.tag = 1003;
    [headView addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    
    //下划线
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, headView.height-2, headView.width/2., 2)];
    imageView.backgroundColor = colorWith01;
    imageView.tag = 1004;
    [headView addSubview:imageView];
    
}
-(void)initView
{
    
    [self initHeadView];
   
    
    
    
    
    //
    self.leftTbView=[[SHPaperTableView alloc] initWithTableViewWithFrame:CGRectMake(0, headView.bottom, k_screenWidth, k_screenHeight-headView.bottom) withVC:self];
    [self.view addSubview:self.leftTbView];
    
    self.rightTbView= [[SHPaperTableView2 alloc] initWithTableViewWithFrame:CGRectMake(0, headView.bottom, k_screenWidth, k_screenHeight-headView.bottom) withVC:self];
    self.rightTbView.hidden = YES;
    [self.view addSubview: self.rightTbView];
    
    
   
    
    NSString * path=[[NSBundle mainBundle]pathForResource:@"SHPaperConsultData" ofType:@"plist"];
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:path];
    self.leftTbView.tvData = array;
    
    NSString * path1=[[NSBundle mainBundle]pathForResource:@"SHPaperRightText" ofType:@"plist"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:path1];

//    NSLog(@"%@====",dic);
    self.rightTbView.tvData = dic;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - aciton 
-(void)headBtnClick:(UIButton *)sender
{
    UIImageView *lineImage = (UIImageView *)[headView viewWithTag:1004];
    UILabel *leftLab  =  (UILabel *)[headView viewWithTag:1000];
    UILabel *rightLab =  (UILabel *)[headView viewWithTag:1001];

    
    if (sender.tag == 1002) {//左按钮
        segmentSelect = 0;
        
        lineImage.left = 0;
        leftLab.textColor = colorWith01;
        rightLab.textColor = colorWith02;
        self.leftTbView.hidden = NO;
        self.rightTbView.hidden = YES;
    }else
    {
        segmentSelect = 1;
        
        lineImage.left = headView.width/2.;
        
        leftLab.textColor = colorWith02;
        rightLab.textColor = colorWith01;
        
        self.leftTbView.hidden = YES;
        self.rightTbView.hidden = NO;
        
    }
}

-(void)rightBtnClick:(id)sender
{
    NSLog(@"===");
}


#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc
{
    if (pvc == nil) {
        return;
    }
    SHPaperConsultVC* vc = [[SHPaperConsultVC alloc]init];
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}
@end
