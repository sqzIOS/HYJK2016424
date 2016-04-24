//
//  PatientSetInfoController.m
//  
//
//  Created by wenzhizheng on 16/1/9.
//
//

#import "PatientSetInfoController.h"
#import "MedicalCell.h"
#import "PatientCaseModel.h"
#import "UserOperation.h"

@interface PatientSetInfoController ()

@property (nonatomic,weak) MedicalCell *cell;
@property (nonatomic,weak) UITextField *field;
@property (nonatomic,strong) PatientCaseModel *model;

@end

@implementation PatientSetInfoController

+ (instancetype)patientSetInfoControllerWithCell:(MedicalCell *)cell andDataModel:(PatientCaseModel *)model;
{
    PatientSetInfoController *controller = [[PatientSetInfoController alloc] init];
    controller.cell = cell;
    controller.model = model;
    controller.titleStr = [NSString stringWithFormat:@"%@",cell.titleStr];
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITextField *field = [[UITextField alloc] init];
    field.layer.borderWidth = 1;
    field.layer.borderColor = RGBACOLOR(100, 100, 100, 0.2).CGColor;
    field.placeholder = self.titleStr;
    if (self.cell.detailStr.length > 1 && ![self.cell.detailStr isEqualToString:@"未填写"]) {
        field.text = self.cell.detailStr;
    }
    field.frame = CGRectMake(10, self.topView.bottom + 5, SCREEN_WIDTH  - 20, 44);
    field.leftViewMode = UITextFieldViewModeAlways;
    UILabel *label = [[UILabel alloc] init];
    
    label.frame = CGRectMake(0, 0, 0, field.height);
    label.text = [NSString stringWithFormat:@"  %@:",self.cell.titleStr];
    CGSize size = [label.text sizeWithFont:label.font];
    label.width = size.width + 10;
    field.leftView = label;

    self.field = field;
    [self.view addSubview:field];
    
    UIButton *submitBtn = [[UIButton alloc] init];
    submitBtn.layer.cornerRadius = 5;
    submitBtn.clipsToBounds = YES;
    submitBtn.frame = CGRectMake(10, field.bottom + 10, SCREEN_WIDTH - 20, 44);
    submitBtn.backgroundColor = MAINCOLOR;
    [submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:submitBtn];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ([self.titleStr containsString:@"年龄"]) {
        self.field.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    if ([self.titleStr containsString:@"体重"]) {
        self.field.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    if ([self.titleStr containsString:@"身高"]) {
        self.field.keyboardType = UIKeyboardTypeNumberPad;
    }

    [self.field becomeFirstResponder];
}

- (void)submitBtnClick
{
    if ([self.titleStr containsString:@"年龄"]) {
        self.model.age = self.field.text;
    }
    
    if ([self.titleStr containsString:@"体重"]) {
        self.model.weight = self.field.text;
    }
    
    if ([self.titleStr containsString:@"身高"]) {
        self.model.height = self.field.text;
    }
    
    if ([self.titleStr isEqualToString:@"血型"]) {
        self.model.blood_type = self.field.text;
    }
    
    if ([self.titleStr containsString:@"RH血型"]) {
        self.model.rhblood_type = self.field.text;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



@end
