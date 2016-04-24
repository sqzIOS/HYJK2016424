//
//  CommentsController.m
//  
//
//  Created by apple on 16/1/29.
//
// 医生评价

#import "CommentsController.h"
#import "CommentCell.h"
#import "UserOperation.h"


@interface CommentsController () <CommentCellDelegate>

@property (nonatomic,copy) NSString *orderID;

@property (nonatomic,copy) NSString *doctorID;
@property (nonatomic,copy) NSString *doctorName;
@property (nonatomic,copy) NSString *doctorDetail;
@property (nonatomic,copy) NSString *doctorIcon;

@property (nonatomic,copy) NSString *deseaseName;


@end

@implementation CommentsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"评价医生";
    
    [self loadData];
}

- (void)loadData
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [UserOperation getDoctorInfoWithDoctorID:self.doctorID Succeed:^(NSDictionary *dict) {
        
        NSDictionary *image = dict[@"img"];
        self.doctorIcon = image[@"small"];
        
        NSString *string = dict[@"goods_name"];
        NSArray *strArry = [string componentsSeparatedByString:@" "];
        self.doctorName = strArry.firstObject;
        self.doctorDetail = strArry.lastObject;
        
        [self setContent];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}

+ (instancetype)controllerWithDoctorID:(NSString *)doctorID andOrderID:(NSString *)orderID andDeseaseName:(NSString *)deseaseName
{
    CommentsController *controller = [[CommentsController alloc] init];
    controller.doctorID = doctorID;
    controller.orderID = orderID;
    controller.deseaseName = deseaseName;
    return controller;
}

- (void)setContent
{    
    CGFloat bottom = self.topView.bottom;
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, bottom, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - bottom);
    [self.view addSubview:scrollView];
    
    CommentCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:nil options:nil] lastObject];
    cell.delegate = self;
    cell.deseaseName = self.deseaseName;
    cell.doctorIcon = self.doctorIcon;
    cell.doctorName = self.doctorName;
    cell.doctorDetail = self.doctorDetail;
    cell.frame = CGRectMake(0, 0, scrollView.frame.size.width, 600);
    [scrollView addSubview:cell];
    scrollView.contentSize = cell.frame.size;
}

- (void)commentCellSubmitBtnClickWithDict:(NSDictionary *)dict
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:dict];
    [params setObject:self.orderID forKey:@"order_id"];
    [params setObject:self.doctorID forKey:@"goods_id"];
    [params setObject:self.deseaseName forKey:@"disease_types"];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [UserOperation commentWithParams:params Succeed:^{
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    } failed:^{
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
