//
//  IntelligenceDiagnosisController.m
//  
//
//  Created by wenzhizheng on 16/1/10.
//
//

#import "IntelligenceDiagnosisController.h"
#import "DeseaseView.h"
#import "Desease.h"
#import "UIScrollView+extend.h"
#import "DeseaseDetailController.h"
#import "DeseaseOperation.h"
#import "MedicalFirstController.h"
#import "MedicalSecondController.h"
#import "ConsultingVC.h"

@interface IntelligenceDiagnosisController () <UIScrollViewDelegate,DeseaseViewdelegate>

@property (nonatomic,strong) NSArray *deseaseDataArry;
@property (nonatomic,weak) UIPageControl *page;

@end

@implementation IntelligenceDiagnosisController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"智能导症";
    self.isNeedBack = NO;

    [self loadData];

}


- (void)loadData
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [DeseaseOperation getDeseaseCategory:^(NSArray *deseaseArry) {
        self.deseaseDataArry = deseaseArry;
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self setContent];
    } failed:^{
        [self setNodata];
    }];
}

- (void)setNodata
{
    UIButton *reloadBtn = [[UIButton alloc] init];
    reloadBtn.frame = self.view.bounds;
    [reloadBtn setTitle:@"点击屏幕重新加载" forState:UIControlStateNormal];
    [reloadBtn addTarget:self action:@selector(loadData) forControlEvents:UIControlEventTouchUpInside];
}


- (void)setContent
{
    UIPageControl *page = [[UIPageControl alloc] init];
    self.page = page;
    page.userInteractionEnabled = NO;
    page.frame = CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT / 12);
    page.currentPageIndicatorTintColor = MAINCOLOR;
    page.pageIndicatorTintColor = [UIColor grayColor];
    [self.view addSubview:page];
    
    NSInteger count = self.deseaseDataArry.count / 6;
    if (self.deseaseDataArry.count % 6 != 0) {
        count++;
    }
    
    page.numberOfPages = count;
    page.currentPage = 0;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = RGBCOLOR(240, 240, 240);
    [self.view addSubview:scrollView];
    
    CGFloat scrollowH = SCREEN_HEIGHT - self.page.bottom - SCREEN_WIDTH / 3 - 64;
    CGFloat viewW = SCREEN_WIDTH / 2 - 3;
    CGFloat viewH = (scrollowH - 8)/ 3;
    scrollView.frame = CGRectMake(0, self.page.bottom, SCREEN_WIDTH, scrollowH);
    scrollView.contentSize = CGSizeMake(count * SCREEN_WIDTH , scrollView.height);
    
    for (int i = 0; i<self.deseaseDataArry.count; i++) {
        DeseaseView *view = [DeseaseView loadFromXIBName:@"DeseaseView"];
        view.delegate = self;
        CGFloat viewX = i / 3 * (SCREEN_WIDTH / 2) + 2;
        if (i / 3 % 2 != 0) {
            viewX -= 1;
        }
        CGFloat viewY = i % 3 * (viewH + 2) + 2;
        view.frame = CGRectMake(viewX, viewY, viewW,viewH);
        [scrollView addSubview:view];
        
        view.tag = i + 1;
        Desease *desease = [self.deseaseDataArry objectAtIndex:i];
        view.desease = desease;
    }
    
    UIImageView *bottomView = [[UIImageView alloc] init];
    bottomView.frame = CGRectMake(0, scrollView.bottom , SCREEN_WIDTH, SCREEN_WIDTH / 3);
    bottomView.image = [UIImage imageNamed:@"bottomImage"];
    [self.view addSubview:bottomView];
}

#pragma mark - 拖动scrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.page.currentPage = scrollView.pageNumber;
}

#pragma mark - 选择某一个疾病
- (void)deseaseViewDidChoose:(DeseaseView *)deseaseView
{
    int index = deseaseView.tag - 1;
    Desease *desease = [self.deseaseDataArry objectAtIndex:index];
    
    ConsultingVC *controller = [[ConsultingVC alloc] init];
    controller.category_id = desease.category_id;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
