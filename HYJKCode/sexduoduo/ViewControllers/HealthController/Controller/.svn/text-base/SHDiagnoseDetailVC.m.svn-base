//
//  SHDiagnoseDetailVC.m
//  sexduoduo
//
//  Created by shown on 15/9/2.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDiagnoseDetailVC.h"
#import "SHDiagnoseCaseCell.h"
#import "SHRelatedCaseCell.h"
#import "SHTreatmentVC.h"
#import "SHRelatedCasesVC.h"
#import "SHDiagnoseDetailHeadView.h"
#import "SHVIPVC.h"
@interface SHDiagnoseDetailVC ()
{
    TopNavView *navView;//导航条
    UILabel *titleImgV ;
    
    
    UIView *headView;//tbView的headView
    SHDiagnoseDetailHeadView *hView;//自定义的可以点击的view
}
@end

@implementation SHDiagnoseDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self setTopNavView];
    
    [self initView];
    
    [self initData];
    
    NSLog(@"详情--%@",self.idStr);
}
#pragma  mark ---UI
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,self.view.frame.size.width, 64)];
    [self.view addSubview:navView];
    
    titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 320-120, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"病情详解";
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


    headView = [[UIView alloc] init];
    UILabel *nameLab;
    nameLab = FastCreatLabel(CGRectMake(15, 0, k_screenWidth, 44), BLACK_COLOR, [UIFont fontWithName:k_Font size:18], CLEAR_COLOR, NSTextAlignmentLeft);
    nameLab.text = @"病情详解：";
    [headView addSubview:nameLab];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43.5, k_screenWidth, 0.5)];
    line.backgroundColor=UICOLOR_RGB(200, 200, 200);
    [headView addSubview:line];
    
    
    hView=[[SHDiagnoseDetailHeadView alloc] initWithVC:self];
    [headView addSubview:hView];
    
    hView.top +=44;
    headView.frame = CGRectMake(0, 0, k_screenWidth, hView.bottom);
    
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0,STAR_Y, self.view.frame.size.width, k_screenHeight-STAR_Y -45)];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.tableHeaderView = headView;
    [self.tableview setLineZero];
    
    [self.view addSubview:self.tableview];
    
    [self.tableview clearDefaultLineByAddFootLine];
    
    //分割线
    //特约VIP服务按钮
    UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0,k_screenHeight-45,self.view.frame.size.width, 1)];
    imageV.backgroundColor=colorWith05;
    [self.view addSubview:imageV];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44);
    button.backgroundColor=[UIColor whiteColor];
    [button setTitleColor:[UIColor colorWithRed:92/255.0f green:214/255.0f blue:186/255.0f alpha:1] forState:UIControlStateNormal];
    [button setTitle:@"特约VIP服务" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(VIP_click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}


#pragma mark -  initData

-(void)initData
{
    [self requestData];
}

#pragma mark 网络请求

-(void)requestData
{
    [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    
    NSDictionary *dic=@{@"diseaseCategoryId":self.idStr};
    [AFHTTPClient postJSONPath:SHINTERFACE_getDuseaseDetail httpHost:sexHealthIP parameters:dic success:^(id responseObject) {
        
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        
        NSLog(@"自我诊断三级页面----%@----自我诊断三级页面",dic);
        
        if (dic[@"success"] && [dic[@"success"] intValue]==1) {
        
            self.dataDic = [[NSMutableDictionary alloc] initWithDictionary:dic[@"datasource"]];
            
            //====病情详解
            self.detailArray = [[NSMutableArray alloc]initWithCapacity:6];
            if (self.dataDic[@"instructions"]) {//疾病说明
                [self.detailArray addObject:self.dataDic[@"instructions"]];
            }else [self.detailArray addObject:@""];

            if (self.dataDic[@"manifestations"]) {//临床表现
                [self.detailArray addObject:self.dataDic[@"manifestations"]];
            }else [self.detailArray addObject:@""];
            
            if (self.dataDic[@"cause"]) {//病因
                [self.detailArray addObject:self.dataDic[@"cause"]];
            }else [self.detailArray addObject:@""];
            
            if (self.dataDic[@"checkDiagnosis"]) {//检查和诊断
                [self.detailArray addObject:self.dataDic[@"checkDiagnosis"]];
            }else [self.detailArray addObject:@""];
            
            if (self.dataDic[@"prevention"]) {//预防
                [self.detailArray addObject:self.dataDic[@"prevention"]];
            }else [self.detailArray addObject:@""];
            
            if (self.dataDic[@"treatment"]) {//治疗
                [self.detailArray addObject:self.dataDic[@"treatment"]];
            }else [self.detailArray addObject:@""];
            
            hView.detailArray =self.detailArray;
            
            
            //====相关案例
            
            NSArray *array = dic[@"datasource"][@"casesList"];
            self.caseArray = [[NSMutableArray alloc]initWithArray:array];
            
            [self.tableview reloadData];
            
            
            //====病情名称
            if(self.dataDic[@"name"])
            {
                titleImgV.text=[NSString clearWhiteSpace:self.dataDic[@"name"]];
            }
        }
        
        [MBHud removeFromView:self.view];
        
    } fail:^{
        
        
        [MBHud removeFromView:self.view];
    }];
}



#pragma  mark - -- UItableViewCell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    
//    return @"相关案例: ";
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, k_screenWidth, 44)];
    view.backgroundColor = WHITE_COLOR;
    UILabel *nameLab;
    nameLab = FastCreatLabel(CGRectMake(15, 0, k_screenWidth, 44), BLACK_COLOR, [UIFont fontWithName:k_Font size:18], CLEAR_COLOR, NSTextAlignmentLeft);
    nameLab.text = @"相关案例:";
    [view addSubview:nameLab];
    
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43.5, k_screenWidth, 0.5)];
    line.backgroundColor=UICOLOR_RGB(200, 200, 200);
    [view addSubview:line];
    
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return self.caseArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1)
    {
        return 44;
    }
    else if (indexPath.section==0)
    {
//        return 160;
        
        return [SHRelatedCaseCell heightOfCellWithContentStr:self.caseArray[indexPath.row][@"content"]];
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *showUserInfoCellIdentifier = @"SHRelatedCaseCell";
    SHRelatedCaseCell *cell1 = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell1)
    {
        cell1 = [[SHRelatedCaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
    }
    
    cell1.sexLabel.text = [NSString stringWithFormat:@"%@",self.caseArray[indexPath.row][@"sex"]];
    cell1.ageLabel.text = [NSString stringWithFormat:@"%@",self.caseArray[indexPath.row][@"age"]];
    
    [cell1 setContentLabelStr:[NSString stringWithFormat:@"%@",self.caseArray[indexPath.row][@"content"]]];
    
    return cell1;
  
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    SHRelatedCasesVC *vc=[[SHRelatedCasesVC alloc]init];
    vc.contentDic = self.caseArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma  mark ---action 事件
- (void)bt_action_right:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}
- (void)VIP_click
{
    //跳转到特约VIP界面
    
    [SHVIPVC gotoMySelf:self withType:SHExternalTypeVip];

}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc WithIDStr:(NSString *)idStr
{
    if (pvc == nil) {
        return;
    }
    
    SHDiagnoseDetailVC* vc = [[SHDiagnoseDetailVC alloc]init];
    vc.idStr = idStr;
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}

@end
