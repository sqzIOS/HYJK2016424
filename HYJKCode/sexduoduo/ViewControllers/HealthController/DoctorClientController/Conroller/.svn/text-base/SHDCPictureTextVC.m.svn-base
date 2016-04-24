//
//  SHDCPictureTextVC.m
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//   图文咨询和电话问诊

#import "SHDCPictureTextVC.h"
#import "SHDCPictureTextTableView.h"
#import "SHDCPhoPicturnTableView.h"
#import "SHDCCusComplaintVC.h"
#import "SHDCPhoneDiagnosisVC.h"
@interface SHDCPictureTextVC ()

@property (nonatomic,strong)UISegmentedControl *segmentedControl;

@property (nonatomic,strong)SHDCPictureTextTableView *tableView;

@property (nonatomic,strong)SHDCPhoPicturnTableView *pTableView;

@end

@implementation SHDCPictureTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self initView];


    [self setTopNavView];
    
}
#pragma  mark ---UI
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,self.view.frame.size.width, 64)];
    [self.view addSubview:navView];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_Nav_left) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
    
    NSArray *nameArray=[[NSArray alloc]initWithObjects:@"图文咨询",@"电话问诊", nil];
    
    _segmentedControl = [[UISegmentedControl alloc]initWithItems:nameArray];
    _segmentedControl.tintColor=colorWith01;
    _segmentedControl.selectedSegmentIndex=0;
    _segmentedControl.frame=CGRectMake(80, 25, 160, 33);
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12],NSFontAttributeName,colorWith02, NSForegroundColorAttributeName, nil];
    
    [_segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:92/255.0f green:214/255.0f blue:186/255.0f alpha:1] forKey:NSForegroundColorAttributeName];
     [_segmentedControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    [_segmentedControl addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    
    [navView addSubview:_segmentedControl];
    
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame=CGRectMake(navView.frame.size.width-64, 30, 54, 24);
    [rightBtn setTitleColor:colorWith07 forState:UIControlStateNormal];
    [rightBtn setTitle:@"客诉" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(bt_Nav_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:rightBtn];
}
- (void)initView
{
    
    if (_segmentedControl.selectedSegmentIndex==0) {
        _tableView=[[SHDCPictureTextTableView alloc]initWithCopeTableViewWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44) withVC:self];
        [self.view addSubview:_tableView];
        
        
        
    }
}
- (void)requestData
{
    
}

#pragma mark ---action点击事件

- (void)bt_Nav_left
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
            _tableView=[[SHDCPictureTextTableView alloc]initWithCopeTableViewWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) withVC:self];
            [self.view addSubview:_tableView];             break;
        case 1:
            _pTableView=[[SHDCPhoPicturnTableView alloc]initWithCopeTableViewWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) withVC:self];
            [self.view addSubview:_pTableView];
            
            
            break;
        default:
            break;
    }
}
- (void)bt_Nav_right
{
    //客诉;
    SHDCCusComplaintVC *vc=[[SHDCCusComplaintVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
