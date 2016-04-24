//
//  SetAddressInfoController.m
//  
//
//  Created by apple on 16/1/25.
//
//

#import "SetAddressInfoController.h"
#import "AddressModel.h"

@interface SetAddressInfoController ()

@property (nonatomic,strong) AddressModel *addressModel;
@property (nonatomic,weak) UITextField *field;
@property (nonatomic,copy) NSString *cellTitle;

@end

@implementation SetAddressInfoController

+ (instancetype)controllerWithAddressModel:(AddressModel *)addressModel controllerTitle:(NSString *)title;
{
    SetAddressInfoController *controller = [[SetAddressInfoController alloc] init];
    controller.cellTitle = title;
    controller.addressModel = addressModel;
    return controller;
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    self.titleStr = @"编辑";

    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UITextField *field = [[UITextField alloc] init];
    
    if ([self.cellTitle containsString:@"地址"]) {
        field.placeholder = self.addressModel.address;
    }
    if ([self.cellTitle containsString:@"联系人"]) {
        field.placeholder = self.addressModel.consignee;
    }
    if ([self.cellTitle containsString:@"电话"]) {
        field.placeholder = self.addressModel.tel;
    }
    
    field.backgroundColor = [UIColor whiteColor];
    field.frame = CGRectMake(0, self.topView.bottom + 20, [UIScreen mainScreen].bounds.size.width, 44);
    [self.view addSubview:field];
    self.field = field;
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 100, 44);
    field.leftViewMode = UITextFieldViewModeAlways;
    field.leftView = label;
    label.text = [NSString stringWithFormat:@"  %@:",self.cellTitle];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = MAINCOLOR;
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 5;
    btn.clipsToBounds = YES;
    btn.frame = CGRectMake(10, field.bottom + 15, field.frame.size.width - 20, 44);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.field becomeFirstResponder];
}

- (void)btnClick
{
    [self.field resignFirstResponder];
    
    if ([self.cellTitle containsString:@"地址"]) {
        self.addressModel.address = self.field.text;
    }
    if ([self.cellTitle containsString:@"联系人"]) {
        self.addressModel.consignee = self.field.text;
    }
    if ([self.cellTitle containsString:@"电话"]) {
        self.addressModel.tel = self.field.text;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
