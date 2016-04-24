//
//  SHDCVisitVC.m
//  sexduoduo
//
//  Created by shown on 15/9/17.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  @"出诊时间",@"出诊价格" 

#import "SHDCVisitVC.h"
#import "SHDCVisitMoneyView.h"
#import "SHDCVisitTimeView.h"
#import "SHDCVisitTimeHeadView.h"
@interface SHDCVisitVC ()
{
    NSMutableArray *timeArray;
    NSString *specialTime;
}
@property (nonatomic,strong)SHDCVisitTimeView *visitTimeView;

@property (nonatomic,strong)SHDCVisitMoneyView *visitMoneyView;

@property (nonatomic,strong)UISegmentedControl *segmentedControl;

@end

@implementation SHDCVisitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    // 从周一到 周日 显示的 接听时间
    timeArray = [[NSMutableArray alloc] init];
    for (int i=0; i<7; i++) {
        [timeArray addObject:@"--:-- ~ --:--"];
    }
    
    
    
    [self initView];
    
    [self requestData ];
    [self requestPrice];
    
    
}

#pragma  mark ---UI

- (void)initView
{
    NSArray *nameArray=[[NSArray alloc]initWithObjects:@"出诊时间",@"出诊价格", nil];
    
    _segmentedControl = [[UISegmentedControl alloc]initWithItems:nameArray];
    _segmentedControl.tintColor=colorWith01;
    _segmentedControl.selectedSegmentIndex=0;
    _segmentedControl.frame=CGRectMake(80, 25, 160, 33);
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12],NSFontAttributeName,colorWith02, NSForegroundColorAttributeName, nil];
    [_segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:92/255.0f green:214/255.0f blue:186/255.0f alpha:1] forKey:NSForegroundColorAttributeName];
    [_segmentedControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    [_segmentedControl addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedControl];
    
    
    
    // 出诊时间
    _visitTimeView=[[SHDCVisitTimeView alloc]initWithCopeTableViewWithFrame:CGRectMake(APP_SPACE(0), STAR_Y, self.view.frame.size.width, k_screenHeight-STAR_Y) withVC:self];
    _visitTimeView.timeArray = timeArray;
    [self.view addSubview:_visitTimeView];
    
    
    // 出诊价格
    _visitMoneyView=[[SHDCVisitMoneyView alloc]init];
    _visitMoneyView.frame=CGRectMake(APP_SPACE(0), STAR_Y, self.view.frame.size.width, k_screenHeight-STAR_Y);
    _visitMoneyView.backgroundColor=[UIColor whiteColor];
    _visitMoneyView.hidden =YES;
    [self.view addSubview:_visitMoneyView];
    
    
    
}

#pragma mark - initData
-(void)requestData
{

    NSDictionary *dic=@{@"doctorId":DOCTORID};
    [AFHTTPClient postJSONPath:SHINTERFACE_getCallTime httpHost:sexHealthTestIP parameters:dic success:^(id responseObject) {
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        
        NSLog(@"时间列表=%@",dic);
        
        NSArray *weekKeyArray= @[@"week1",@"week2",@"week3",@"week4",@"week5",@"week6",@"week7"];
        
        //1.先用week1 到callTime 字典中索引到 该key值 ； 2.然后根据该值 去匹配 deatils里面每个数组 的 id
        if ([dic[@"success"] integerValue]==1) {
            NSDictionary *callTimeDic=dic[@"datasource"][@"callTime"];
            
            NSArray *timeDetailArray=callTimeDic[@"details"];
            
            //1.先用week1 到callTime 字典中 索引到 该key值
            for (int i=0; i<weekKeyArray.count; i++) {
                
                NSString * weekIdStr=callTimeDic[weekKeyArray[i]];
                
                //===特别设定 的值
                NSString *specialKey=@"especial";
                NSString *specialId = callTimeDic[specialKey];
                
                
                 //2.然后根据该值 去匹配 deatils里面每个数组 的 id
                for (NSDictionary *detailDic in timeDetailArray) {
                    
                    NSString * tempIDStr=[NSString stringWithFormat:@"%@",detailDic[@"id"]];
                    if ([tempIDStr isEqualToString:weekIdStr]) {
                        
                        NSString *part1Time=detailDic[@"part1"];
                        [timeArray replaceObjectAtIndex:i withObject:part1Time];//替换哪天的时间
                    }
                    
                    if ([tempIDStr isEqualToString:specialId]) {
                        specialTime = detailDic[@"part1"];
                    }
                }
                
            }
            
            
            
            
        }
        
        _visitTimeView.timeArray = timeArray;
        _visitTimeView.specialTime = specialTime;
        [_visitTimeView reloadData];
       
        
       
        
    } fail:^{
        
    }];
    
    
}

-(void)requestPrice
{
    NSDictionary *dic=@{@"doctorId":DOCTORID};
    [AFHTTPClient postJSONPath:SHINTERFACE_editCallPrice httpHost:sexHealthTestIP parameters:dic success:^(id responseObject) {
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        
        NSLog(@"价格列表=%@",dic);
        
        if ([dic[@"success"] integerValue]==1) {
            
            
        }
    } fail:^{
        
    }];
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
        {
            _visitMoneyView.hidden = YES;
            _visitTimeView.hidden  = NO;
        }
            break;
        case 1:
        {
            _visitMoneyView.hidden = NO;
            _visitTimeView.hidden  = YES;
        }
            break;
            
        default:
            break;
    }
}
@end