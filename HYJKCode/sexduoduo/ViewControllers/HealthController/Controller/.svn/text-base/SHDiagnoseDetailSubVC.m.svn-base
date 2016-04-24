//
//  SHDiagnoseDetailSubVC.m
//  sexduoduo
//
//  Created by showm on 15/9/14.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDiagnoseDetailSubVC.h"
@interface SHDiagnoseDetailSubVC ()
{
    NSArray *listHeaderArray;
    
    NSInteger _selectIndex;
}
@end

@implementation SHDiagnoseDetailSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self setTopNavView];
    [self initView];

    listHeaderArray =@[@"疾病说明",@"临床表现",@"病因",@"检查和诊断",@"预防",@"治疗"];;
    
    
//    _selectIndex =0;
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
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
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

    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0,STAR_Y, self.view.frame.size.width, k_screenHeight-STAR_Y)];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    [self.tableview setLineZero];
    
    [self.view addSubview:self.tableview];
    
    [self.tableview clearDefaultLineByAddFootLine];
    
    
}
#pragma mark- Touch点击事件
- (void)bt_action_right:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}


-(void)tableViewHeadBtnClick:(UIButton *)sender
{
    
    if(_selectIndex != sender.tag)
    {
        _selectIndex = sender.tag;
    }else _selectIndex =  -1;
    
    [self.tableview reloadData];
}
#pragma  mark - -- UItableViewCell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return listHeaderArray.count;
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
    nameLab.text = listHeaderArray[section];
    [view addSubview:nameLab];
    
    UIImageView *imaView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imaView.frame = CGRectMake(k_screenWidth-30,(44-24*2/3.)/2., 15*2/3., 24*2/3.);
    imaView.image=[UIImage imageNamed:@"health_next"];
    [view addSubview:imaView];
    
    
    UIButton *btn =FastCreatButton(CGRectMake(0, 0, k_screenWidth, 44), nil, CLEAR_COLOR, CLEAR_COLOR, nil, nil);
    btn.tag = section;
    [btn addTarget:self action:@selector(tableViewHeadBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43.5, k_screenWidth, 0.5)];
    line.backgroundColor=UICOLOR_RGB(200, 200, 200);
    [view addSubview:line];
    
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_selectIndex==section) {
        return 1;
    }else
        return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getHeightWithIndex:(int)indexPath.section];
}

-(CGFloat)getHeightWithIndex:(int)index
{
    
    CGSize size=[NSString getTextMultilineContent:self.detailArray[index] withFont:[UIFont fontWithName:k_Font size:14] withSize:CGSizeMake(290, 1000)];
    
    return size.height +10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showUserInfoCellIdentifier = @"rightTableViewCell";
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell1) {
        cell1 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
        
        
        [cell1.textLabel setFont:[UIFont fontWithName:k_Font size:15]];
        //        cell1.selectionStyle=UITableViewCellSelectionStyleGray;
        

        
        UILabel *labContent=[[UILabel alloc] initWithFrame:CGRectMake(15, 5, 290, 20)];
        labContent.tag=1000;
        labContent.numberOfLines = 0;
        labContent.font =[UIFont fontWithName:k_Font size:14];

        [cell1 addSubview:labContent];
    }
    
    NSString *contentStr= self.detailArray[indexPath.section];
    
    UILabel *labContent=(UILabel *)[cell1 viewWithTag:1000];
    labContent.text = contentStr;
    CGSize size =[NSString getTextMultilineContent:contentStr withFont:labContent.font withSize:CGSizeMake(290, 1000)];
    labContent.height = size.height;
    
    return cell1;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---gotoMySelf

+(void)gotoMySelf:(id)pvc WithDetailArray:(NSMutableArray *)arr withIndex:(int)index
{
    if (pvc == nil) {
        return;
    }
    
    SHDiagnoseDetailSubVC* vc = [[SHDiagnoseDetailSubVC alloc]init];
    vc.detailArray = arr;
    vc.selectIndex = index;
    
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
