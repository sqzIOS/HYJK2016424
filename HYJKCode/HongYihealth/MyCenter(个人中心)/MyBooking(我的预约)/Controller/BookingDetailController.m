//
//  BookingDetailController.m
//  
//
//  Created by wenzhizheng on 16/1/9.
//
//

#import "BookingDetailController.h"
#import "BookingCell.h"
#import "BookingCell.h"
#import "BookingModel.h"
#import "DoctorDetailsVC.h"

@interface BookingDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *bookingOrder;
@property (weak, nonatomic) IBOutlet UILabel *bookingState;
@property (weak, nonatomic) IBOutlet UIView *detailCell;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UIButton *connectServiceBtn;

- (IBAction)connectServiceBtnClick:(id)sender;

@property (nonatomic,strong) BookingModel *model;

@end

@implementation BookingDetailController

+ (instancetype)bookingDetailControllerWithModel:(BookingModel *)model
{
    BookingDetailController *controller = [[BookingDetailController alloc] init];
    controller.model = model;
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"我的预约";
    
    [self setData];
    
}

#pragma mark - 初始化界面数据
- (void)setData
{
    BookingCell *cell = [BookingCell bookingCellWithTableView:nil andIsNeedClock:NO];
    cell.model = self.model;
    cell.frame = CGRectMake(0, - 55, SCREEN_WIDTH , 150);
    [self.detailCell addSubview:cell];
    self.detailCell.clipsToBounds = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInCell)];
    [self.detailCell addGestureRecognizer:tap];
    
    [self.connectServiceBtn setTitle:ServiceNumber forState:UIControlStateNormal];
    self.connectServiceBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    self.bookingState.text = self.model.progress;
    self.bookingOrder.text = self.model.orderNumber;
    self.phone.text = self.model.patientPhone;
    self.name.text = self.model.patientName;

}

- (void)tapInCell
{
    DoctorDetailsVC *vc = [[DoctorDetailsVC alloc] initWithType:ForServer];
    ConsultingModel *model = [[ConsultingModel alloc] init];
    model.goods_id = self.model.doctorID;
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)connectServiceBtnClick:(id)sender
{
}
@end
