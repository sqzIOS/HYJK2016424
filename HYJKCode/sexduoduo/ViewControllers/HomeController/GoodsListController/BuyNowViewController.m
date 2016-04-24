//
//  BuyNowViewController.m
//  sexduoduo
//
//  Created by sqz on 14-11-27.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//

#import "BuyNowViewController.h"
#import "BuyNowTableViewCell.h"
@interface BuyNowViewController ()

@end

@implementation BuyNowViewController

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
    // Do any additional setup after loading the view from its nib.
    
     [self setTopNavView];
    
    
    self.goodsArray = [NSMutableArray arrayWithCapacity:0];

    
    currentPage = 1;
    
    NSDictionary *params = [[NSDictionary alloc]init];
    
    params = @{@"pageSizeApp":@"10",@"pageApp":[NSString stringWithFormat:@"%d",currentPage],@"sortType":self.classifyStr};
    
    [self requestGoodListWithDic:params];
    
    
    self.promptLab = [[UILabel alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, 35)];
    self.promptLab.backgroundColor = [UIColor blackColor];
    self.promptLab.alpha = 0.0;
    self.promptLab.font = [UIFont systemFontOfSize:14.0];
    self.promptLab.textColor = [UIColor whiteColor];
    self.promptLab.textAlignment = NSTextAlignmentCenter;
}
//顶部NavView
-(void)setTopNavView
{
    int imgY = -20;
    if (IOS7_OR_LATER) {
        imgY = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, imgY,SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
    
    [navView addLeftBtnTarget:self action:@selector(toBackView) forControlEvents:UIControlEventTouchUpInside];
    
    [navView setTitleStr:@"限时抢购"];
    
    
 
}
//返回
-(void)toBackView
{
    if ([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
-(void)initGoodsTableView
{
    self.goodsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STAR_Y,self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height - STAR_Y - OFFSET_Y)];
    self.goodsTableView.dataSource = self;
    self.goodsTableView.delegate = self;
    if (IOS7_OR_LATER) {
        [self.goodsTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    self.goodsTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.goodsTableView];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    self.goodsTableView.tableFooterView = line;
    
    
//    if (self.isActivity) {
//        //        self.goodsTableView.tableHeaderView = self.headerView;
//        //        [self.headerImg setImage:[UIImage imageNamed:@"huodongBg.png"]];
//    }else//限时抢购
//    {
        self.headerView.frame=CGRectMake(0, 0, SCREEN_WIDTH, 76);
        self.goodsTableView.tableHeaderView = self.headerView;
        [self.headerImg setImage:[UIImage imageNamed:@"miaoshaBg.png"]];
        
//        //增加倒计时
        self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-110, 50, 110, 21)];
        self.countLabel.backgroundColor = [UIColor clearColor];
        self.countLabel.font = [UIFont systemFontOfSize:12.0];
        self.countLabel.textColor = [UIColor whiteColor];
        [self.headerImg addSubview:self.countLabel];
        [self timeCount];
//
//    }
    

    
    // 1.下拉刷新
    
    [self.goodsTableView addHeaderWithTarget:self action:@selector(headerRereshing)];

}

-(void)headerRereshing
{
    currentPage = 1;
    
    NSDictionary *params = [[NSDictionary alloc]init];
    
    params = @{@"pageSizeApp":@"10",@"pageApp":[NSString stringWithFormat:@"%d",currentPage],@"sortType":self.classifyStr};
    
    [self requestGoodListWithDic:params];
}
-(void)hearderRereshingEnd
{
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self.goodsTableView headerEndRefreshing];
}


//倒计时  服务器返回时间差-》倒计时时间
-(void)timeCount
{
    __block int timeout = [PublicMethod timeDistance24];//倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            //            dispatch_release(_timer);
            self.countDownStr = [NSString stringWithFormat:@"%d时%d分%d秒",0,0,0];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.countLabel.text = self.countDownStr;
                
                [self timeCount];
                
            });
            
        }else{
            //            int minutes = timeout / 60;
            //            int seconds = timeout % 60;
            //            NSString *strTime = [NSString stringWithFormat:@"%d分%.2d秒后重新获取验证码",minutes, seconds];
            int days = timeout/(60*60*24);
            int hours = timeout/(60*60)%24 + days * 24;
            int minutes = timeout /60%60;
            int seconds = timeout % 60;
            self.countDownStr = [NSString stringWithFormat:@"%d时%d分%d秒",hours,minutes, seconds];
            //            self.countDown--;
            //        [self.tableView reloadData];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.countLabel.text = self.countDownStr;
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}


#pragma mark MKHttpRequestAction  GoodsList
-(void)requestGoodListWithDic:(NSDictionary *)dic
{
    self.loadingView.frame = CGRectMake(0, STAR_Y, self.view.frame.size.width, self.view.frame.size.height);
    self.loadingView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loadingView];
    
    self.noNetView.hidden = YES;
    self.indicator.hidden = NO;
    //    _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_indicator setCenter:CGPointMake(self.view.center.x, self.view.center.y)];
    //    [self.loadingView addSubview:_indicator];
    [self.indicator startAnimating];
    
    //    self.noNetView = [[UIView alloc] initWithFrame:CGRectMake(48, 92, 224, 254)];
    //    [self.loadingView addSubview:self.noNetView];
    self.noNetView.hidden = YES;
    
    
    [[MKHttpServiceEngine shareMyInstance] requestHomeGoodListWithWithDic:dic completionHandler:^(id responseObject) {
        NSDictionary *responseDic = responseObject;
        NSLog(@"arrys-->%@",responseDic);
        
        if ([[responseDic objectForKey:@"success"] boolValue] == 1)
        {
            [self.goodsArray removeAllObjects];
            
            [self.goodsArray addObjectsFromArray:[responseDic objectForKey:@"datasource"]];
            
            if (!self.goodsTableView) {
                [self initGoodsTableView];
            }else
                [self.goodsTableView reloadData];
        }else
        {
            self.promptLab.text = [responseDic objectForKey:@"message"];
            [self showPromptLab];
            
            
            if (self.goodsTableView) {
                [self.goodsTableView removeFromSuperview];
            }
            
            
        }
        
        
        NSLog(@"arry-->%@",self.goodsArray);
        [self isDowmloadMore:[responseDic objectForKey:@"datasource"]];
        
        
        
        [self.indicator stopAnimating];
        [self.loadingView removeFromSuperview];
        self.loadingView = nil;
        
        [self hearderRereshingEnd];

    } errorHandler:^(NSError *error) {
        
        NSLog(@"error-->%@",error);
        [self.indicator stopAnimating];
        self.indicator.hidden = YES;
        self.noNetView.hidden = NO;
        
        [self hearderRereshingEnd];
    }];
    
}

-(void)requestGoodListMoreWithDic:(NSDictionary *)dic
{
    
    [[MKHttpServiceEngine shareMyInstance] requestHomeGoodListWithWithDic:dic completionHandler:^(id responseObject) {
        
        NSDictionary *responseDic = responseObject;
//        NSLog(@"arrys-->%@",responseDic);
        
        if ([[responseDic objectForKey:@"success"] boolValue] == 1) {
            if ([self.goodsArray containsObject:[[responseDic objectForKey:@"datasource"] firstObject]]) {
                //            [goodsDataArray removeObjectsInArray:[responseDic objectForKey:@"datasource"]];
                //            [goodsDataArray addObjectsFromArray:[responseDic objectForKey:@"datasource"]];
            }else
            {
                [self.goodsArray addObjectsFromArray:[responseDic objectForKey:@"datasource"]];
            }
            [self.goodsTableView reloadData];
        }
        
        
        [self isDowmloadMore:[responseDic objectForKey:@"datasource"]];
        
        
        
        
    } errorHandler:^(NSError *error) {
        
        NSLog(@"error-->%@",error);
        
        currentPage --;
        
    }];
    
}

-(void)isDowmloadMore:(NSArray *)arry
{
    __weak typeof(self) weakSelf = self;
    if ([arry count] > 9) {
        //        self.goodsTableView.showsInfiniteScrolling=YES;
        weakSelf.goodsTableView.infiniteScrollingView.enabled = YES;
        
        [self.goodsTableView addInfiniteScrollingWithActionHandler:^{
            [weakSelf getMoreData];
            [weakSelf.goodsTableView.infiniteScrollingView stopAnimating];
        }];
        
    }else
    {
        if (self.goodsTableView.infiniteScrollingView != nil) {
            //                [goodsTableView triggerInfiniteScrolling];
            weakSelf.goodsTableView.infiniteScrollingView.enabled = NO;
        }
        //        self.promptLab.text = @"无更多数据";
        //        [self showPromptLab];
        //        self.goodsTableView.showsInfiniteScrolling=NO;
    }
    
}
#pragma RefreshView  触底加载更多
-(void)getMoreData
{
    currentPage ++;
    
    NSDictionary *params = [[NSDictionary alloc]init];
    
    params = @{@"pageSizeApp":@"10",@"pageApp":[NSString stringWithFormat:@"%d",currentPage],@"sortType":self.classifyStr};
    
    [self requestGoodListMoreWithDic:params];
}
//显示提示
-(void)showPromptLab
{
    [self.view addSubview:self.promptLab];
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{self.promptLab.alpha = 0.6;} completion:nil];
    [self performSelector:@selector(dismissPromptLab) withObject:nil afterDelay:0.0];
}
//提示消失
-(void)dismissPromptLab
{
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{self.promptLab.alpha = 0.0;} completion:^(BOOL finished) {
        [self.promptLab removeFromSuperview];
    }];
    
    
}
//重新加载按钮
- (IBAction)refreshDataAgain:(id)sender {
    
    currentPage = 1;
    
    NSDictionary *params = [[NSDictionary alloc]init];
    
    params = @{@"pageSizeApp":@"10",@"pageApp":[NSString stringWithFormat:@"%d",currentPage],@"sortType":self.classifyStr};
    
    [self requestGoodListWithDic:params];
}

#pragma mark- tableView detegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
    
    //    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goodsArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 163;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 45)];
    
    
    
    
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"BuyNowTableViewCell";
    BuyNowTableViewCell *cell = (BuyNowTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BuyNowTableViewCell" owner:self options:nil] lastObject];
    }
    cell.backgroundColor = [UIColor whiteColor];
    
//    NSDictionary *dic = [self.goodsArray objectAtIndex:indexPath.row];
//    cell.nameLab.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"name"]];
//    cell.nowPriceLab.text = [NSString stringWithFormat:@"￥%@",[dic objectForKey:@"goods_price"]];
//    [cell.goodImageView sd_setImageWithURL:[PublicMethod imgWithUrl:[NSString stringWithFormat:@"%@",[dic objectForKey:@"SourceImagePath"]]] placeholderImage:[UIImage imageNamed:@"bg.png"]];
    
    [cell configCellWithArray:self.goodsArray indexRow:(int)indexPath.row];
    
    
    
    
    
    return cell;
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    GoodsDetailTwoViewController *ctrVc = [[GoodsDetailTwoViewController alloc] initWithNibName:@"GoodsDetailTwoViewController" bundle:nil];
    ctrVc.hidesBottomBarWhenPushed = YES;
    ctrVc.goodsIdStr = [[self.goodsArray objectAtIndex:indexPath.row] objectForKey:@"id"];
    ctrVc.classifyIdStr = [[self.goodsArray objectAtIndex:indexPath.row] objectForKey:@"goodsCategoryId"];
    [self.navigationController pushViewController:ctrVc animated:YES];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
