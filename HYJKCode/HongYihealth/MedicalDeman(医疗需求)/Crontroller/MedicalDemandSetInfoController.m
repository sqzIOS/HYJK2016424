//
//  MedicalDemandSetInfoController.m
//  sexduoduo
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 dbCode. All rights reserved.
//

#import "MedicalDemandSetInfoController.h"
#import "UserOperation.h"
#import "MedicalCell.h"

@interface MedicalDemandSetInfoController ()

@property (nonatomic,weak) MedicalCell *cell;
@property (nonatomic,weak) UITextField *field;
@property (nonatomic,strong) ExaminationModel *examinationModel;
@property (nonatomic,strong) ServiceModel *serviceModel;


@property (nonatomic) MedicalDemandSetInfoControllerType type;


@end

@implementation MedicalDemandSetInfoController


+ (instancetype)controllerWithType:(MedicalDemandSetInfoControllerType)type medicalCell:(MedicalCell *)cell andModel:(id)model;
{
    MedicalDemandSetInfoController *controller = [[MedicalDemandSetInfoController alloc] init];
    if (type == MedicalDemandSetInfoControllerTypeExamination) {
        controller.examinationModel = model;
    }
    if (type == MedicalDemandSetInfoControllerTypeService) {
        controller.serviceModel = model;
    }
    controller.titleStr = [NSString stringWithFormat:@"%@",cell.titleStr];
    controller.type = type;
    controller.cell = cell;
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
    [self.field becomeFirstResponder];
}

- (void)submitBtnClick
{
    NSString *text = self.field.text;
    if (text.length < 1) {
        text = nil;
    }
    if (self.type == MedicalDemandSetInfoControllerTypeExamination) {
        if ([self.titleStr containsString:@"身份证"]) {
            self.examinationModel.id_card = text;
        }
        if ([self.titleStr containsString:@"体检机构"]) {
            self.examinationModel.medical_institutions = text;
        }
        if ([self.titleStr containsString:@"联系电话"]) {
            self.examinationModel.mobile = text;
        }
        if ([self.titleStr containsString:@"联系人"]) {
            self.examinationModel.contact_name = text;
        }
        if ([self.titleStr containsString:@"地区"]) {
            self.examinationModel.region = text;
        }
        if ([self.titleStr containsString:@"症状"]) {
            self.examinationModel.disease_desc = text;
        }
    }
    if (self.type == MedicalDemandSetInfoControllerTypeService) {
        if ([self.titleStr containsString:@"科室"]) {
            self.serviceModel.department = text;
        }
        if ([self.titleStr containsString:@"地区"]) {
            self.serviceModel.region = text;
        }
        if ([self.titleStr containsString:@"联系电话"]) {
            self.serviceModel.mobile = text;
        }
        if ([self.titleStr containsString:@"联系人"]) {
            self.serviceModel.contact_name = text;
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
