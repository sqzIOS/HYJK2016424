//
//  SHCopeDetailVC.m
//  sexduoduo
//
//  Created by shown on 15/8/31.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHCopeDetailVC.h"



@interface SHCopeDetailInfo : NSObject

@property (strong, nonatomic) NSString *contentStr;//文字内容
@property (strong, nonatomic) NSString *createDateStr;//创建时间
@property (strong, nonatomic) NSString *guideImgStr;//图片地址
@property (strong, nonatomic) NSString *iconStr;
@property (strong, nonatomic) NSString *idStr;
@property (strong, nonatomic) NSString *titleStr;//文章标题

@end

@implementation SHCopeDetailInfo

@end



@interface SHCopeDetailVC ()
@property (strong, nonatomic) SHCopeDetailInfo * detailInfo;
@property (strong, nonatomic) UIScrollView *mainSCView ;
@end


@implementation SHCopeDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleStr:@"知识详情"];
    
    self.view.backgroundColor = WHITE_COLOR;
    
    [self reqeustInfo];
}


#pragma mark --action 事件
- (void)bt_action_right:(UIButton*)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

#pragma mark ---UI

-(void)initContentViewAfterGetInfo
{
    _mainSCView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, STAR_Y, k_screenWidth, k_screenHeight-STAR_Y)];
    
    [self.view addSubview:_mainSCView];
    
    //1标题
    UILabel *titleLab=[[UILabel alloc] initWithFrame:CGRectMake(5, 15, k_screenWidth-10, 35)];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = colorWith02;
    titleLab.font = [UIFont fontWithName:k_Font size:18];
    [_mainSCView addSubview:titleLab];
    
    titleLab.numberOfLines = 0;
    titleLab.text = _detailInfo.titleStr;
    CGSize titileSize = [NSString getTextMultilineContent:_detailInfo.titleStr withFont:titleLab.font withSize:CGSizeMake(k_screenWidth-10, 100)];
    titleLab.frame = CGRectMake(5, titleLab.top, titleLab.width, titileSize.height);
    
    //3文字
    UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(5 , titleLab.bottom+25 + 144, k_screenWidth-10, 40)];
    contentLab.numberOfLines = 0;
    contentLab.text = _detailInfo.contentStr;
    contentLab.textColor = colorWith03;
    contentLab.font = [UIFont fontWithName:k_Font size:15];
    [_mainSCView addSubview:contentLab];
    
    CGSize size=[NSString getTextMultilineContent:_detailInfo.contentStr withFont:contentLab.font withSize:CGSizeMake(contentLab.width, 10000)];
    contentLab.frame = CGRectMake(5, 144, contentLab.width, size.height);
    
    
    
    
    _mainSCView.contentSize = CGSizeMake(k_screenWidth, contentLab.bottom);
    
    //2图片
    QzImageView *imageView = [[QzImageView alloc] initWithFrame:CGRectMake(5, titleLab.bottom +10, k_screenWidth - 10, 144)];
    if ([_detailInfo.guideImgStr isEqualToString:@"<null>"] || [_detailInfo.guideImgStr isKindOfClass:[NSNull class]]) {
        
        contentLab.frame = CGRectMake(5, titleLab.bottom +10, k_screenWidth-10, contentLab.height);
        _mainSCView.contentSize = CGSizeMake(k_screenWidth, contentLab.bottom);
        
        return;
    }
    
    [imageView qzSetImageWithURL:[NSURL URLWithString:_detailInfo.guideImgStr] placeholderImage:nil
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
                           
         CGSize size=image.size;
         imageView.frame = CGRectMake(5, imageView.top, k_screenWidth-10, (k_screenWidth-10)*size.height/size.width);
         contentLab.frame = CGRectMake(5, imageView.bottom, k_screenWidth-10, contentLab.height);
         
         _mainSCView.contentSize = CGSizeMake(k_screenWidth, contentLab.bottom);

         NSLog(@"--%@---",contentLab.text);
    }];
    [_mainSCView addSubview:imageView];
    
    
}

#pragma mark - 网络请求
-(void)reqeustInfo
{
    [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    
    NSDictionary *dic=@{
                        @"id":self.idStr
                        };
    
    [AFHTTPClient postJSONPath:SHINTERFACE_knowledgeDetail httpHost:sexHealthIP parameters:dic success:^(id responseObject) {
        
        if (responseObject) {
            
            //可以直接用 responseObject 也可以使用字符串operation.responseString
            NSString *str=[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            //可以对字符串 提前做些处理 比如删除换行符 之类的
            NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
            
            
            NSDictionary* dictResponse = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
            
            NSLog(@"科普知识详情 = %@ -->科普知识详情 ",dictResponse);
            
            
            
            
            if(dictResponse[@"success"] && [dictResponse[@"success"] integerValue]==1)
            {
//                self.listArray = [[NSMutableArray alloc] init];
//                NSArray *listArr= [[NSMutableArray alloc] initWithArray:dictResponse[@"datasource"]];
                
                _detailInfo = [[SHCopeDetailInfo alloc] init];
                _detailInfo.contentStr = [NSString stringWithFormat:@"%@",dictResponse[@"datasource"][@"content"]];
                _detailInfo.createDateStr = [NSString stringWithFormat:@"%@",dictResponse[@"datasource"][@"createDate"]];
                _detailInfo.guideImgStr = [NSString stringWithFormat:@"%@",dictResponse[@"datasource"][@"guideImg"]];
                _detailInfo.iconStr = [NSString stringWithFormat:@"%@",dictResponse[@"datasource"][@"icon"]];
                _detailInfo.idStr = [NSString stringWithFormat:@"%@",dictResponse[@"datasource"][@"id"]];
                _detailInfo.titleStr = [NSString stringWithFormat:@"%@",dictResponse[@"datasource"][@"title"]];

                
                [self initContentViewAfterGetInfo];
            }
        }
        
        [MBHud removeFromView:self.view];
        
    } fail:^{
        
        [MBHud removeFromView:self.view];
        
    }];

}


#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc withIdStr:(NSString *)idStr
{
    if (pvc == nil) {
        return;
    }
    SHCopeDetailVC* vc = [[SHCopeDetailVC alloc]init];
    vc.idStr = idStr;
    
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
