//
//  SHCopeVC.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHCopeVC.h"
#import "SHCopeTableView.h"
#import "SHSearthVC.h"
#import "SHCopeModel.h"
#import "MBHud.h"


@interface SHCopeVC ()

@property (nonatomic,strong) SHCopeModel *model;
@property (nonatomic,strong) NSMutableArray *tvData;
@property (nonatomic,strong) SHCopeTableView *tableView;

@end

@implementation SHCopeVC
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
    //导航
    [self setTitleStr:@"科普知识"];
    //右上角按钮
    if(self.copeType == 1)
    {
        self.rightBtn.hidden = NO;
    }
    [self.rightBtn setImage:UIImageByName(@"health_searchicon") forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(bt_action_right:) forControlEvents:UIControlEventTouchUpInside];

    
    [self initView];
    
    [self initData];
    
}

#pragma mark ---UI

- (void)initView
{
    CGRect frame = CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT-STAR_Y);
    self.tableView = [[SHCopeTableView alloc]initWithCopeTableViewWithFrame:frame withVC:self];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    
    // 1.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    
}

#pragma mark ---Data
- (void)initData
{
    if (_tvData == nil) {
        _tvData = [[NSMutableArray alloc]init];
    }
//    _model = [SHCopeModel loadLocalDataForCopeModel];
//    if (_model && _model.datasource && _model.datasource.count > 0) {
//        [self handleRemoteDataForCope:_model];
//    }
    //    if (!_docModel.hadload) {
    //        [self requestRemoteData:_docModel type:0];
    //    }

    if (self.copeType == searchType) {
        [self requestSearchList];
    }else if (self.copeType == normalType)
    {
        [self requestListData];
    }
    
}
#pragma mark ---数据处理
-(void)handleRemoteDataForCope:(SHCopeModel*)model
{
    [_tvData removeAllObjects];
    [_tvData addObjectsFromArray:model.datasource];
    self.tableView.tvData = _tvData;
}

/**
 远程读取数据
 type:0表示正常请求,1表示下拉,2表示上拉
 **/
-(void)requestRemoteDataForCope:(SHCopeModel*)reqModel type:(NSUInteger)type
{
    if (type == 0) {
        [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    }
    BOOL flag = NO;
    if (type == 0 || type == 1) {
        flag = YES;
    }
    [SHCopeModel loadRemoteDataForCopeModel:reqModel flag:flag cb:^(BOOL isOK, SHCopeModel *model) {
        if (isOK) {
            [self handleRemoteDataForCope:model];
        }
        if (type == 0) {
            [MBHud removeFromView:self.view];
        } else if (type == 1) {
           
        } else if (type == 2) {
            
        }
    }];
}

#pragma mark --didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --action 事件
- (void)bt_action_right:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if(index == 1001) {
        [SHSearthVC gotoMySelf:self];
    }
    
}


-(void)headerRereshing
{
    [self performSelector:@selector(hearderRereshingEnd) withObject:nil afterDelay:0.2];
}
-(void)footerRereshing
{
     [self performSelector:@selector(footRereshingEnd) withObject:nil afterDelay:0.2];
}
-(void)hearderRereshingEnd
{
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self.tableView headerEndRefreshing];
}
-(void)footRereshingEnd
{
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self.tableView footerEndRefreshing];
}

#pragma mark - 网络请求
#pragma mark 正常网址
-(void)requestListData
{
    [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    
        NSDictionary *dic=@{@"pageSizeApp":@"10",@"pageApp":@"1"};
    
        [AFHTTPClient postJSONPath:SHINTERFACE_knowledgeList httpHost:sexHealthIP parameters:dic success:^(id responseObject) {
    
            if (responseObject) {
                
                //可以直接用 responseObject 也可以使用字符串operation.responseString
                NSString *str=[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                
                //可以对字符串 提前做些处理 比如删除换行符 之类的
                NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
                
                
                 NSDictionary* dictResponse = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
                
                 NSLog(@"科普知识列表 = %@ -->科普知识列表 ",dictResponse);
                
                
                
                
                if(dictResponse[@"success"] && [dictResponse[@"success"] integerValue]==1)
                {
                    self.listArray = [[NSMutableArray alloc] init];
                    NSArray *listArr= [[NSMutableArray alloc] initWithArray:dictResponse[@"datasource"]];
                    
                    
                    for (int i=0; i<listArr.count; i++) {
                        
                        SHCopeInfo *info = [[SHCopeInfo alloc]init];
                        info.iconStr = [NSString stringWithFormat:@"%@",listArr[i][@"icon"]] ;
                        info.titleStr = [NSString stringWithFormat:@"%@",listArr[i][@"title"]];
                        info.contentStr = [NSString stringWithFormat:@"%@",listArr[i][@"description"]];
                        info.timeStr =[NSString stringWithFormat:@"%@",listArr[i][@"createDate"]] ;
                        info.idStr = [NSString stringWithFormat:@"%@",listArr[i][@"id"]];
                        [self.listArray addObject:info];
                        
                        
                    }
                    
                    [self.tableView setTvData:self.listArray];
                }
            }
    
            [MBHud removeFromView:self.view];
            
        } fail:^{
            
            [MBHud removeFromView:self.view];
            
        }];
}

-(void)requestSearchList
{
    [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    
    NSDictionary *dic=@{@"pageSizeApp":@"10",@"pageApp":@"1",
                        @"key":self.searchKeywords
                        };
    
    [AFHTTPClient postJSONPath:SHINTERFACE_knowledgeSearch httpHost:sexHealthIP parameters:dic success:^(id responseObject) {
        
        if (responseObject) {
            
            //可以直接用 responseObject 也可以使用字符串operation.responseString
            NSString *str=[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            //可以对字符串 提前做些处理 比如删除换行符 之类的
            NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
            
            
            NSDictionary* dictResponse = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
            
            NSLog(@"科普知识列表 = %@ -->科普知识列表 ",dictResponse);
        
            
            if(dictResponse[@"success"] && [dictResponse[@"success"] integerValue]==1)
            {
                self.listArray = [[NSMutableArray alloc] init];
                NSArray *listArr= [[NSMutableArray alloc] initWithArray:dictResponse[@"datasource"]];
                
                
                for (int i=0; i<listArr.count; i++) {
                    
                    SHCopeInfo *info = [[SHCopeInfo alloc]init];
                    info.iconStr = [NSString stringWithFormat:@"%@",listArr[i][@"icon"]] ;
                    info.titleStr = [NSString stringWithFormat:@"%@",listArr[i][@"title"]];
                    info.contentStr = [NSString stringWithFormat:@"%@",listArr[i][@"description"]];
                    info.timeStr =[NSString stringWithFormat:@"%@",listArr[i][@"createDate"]] ;
                    info.idStr = [NSString stringWithFormat:@"%@",listArr[i][@"id"]];
                    [self.listArray addObject:info];
                    
                    
                }
                
                [self.tableView setTvData:self.listArray];
            }
        }
        
        [MBHud removeFromView:self.view];
        
    } fail:^{
        
        [MBHud removeFromView:self.view];
        
    }];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc withType:(theCopeVCType)type andObject:(id)object;
{
    if (pvc == nil) {
        return;
    }
    SHCopeVC* vc = [[SHCopeVC alloc]init];
    vc.copeType = type;
    if (type == searchType) {
        vc.searchKeywords = object;
    }
    
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}

@end
