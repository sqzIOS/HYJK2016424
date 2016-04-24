//
//  SHSearthVC.m
//  SexHealth
//
//  Created by ly1992 on 15/7/1.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHSearthVC.h"
#import "SHSearchModel.h"
#import "DoAlertView.h"
#import "SHCopeVC.h"
@interface SHSearthVC ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *searchText;
//搜索历史
@property (nonatomic,strong) UIView *historyView;
@property (nonatomic,strong) NSMutableArray *historyData;
//热门搜索
@property (nonatomic,strong) UIView *hotView;
@property (nonatomic,strong) NSMutableArray *hotData;

@end

@implementation SHSearthVC
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitleStr:@"搜索"];
    
    
    [self initView];
    
    [self initData];
    
}
#pragma mark ---UI

- (void)initView
{
//    self.scrollView.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tagGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tag_event)];
//    [self.scrollView addGestureRecognizer:tagGesture];
    
    self.scrollView.frame =  CGRectMake(0, STAR_Y, k_screenWidth, k_screenHeight - STAR_Y);
    
    
    
    //搜索外边框
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.frame = CGRectMake(APP_SPACE(30), 0, SCREEN_WIDTH - APP_SPACE(60), APP_SPACE(30));
    bgImageView.backgroundColor = colorWithLYWhite;
    bgImageView.layer.cornerRadius = 4.0;
    bgImageView.layer.borderColor = RGBCOLOR16(0xbfbfbf).CGColor;
    bgImageView.layer.borderWidth = 1.0;
    [self.scrollView addSubview:bgImageView];
    
    //搜索输入框
    self.searchText = [[UITextField alloc] initWithFrame:CGRectMake(APP_SPACE(5), APP_SPACE(5), bgImageView.width - APP_SPACE(10),  APP_SPACE(20))];
    self.searchText.placeholder = @"请输入搜索内容";
    self.searchText.delegate = self;
    [self.searchText setReturnKeyType:UIReturnKeySearch];
    self.searchText.font = [UIFont systemFontOfSize:14.0];
    self.searchText.backgroundColor = [UIColor clearColor];
    //    if([self.searchText respondsToSelector:@selector(setTintColor:)])
    //    {
    //        self.searchText.tintColor = colorWith01;
    //    }
//    [self.searchText becomeFirstResponder];
    
    [bgImageView addSubview:self.searchText];
    //搜索图标
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.backgroundColor = [UIColor clearColor];
    searchBtn.frame = CGRectMake(bgImageView.width - APP_SPACE(30), APP_SPACE(2), APP_SPACE(25), APP_SPACE(25));
    [searchBtn setImage:[UIImage imageNamed:@"health_searth"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(bt_ation_event:) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.tag = 1000;
    bgImageView.userInteractionEnabled = YES;
    [bgImageView addSubview:searchBtn];
    //
    //内容
    _historyView = [[UIView alloc]initWithFrame:CGRectMake(0, bgImageView.bottom + APP_SPACE(10), SCREEN_WIDTH, APP_SPACE(30))];
    _historyView.backgroundColor = colorWithClear;
    [self.scrollView addSubview:_historyView];
    //分割线
    UIImageView *lineImageView = [UIImageView imageViewLineWithX:0 withY:0 withWidth:SCREEN_WIDTH withHeight:1];
    [_historyView addSubview:lineImageView];
    //搜索历史
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = Font_Middle;
    label.textColor = colorWith02;
    label.text = NSLocalizedString(@"搜索历史", nil);
    CGSize size = [LYGlobalDefine getTextContent:label.text withFont:label.font];
    label.frame = CGRectMake(APP_SPACE(10), lineImageView.bottom + APP_SPACE(10), size.width, size.height);
    [_historyView addSubview:label];
    //删除按钮
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteBtn.backgroundColor = [UIColor clearColor];
    deleteBtn.frame = CGRectMake(SCREEN_WIDTH - APP_SPACE(45), label.top, APP_SPACE(25), APP_SPACE(25));
    [deleteBtn setImage:[UIImage imageNamed:@"health_rubbish"] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(bt_ation_event:) forControlEvents:UIControlEventTouchUpInside];
    deleteBtn.tag = 1001;
    [_historyView addSubview:deleteBtn];
    
    //内容
    _hotView = [[UIView alloc]initWithFrame:CGRectMake(0, _historyView.bottom, SCREEN_WIDTH, APP_SPACE(30))];
    _hotView.backgroundColor = colorWithClear;
    [self.scrollView addSubview:_hotView];
    //分割线
    lineImageView = [UIImageView imageViewLineWithX:0 withY:0 withWidth:SCREEN_WIDTH withHeight:1];
    [_hotView addSubview:lineImageView];
    //热门搜索
    label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = Font_Middle;
    label.textColor = colorWith02;
    label.text = NSLocalizedString(@"热门搜索", nil);
    size = [LYGlobalDefine getTextContent:label.text withFont:label.font];
    label.frame = CGRectMake(APP_SPACE(10), lineImageView.bottom + APP_SPACE(10), size.width, size.height);
    [_hotView addSubview:label];
    //
    self.scrollView.contentSize = CGSizeMake(0, _hotView.bottom);
}

- (void)refreshView
{
    NSArray *subViewArray=[_historyView subviews];
    
    for (int i=0; i<subViewArray.count; i++) {
        UIView *view= subViewArray[i];
        
        if (view.tag >=2000) {
            [view removeFromSuperview];
        }
    }
 
    
    
    
    NSInteger lastWidth = APP_SPACE(30);
    NSInteger lastHeight = APP_SPACE(40);
    for (int i = 0; i < _historyData.count; i++) {
        NSString *historyStr = [_historyData[i] objectForKey:@"searchHistory"];
        if ([NSString isBlankString:historyStr]) {
            continue;
        }
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.backgroundColor = [UIColor clearColor];
        bt.layer.borderColor = colorWith04.CGColor;
        bt.layer.borderWidth = 1.0f;
        bt.layer.cornerRadius = 6.0f;
        bt.layer.masksToBounds = YES;
        bt.titleLabel.font = Font_Small;
        [bt setTitle:historyStr forState:UIControlStateNormal];
        [bt setTitleColor:colorWith04 forState:UIControlStateNormal];
        CGSize size = [LYGlobalDefine getTextContent:bt.titleLabel.text withFont:bt.titleLabel.font];
        if ((size.width + APP_SPACE(10)) > (SCREEN_WIDTH - APP_SPACE(60) - lastWidth)) {
            lastWidth = APP_SPACE(30);
            lastHeight += (size.height + APP_SPACE(20));
        }
        bt.frame = CGRectMake(lastWidth, lastHeight, size.width + APP_SPACE(10), size.height + APP_SPACE(10));
        lastWidth = bt.right + APP_SPACE(10);
        [bt addTarget:self action:@selector(bt_ation_historyEvent:) forControlEvents:UIControlEventTouchUpInside];
        bt.tag = 2000 + i;
        [_historyView addSubview:bt];
    }
    _historyView.height = lastHeight + APP_SPACE(40);
    
    //热门搜索的 top改变
    _hotView.top = _historyView.bottom;
    
    
    {
        NSArray *subViewArray=[_hotView subviews];
        
        for (int i=0; i<subViewArray.count; i++) {
            UIView *view= subViewArray[i];
            
            if (view.tag >=3000) {
                [view removeFromSuperview];
            }
        }
        
        
        
        NSInteger lastWidth = APP_SPACE(30);
        NSInteger lastHeight = APP_SPACE(40);
        for (int i = 0; i < _hotData.count; i++) {
            NSString *historyStr = [_hotData[i] objectForKey:@"hostKey"];
            if ([NSString isBlankString:historyStr]) {
                continue;
            }
            UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
            bt.backgroundColor = [UIColor clearColor];
            bt.layer.borderColor = colorWith04.CGColor;
            bt.layer.borderWidth = 1.0f;
            bt.layer.cornerRadius = 6.0f;
            bt.layer.masksToBounds = YES;
            bt.titleLabel.font = Font_Small;
            [bt setTitle:historyStr forState:UIControlStateNormal];
            [bt setTitleColor:colorWith04 forState:UIControlStateNormal];
            CGSize size = [LYGlobalDefine getTextContent:bt.titleLabel.text withFont:bt.titleLabel.font];
            if ((size.width + APP_SPACE(10)) > (SCREEN_WIDTH - APP_SPACE(60) - lastWidth)) {
                lastWidth = APP_SPACE(30);
                lastHeight += (size.height + APP_SPACE(20));
            }
            bt.frame = CGRectMake(lastWidth, lastHeight, size.width + APP_SPACE(10), size.height + APP_SPACE(10));
            lastWidth = bt.right + APP_SPACE(10);
            [bt addTarget:self action:@selector(bt_ation_hotEvent:) forControlEvents:UIControlEventTouchUpInside];
            bt.tag = 3000 + i;
            [_hotView addSubview:bt];
        }
        _hotView.height = lastHeight + APP_SPACE(40);

        
    }
    
    self.scrollView.contentSize = CGSizeMake(0, _hotView.bottom);
    
}

#pragma mark ---initData
- (void)initData
{
    if (_historyData == nil) {
        _historyData = [[NSMutableArray alloc]init];
    }
    if (_hotData == nil) {
        _hotData = [[NSMutableArray alloc]init];
    
    }
    [self refreshData];
    
    [self requestListData];
}
- (void)refreshData
{
    //保存数据
    NSMutableArray *historyArr = [NSMutableArray arrayWithArray:[[SHSearchSet shareInstance] historyArray]];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setObject:self.searchText.text forKey:@"searchHistory"];
    if (![historyArr containsObject:dic]) {
        [historyArr addObject:dic];
        [[SHSearchSet shareInstance] setHistoryArray:historyArr];
        [[SHSearchSet shareInstance] saveHistorySearchData];
    }
    //读取数据
    NSMutableArray *array = [NSMutableArray arrayWithArray:[[SHSearchSet shareInstance] historyArray]];
    [self.historyData removeAllObjects];
    self.historyData =(NSMutableArray *)[[array reverseObjectEnumerator] allObjects];
    
    
    
    
    [self refreshView];
}

#pragma mark ---action 事件
- (void)bt_action_right
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bt_ation_event:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        if ([NSString isBlankString:_searchText.text]) {
            return;
        }
        [self refreshData];
        
        //跳搜索知识列表
        [SHCopeVC gotoMySelf:self withType:searchType andObject:_searchText.text];
        
        [self.searchText resignFirstResponder];
        
    } else if (index == 1001) {
        if (_historyData.count <= 0) {
            return;
        }
        [DoAlertView showWithTitle:nil message:NSLocalizedString(@"确定删除所有搜索历史", nil) stryes:NSLocalizedString(@"确定", nil) strno:NSLocalizedString(@"取消", nil) yes:^(DoAlertView *alertView) {
            [self.historyData removeAllObjects];
            NSMutableArray *historyArr = (NSMutableArray *)[[self.historyData  reverseObjectEnumerator] allObjects];
            [[SHSearchSet shareInstance] setHistoryArray:historyArr];
            [[SHSearchSet shareInstance] saveHistorySearchData];
            
            [self refreshData];
            [self.searchText resignFirstResponder];
        } no:^(DoAlertView *alertView) {
            [self.searchText resignFirstResponder];
            return;
        }];
    }
}
- (void)bt_ation_historyEvent:(UIButton*)sender
{
    
    
    NSInteger index = sender.tag;
    NSString *historyStr = [_historyData[index - 2000] objectForKey:@"searchHistory"];
    NSLog(@"%@", historyStr);
    
    [SHCopeVC gotoMySelf:self withType:searchType andObject:historyStr];
    
    [self.searchText resignFirstResponder];
    
}


- (void)bt_ation_hotEvent:(UIButton*)sender
{
    
    NSInteger index = sender.tag;
    NSString *historyStr = [_hotData[index - 3000] objectForKey:@"hostKey"];
    [SHCopeVC gotoMySelf:self withType:searchType andObject:historyStr];
    
    [self.searchText resignFirstResponder];
    
}


#pragma mark ---TextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self refreshData];
    
    [SHCopeVC gotoMySelf:self withType:searchType andObject:textField.text];
    
    [self.searchText resignFirstResponder];
    return YES;
}
#pragma mark ---UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.searchText resignFirstResponder];
}

#pragma mark - 网络请求

-(void)requestListData
{
    [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    
    
    [AFHTTPClient postJSONPath:SHINTERFACE_knowledgeSearchPage httpHost:sexHealthIP parameters:nil success:^(id responseObject) {
        
        if (responseObject) {
            
            //可以直接用 responseObject 也可以使用字符串operation.responseString
            NSString *str=[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    
            //可以对字符串 提前做些处理 比如删除换行符 之类的
            NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
            NSDictionary* dictResponse = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
            
            NSLog(@"热门搜索 = %@ -->热门搜索 ",dictResponse);
            
            if(dictResponse[@"success"] && [dictResponse[@"success"] integerValue]==1)
            {
                _hotData = [[NSMutableArray alloc] initWithArray:dictResponse[@"datasource"]];
                
                [self refreshView];
            }
        }
        
        [MBHud removeFromView:self.view];
        
    } fail:^{
        
        [MBHud removeFromView:self.view];
        
    }];
}





#pragma mark ---didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc
{
    if (pvc == nil) {
        return;
    }
    SHSearthVC* vc = [[SHSearthVC alloc]init];
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}

@end
