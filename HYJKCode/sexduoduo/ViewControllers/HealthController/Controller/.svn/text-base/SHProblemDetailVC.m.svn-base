//
//  SHProblemDetailVC.m
//  SexHealth
//
//  Created by ly1992 on 15/7/1.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHProblemDetailVC.h"
#import "SHProblemDetailHeaderView.h"
#import "SHProblemDetailCell.h"
#import "SHCommentModel.h"
#import "HPGrowingTextView.h"
#import "MBHud.h"

@interface SHProblemDetailVC ()<HPGrowingTextViewDelegate>

@property (strong,nonatomic)SHProblemDetailHeaderView *headerView;
//评论Model 对象
@property (strong,nonatomic) SHCommentModel *commentModel;
//评论数组
@property (strong,nonatomic)NSMutableArray *tvData;
//评论输入框背景
@property (strong,nonatomic)UIView *bottomView;
//评论输入框
@property(strong,nonatomic)HPGrowingTextView* textView;

@end

@implementation SHProblemDetailVC
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
    
    [self initView];
    
    [self initData];
    
    [self setTopNavView];
}

#pragma mark ---UI
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.text = @"问题详情";
    [navView addSubview:titleImgV];
    
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_right) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
}
- (void)initView
{
    //
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.height = SCREEN_HEIGHT - APP_SPACE(52);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //
    CGFloat height = [SHProblemDetailHeaderView getDetailHeaderViewHeightWithModel:_model];
    _headerView = [[SHProblemDetailHeaderView alloc]init];
    _headerView.backgroundColor = [UIColor clearColor];
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    self.tableView.tableHeaderView = _headerView;
    [_headerView refreshDataWithModel:_model];
    //
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - APP_SPACE(50) - APP_SPACE(74), SCREEN_WIDTH, APP_SPACE(50))];
        _bottomView.backgroundColor = colorWith05;
        [self.view addSubview:_bottomView];
        //回复
        UIButton *replyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        replyBtn.backgroundColor = colorWithLYWhite;
        replyBtn.frame = CGRectMake(SCREEN_WIDTH - APP_SPACE(80), APP_SPACE(5), APP_SPACE(70), APP_SPACE(40));
        replyBtn.layer.cornerRadius = 4.0f;
        replyBtn.layer.masksToBounds = YES;
        replyBtn.layer.borderWidth = 1.0f;
        replyBtn.layer.borderColor = colorWith05.CGColor;
        replyBtn.titleLabel.font = Font_Middle;
        [replyBtn setTitle:NSLocalizedString(@"回复", nil) forState:UIControlStateNormal];
        [replyBtn setTitleColor:colorWith01 forState:UIControlStateNormal];
        [replyBtn addTarget:self action:@selector(bt_acton_event:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:replyBtn];
        //
        self.textView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(APP_SPACE(10), APP_SPACE(5), replyBtn.left - APP_SPACE(20), APP_SPACE(30))];
        _textView.layer.cornerRadius = 4;
        _textView.layer.masksToBounds = YES;
        _textView.layer.borderColor = colorWith05.CGColor;
        _textView.layer.borderWidth = 1.0f;
        _textView.isScrollable = YES;
        _textView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
        _textView.minNumberOfLines = 1;
        _textView.maxNumberOfLines = 4;
        _textView.returnKeyType = UIReturnKeyDefault;
        _textView.font = Font_Middle;
        _textView.delegate = self;
        _textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.placeholder = NSLocalizedString(@"说点什么!", nil);
        [_bottomView addSubview:_textView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    }
}

#pragma mark ---data
- (void)initData
{
    if (_tvData == nil) {
        _tvData = [[NSMutableArray alloc]init];
    }
    _commentModel = [SHCommentModel loadLocalDataForCommentModel];
    if (_commentModel && _commentModel.datasource && _commentModel.datasource.count > 0) {
        [self handleRemoteDataForComment:_commentModel];
    }
//    if (!_docModel.hadload) {
//        [self requestRemoteData:_docModel type:0];
//    }

}
#pragma mark ---数据处理
-(void)handleRemoteDataForComment:(SHCommentModel*)model
{
    [_tvData removeAllObjects];
    [_tvData addObjectsFromArray:model.datasource];
    [self.tableView reloadData];
}

/**
 远程读取数据
 type:0表示正常请求,1表示下拉,2表示上拉
 **/
-(void)requestRemoteDataForComment:(SHCommentModel*)reqModel type:(NSUInteger)type
{
    if (type == 0) {
        [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    }
    BOOL flag = NO;
    if (type == 0 || type == 1) {
        flag = YES;
    }
    [SHCommentModel loadRemoteDataForCommentModel:reqModel flag:flag cb:^(BOOL isOK, SHCommentModel *model) {
        if (isOK) {
            [self handleRemoteDataForComment:model];
        }
        if (type == 0) {
            [MBHud removeFromView:self.view];
        } else if (type == 1) {
            
        } else if (type == 2) {
           
        }
    }];
}

#pragma mark ---action 事件
- (void)bt_action_right
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bt_acton_event:(UIButton*)sender
{
    NSLog(@"回复");
    _textView.text = nil;
    
}


#pragma mark ---TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tvData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showUserInfoCellIdentifier = @"SHProblemDetailCell";
    SHProblemDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell) {
        cell = [[SHProblemDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
    }
    SHCommentInfo *info = _tvData[indexPath.row];
    [cell initTableCellModel:info];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHCommentInfo *info = _tvData[indexPath.row];
    return [SHProblemDetailCell getTableViewCellModel:info];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    [_textView resignFirstResponder];
}
#pragma mark ---HPGrowingTextView delegate----
-(void)growingTextViewDidBeginEditing:(HPGrowingTextView *)growingTextView
{
    
}
-(void)growingTextViewDidEndEditing:(HPGrowingTextView *)growingTextView
{
    _bottomView.frame = CGRectMake(0, SCREEN_HEIGHT - APP_SPACE(74) - _bottomView.height, _bottomView.width, growingTextView.height + APP_SPACE(10));
}
- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    CGFloat diff = growingTextView.height - height;
    CGRect r = _bottomView.frame;
    r.size.height -= diff;
    r.origin.y += diff;
    _bottomView.frame = r;
    
}

#pragma mark ---keyboard notification---
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary* info = [notification userInfo];
    CGSize keyBoardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:0.3 animations:^{
        _bottomView.origin = CGPointMake(0, _bottomView.top - keyBoardSize.height);
    }];
}
#pragma mark ---didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc withModel:(SHHistoryInfo*)model
{
    if (pvc == nil || model == nil) {
        return;
    }
    SHProblemDetailVC* vc = [[SHProblemDetailVC alloc]init];
    vc.model = model;
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}

@end
