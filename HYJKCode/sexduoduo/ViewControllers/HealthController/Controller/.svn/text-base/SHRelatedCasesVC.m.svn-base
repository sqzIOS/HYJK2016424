//
//  SHRelatedCasesVC.m
//  sexduoduo
//
//  Created by shown on 15/9/6.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHRelatedCasesVC.h"
#import "SHRelatedCasesTableView.h"
#import "SHVIPVC.h"
@interface SHRelatedCasesVC ()

@property (nonatomic,strong)SHRelatedCasesTableView *tbView;

@end

@implementation SHRelatedCasesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    
    [self setTopNavView];
    
    [self initView];
    
    [self requestData];
}
#pragma mark - UI
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,self.view.frame.size.width, 64)];
    [self.view addSubview:navView];
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"案例详情";
    [navView addSubview:titleImgV];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_right:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = 1000;
    [navView addSubview:leftBtn];
}
- (void)initView
{
    self.tbView=[[SHRelatedCasesTableView alloc]initWithTableViewWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT-STAR_Y -44) withVC:self withType:1];
    [self.view addSubview:self.tbView];
    
    [self initTbHeaderView];
    //分割线
    //特约VIP服务  按钮
    UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-45, SCREEN_WIDTH, 1)];
    imageV.backgroundColor=colorWith05;
    [self.view addSubview:imageV];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, SCREEN_HEIGHT-44, SCREEN_WIDTH, 44);
    button.backgroundColor=[UIColor whiteColor];
    [button setTitle:@"快速问医生" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:92/255.0f green:214/255.0f blue:186/255.0f alpha:1] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(bt_action__doctor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)initTbHeaderView
{
    UIView *contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, k_screenWidth, 100)];
    contentView.backgroundColor = WHITE_COLOR;
    
    UILabel *sexLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 40, 20)];
    sexLabel.backgroundColor=CLEAR_COLOR;
    sexLabel.font = [UIFont fontWithName:k_Font size:14];
    sexLabel.text = self.contentDic[@"sex"];
    [contentView addSubview:sexLabel];
    
    UILabel *ageLabel=[[UILabel alloc]initWithFrame:CGRectMake(45, 5, 50, 20)];
    ageLabel.backgroundColor=CLEAR_COLOR;
    ageLabel.font = [UIFont fontWithName:k_Font size:14];
    ageLabel.text = [NSString stringWithFormat:@"%@岁",self.contentDic[@"age"]];
    [contentView addSubview:ageLabel];
    
    
    
    
    
    //        self.headerImageVC=[[UIImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width-80, 5, 40, 40)];
    //        self.headerImageVC.backgroundColor=[UIColor redColor];
    //        [self.contentView addSubview:self.headerImageVC];
    
    UILabel *problemlabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 45, 100, 20)];
    problemlabel.backgroundColor=CLEAR_COLOR;
    problemlabel.font = [UIFont fontWithName:k_Font size:14];
    problemlabel.text =@"问题描述";
    [contentView addSubview:problemlabel];
    
    //        self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width-120, 45, 120, 20)];
    //        self.nameLabel.backgroundColor=CLEAR_COLOR;
    //        self.nameLabel.textAlignment = NSTextAlignmentCenter;
    //        self.nameLabel.text=@"医师名称";
    //        [self.contentView addSubview:self.nameLabel];
    
    //背景框
    UIImageView *textBoxImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 70, contentView.frame.size.width-20, 80)];
    UIImage *image = UIImageByName(@"health_BingQing_textBox");
    // 设置图片可以拉伸
    image = [image setImageCanStretch];
    textBoxImageView.image = image;
    [contentView addSubview:textBoxImageView];
    
    
    UILabel *contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(14, 78, k_screenWidth-28, 80 - 8 - 5)];
    contentLabel.backgroundColor=CLEAR_COLOR;
    contentLabel.font = [UIFont fontWithName:k_Font size:14];
    contentLabel.numberOfLines = 0;
    [contentView addSubview:contentLabel];
    
    contentLabel.text = self.contentDic[@"content"];
    
    CGSize size=[NSString getTextMultilineContent:self.contentDic[@"content"] withFont:contentLabel.font withSize:CGSizeMake(contentLabel.width, 1000)];
    contentLabel.height = size.height;
    
    textBoxImageView.height = size.height + 8 + 5 ;
    
    contentView.height = textBoxImageView.bottom +10;
    
    
    self.tbView.tableHeaderView=contentView;
}
#pragma mark- Touch点击事件
- (void)bt_action_right:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}
- (void)bt_action__doctor
{
    //跳到快速问医生界面；
    NSLog(@"跳到快速问医生界面");
    [SHVIPVC gotoMySelf:self withType:SHExternalTypeVip];

}

#pragma mark -  data
-(void)requestData
{
    [MBHud showInView:self.view withTitle:@"加载中..."];
    
    NSDictionary *tempDic = @{@"casesId":self.contentDic[@"casesId"]};
    [AFHTTPClient postJSONPath:SHINTERFACE_getQuestionDetail httpHost:sexHealthIP parameters:tempDic success:^(id responseObject) {
        
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        
        NSLog(@"案例详情=%@---案例详情",dic);
        
        self.listArray = [[NSMutableArray alloc]initWithArray:dic[@"datasource"][@"replyList"]];
        
        [self.tbView setListArray:self.listArray];
        
        [MBHud removeFromView:self.view];
    } fail:^{
        [MBHud removeFromView:self.view];

    }];
    
}



#pragma mark - --gotoMySelf

+(void)gotoMySelf:(id)pvc
{
    if (pvc == nil) {
        return;
    }
    
    SHRelatedCasesVC* vc = [[SHRelatedCasesVC alloc]init];
    
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
