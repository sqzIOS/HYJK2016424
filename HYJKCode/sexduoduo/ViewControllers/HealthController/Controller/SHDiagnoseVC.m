//
//  SHDiagnoseVC.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHDiagnoseVC.h"
#import "SHSearthVC.h"
#import "leftTableViewCell.h"
#import "rightTableViewCell.h"
#import "SHDiagnoseDetailVC.h"
#define kDropDownListTag 1000


@interface LeftDiagnoseInfo : NSObject
@property(strong,nonatomic)NSString *iconStr;
@property(strong,nonatomic)NSString *nameStr;
@property(strong,nonatomic)NSString *idStr;
@property(strong,nonatomic)NSMutableArray *dataArray;
@end

@implementation LeftDiagnoseInfo
@end

@interface RightDiagnoseInfo : NSObject
@property(strong,nonatomic)NSString *nameStr;
@property(strong,nonatomic)NSString *idStr;
@end

@implementation RightDiagnoseInfo
@end



@interface SHDiagnoseVC ()
{
    int selectIndex;
}
//疾病科室
//@property (nonatomic,strong) NSMutableArray *firstArray;
////疾病分类
//@property (nonatomic,strong) NSMutableArray *secondArray;
////字典 集合（疾病科室&疾病分类）
//@property (nonatomic,strong) NSMutableDictionary *menuDict;

@end

@implementation SHDiagnoseVC
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    selectIndex = 0;
    
    [self initView];
    
    [self initData];
    
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
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    titleImgV.text = @"自我诊断";
    [navView addSubview:titleImgV];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_right:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = 1000;
    [navView addSubview:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(278, 25 , 32, 32);
    [rightBtn setImage:[UIImage imageNamed:@"health_searchicon"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(bt_action_right:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 1001;
    [navView addSubview:rightBtn];
    
    
    
}
- (void)initView
{
    self.classArray  =[[NSMutableArray alloc] init];
    self.subjecArray=[[NSMutableArray alloc]initWithCapacity:0];
    
    
//    NSArray *array =[[NSMutableArray alloc]initWithObjects:@"anorectal",@"manke_7",@"miniao",@"ob-gyn",@"reproductive",@"skin-diseases", nil];
//    
//    
//    for (int i=0; i<array.count; i++) {
//        LeftDiagnoseInfo *info=[[LeftDiagnoseInfo alloc] init];
//        info.nameStr = [NSString stringWithFormat:@"分类%d",i ];
//        info.iconStr = array[i];
//        info.idStr = @"";
//        [self.classArray addObject:info];
//    }
    
    
    
    
    
    
    //左tableview
    self.leftTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, k_screenWidth/3., k_screenHeight-STAR_Y) style:UITableViewStylePlain];
//    self.leftTableView.frame=CGRectMake(0, 44, k_screenWidth/3., k_screenHeight-STAR_Y);
    self.leftTableView.delegate=self;
    self.leftTableView.dataSource=self;
    self.leftTableView.rowHeight=88;
    self.leftTableView.separatorInset = UIEdgeInsetsMake(0,10, 0, 10);
    self.leftTableView.separatorColor=[UIColor whiteColor];
    [self.view addSubview:self.leftTableView];
    
    //右tableview
    self.rightTableView=[[UITableView alloc]initWithFrame:CGRectMake(self.leftTableView.right,STAR_Y, k_screenWidth*2/3., k_screenHeight - STAR_Y ) style:UITableViewStylePlain];
    self.rightTableView.delegate=self;
    self.rightTableView.dataSource=self;
//    self.rightTableView.rowHeight=44;
//    self.rightTableView.separatorInset = UIEdgeInsetsMake(0,10, 0, 10);
//    self.rightTableView.separatorColor=[UIColor colorWithRed:97/255.0f green:193/255.0f blue:253/255.0f alpha:1];
    self.rightTableView.separatorColor= CLEAR_COLOR;
    [self.view addSubview:self.rightTableView];
    
    
}
#pragma  mark ---UItableViewCell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([tableView isEqual:self.leftTableView ]) {
        
        return self.classArray.count;
    }
    
    else if ([tableView isEqual:self.rightTableView])
        
    {
        return self.subjecArray.count;
    }
    
    return 0;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView isEqual:self.leftTableView])
    {
        static NSString *showUserInfoCellIdentifier = @"leftTableViewCell";
        leftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
        if (!cell) {
            cell = [[leftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
        }
        cell.backgroundColor=[UIColor colorWithRed:97/255.0f green:193/255.0f blue:253/255.0f alpha:1];
        
        LeftDiagnoseInfo *info=_classArray[indexPath.row];
        
        
        if ([info.iconStr hasPrefix:@"http://"]) {
            [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString: info.iconStr]];
        }else
            cell.iconImageView.image=[UIImage imageNamed:info.iconStr];
        
        cell.nameLab.text = info.nameStr;
        
        cell.selectionStyle=UITableViewCellSelectionStyleGray;
        return cell;
    }
    else if ([tableView isEqual:self.rightTableView])
    {
        
//        static NSString *showUserInfoCellIdentifier = @"rightTableViewCell";
//        rightTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
//        if (!cell1) {
//            cell1 = [[rightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
//            [cell1.downBtn addTarget:self action:@selector(ab_app_click:) forControlEvents:UIControlEventTouchUpInside];
//            [cell1.higherBtn addTarget:self action:@selector(ab_app_click:) forControlEvents:UIControlEventTouchUpInside];
//        }
//        cell1.selectionStyle=UITableViewCellSelectionStyleGray;
        
        static NSString *showUserInfoCellIdentifier = @"rightTableViewCell";
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
        if (!cell1) {
            cell1 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
            
            
            [cell1.textLabel setFont:[UIFont fontWithName:k_Font size:15]];
            //        cell1.selectionStyle=UITableViewCellSelectionStyleGray;
            
            UIImageView *line =[[UIImageView alloc] initWithFrame:CGRectMake(20, 43.5, k_screenWidth*2/3., 0.5)];
            line.tag= 1000;
            [cell1 addSubview:line];
            
        }
        
        RightDiagnoseInfo *info1= self.subjecArray[indexPath.row];
        cell1.textLabel.text = info1.nameStr;
        
        UIImageView *line=(UIImageView *)[cell1 viewWithTag:1000];
        line.backgroundColor = indexPath.row%2==0 ? UICOLOR_RGB(200, 200, 200) : UICOLOR_RGB(97, 193, 253);
        
        return cell1;
    }
    
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([tableView isEqual:self.leftTableView])
    {
        LeftDiagnoseInfo *info= self.classArray[indexPath.row];
        
        self.subjecArray =info.dataArray;
        
        selectIndex = (int)indexPath.row;
        
        
        //刷新列表
        [self.leftTableView reloadData];

        [self.rightTableView reloadData];
        
    }
    else if([tableView isEqual:self.rightTableView])
    {
        //跳转页面
//        SHDiagnoseDetailVC *vc=[[SHDiagnoseDetailVC alloc]init];
//        
//        [self.navigationController pushViewController:vc animated:YES];
        
        RightDiagnoseInfo *info = self.subjecArray[indexPath.row];
        
        [SHDiagnoseDetailVC gotoMySelf:self WithIDStr:info.idStr ];
    }
    
}


#pragma  mark ---data
- (void)initData
{
    if (_classArray == nil) {
        _classArray = [[NSMutableArray alloc]init];
    }
    if (_subjecArray == nil) {
        _subjecArray = [[NSMutableArray alloc]init];
    }

    
    
    [self requestFirstData];
}

#pragma mark 网络请求

-(void)requestFirstData
{
    [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    [AFHTTPClient postJSONPath:SHINTERFACE_selfDiagnoseList httpHost:sexHealthIP parameters:nil success:^(id responseObject) {
        
        NSDictionary *dic=[AFHTTPClient jsonTurnToDictionary:responseObject];
//        NSLog(@"自我诊断分类----%@----自我诊断一级分类",dic);
        
        if (dic[@"success"] && [dic[@"success"] intValue]==1) {
            
            self.classArray = [[NSMutableArray alloc] init];
            
            NSArray *array = dic[@"datasource"];
            
            for (int i=0; i<array.count; i++)
            {
                LeftDiagnoseInfo *info=[[LeftDiagnoseInfo alloc] init];
                //name
                info.nameStr = array[i][@"name"];
                
                //图片
                NSArray *iconArray =[[NSMutableArray alloc]initWithObjects:@"anorectal",@"manke_7",@"miniao",@"ob-gyn",@"reproductive",@"skin-diseases", nil];
                info.iconStr = i<iconArray.count ? iconArray[i] :iconArray[i/iconArray.count];
                info.idStr =array[i][@"id"];
                
                
                //二级的内容
                NSMutableArray *secondArray = [[NSMutableArray alloc] init];
                for (int j=0; j<[array[i][@"diseaseCategory"] count]; j++) {
                    
                    NSDictionary *dic=array[i][@"diseaseCategory"][j];
                    RightDiagnoseInfo *rightInfo=[[RightDiagnoseInfo alloc] init];
                    rightInfo.nameStr= dic[@"diseaseCategoryName"];
                    rightInfo.idStr = dic[@"diseaseCategoryId"];
                    [secondArray addObject:rightInfo];
                }
                info.dataArray = secondArray;
                
                if(i==0)
                {
                    self.subjecArray = [[NSMutableArray alloc] initWithArray:secondArray];
                }
                
                
                
                [self.classArray addObject:info];
                
            }
            
            
            
            
            [self.leftTableView reloadData];
            [self.rightTableView reloadData];
            
        }
        
        [MBHud removeFromView:self.view];
        
    } fail:^{
        
        
        [MBHud removeFromView:self.view];
    }];
}


#pragma  mark ---action 事件
- (void)bt_action_right:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if(index == 1001){
      [SHSearthVC gotoMySelf:self];
    }
    
}
- (void)bt_action_event:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        
    } else if(index == 1001) {
    
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UIView *subView in self.view.subviews)
    {
        if([subView isKindOfClass:[LMComBoxView class]])
        {
            LMComBoxView *combox = (LMComBoxView *)subView;
            if(combox.isOpen)
            {
                [UIView animateWithDuration:0.3 animations:^{
                    CGRect frame = combox.listTable.frame;
                    frame.size.height = 0;
                    [combox.listTable setFrame:frame];
                } completion:^(BOOL finished){
                    [combox.listTable removeFromSuperview];
                    combox.isOpen = NO;
                }];
            }
        }
    }
}
-(void)ab_app_click:(UIButton *)sender
{
    SHDiagnoseDetailVC *vc=[[SHDiagnoseDetailVC alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
#pragma mark ---- LMComBoxView Delegate
-(void)selectAtIndex:(int)index inCombox:(LMComBoxView *)_combox
{
    NSInteger tag = _combox.tag - kDropDownListTag;
    switch (tag) {
        case 0:
        {
            break;
        }
        case 1:
        {
            break;
        }
        case 2:
        {
            break;
        }
        default:
            break;
    }
}

#pragma  mark ---didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc
{
    if (pvc == nil) {
        return;
    }
    
    SHDiagnoseVC* vc = [[SHDiagnoseVC alloc]init];
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}
/*
     UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     leftBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH/2 - 0.5, APP_SPACE(35));
     leftBtn.backgroundColor = colorWithClear;
     leftBtn.tag = 1000;
     [leftBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:leftBtn];
     //
     UILabel *leftLalbel = [[UILabel alloc]init];
     leftLalbel.backgroundColor = colorWithClear;
     leftLalbel.textColor = colorWith01;
     leftLalbel.text = NSLocalizedString(@"疾病科室", nil);
     leftLalbel.font = Font_Large;
     CGSize size = [LYGlobalDefine getTextContent:leftLalbel.text withFont:leftLalbel.font];
     leftLalbel.frame = CGRectMake( (leftBtn.width - size.width)/2, (leftBtn.height - size.height)/2, size.width, size.height);
     [leftBtn addSubview:leftLalbel];
     //
     UIImage *image = [UIImage imageNamed:@"health_mark"];
     UIImageView *leftImageView = [[UIImageView alloc]init];
     leftImageView.backgroundColor = colorWithClear;
     leftImageView.frame = CGRectMake(leftBtn.width - image.size.width - APP_SPACE(2), leftBtn.height - image.size.height - APP_SPACE(2), image.size.width, image.size.height);
     leftImageView.image = image;
     [leftBtn addSubview:leftImageView];
     //分割线
     UIImageView *lineImageView = [UIImageView imageViewLineWithX:SCREEN_WIDTH/2 - 0.5 withY:APP_SPACE(2) withWidth:1 withHeight:APP_SPACE(31)];
     [self.view addSubview:lineImageView];
     //
     UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     rightBtn.frame = CGRectMake(SCREEN_WIDTH/2 + 0.5, 0, SCREEN_WIDTH/2 - 0.5, APP_SPACE(35));
     rightBtn.backgroundColor = colorWithClear;
     rightBtn.tag = 1001;
     [rightBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:rightBtn];
     //
     UILabel *rightLalbel = [[UILabel alloc]init];
     rightLalbel.backgroundColor = colorWithClear;
     rightLalbel.textColor = colorWith01;
     rightLalbel.text = NSLocalizedString(@"疾病分类", nil);
     rightLalbel.font = Font_Large;
     size = [LYGlobalDefine getTextContent:rightLalbel.text withFont:rightLalbel.font];
     rightLalbel.frame = CGRectMake((rightBtn.width - size.width)/2, (rightBtn.height - size.height)/2, size.width, size.height);
     [rightBtn addSubview:rightLalbel];
     //
     UIImageView *rightImageView = [[UIImageView alloc]init];
     rightImageView.backgroundColor = colorWithClear;
     rightImageView.frame = CGRectMake(rightBtn.width - image.size.width - APP_SPACE(2), rightBtn.height - image.size.height - APP_SPACE(2), image.size.width, image.size.height);
     rightImageView.image = image;
     [rightBtn addSubview:rightImageView];
     //分割线
     lineImageView = [UIImageView imageViewLineWithX:0 withY:APP_SPACE(35) withWidth:SCREEN_WIDTH withHeight:1];
     [self.view addSubview:lineImageView];
 */
@end
