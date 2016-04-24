//
//  PatientListCell.m
//  sexduoduo
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 dbCode. All rights reserved.
//

#import "PatientListCell.h"
#import "PatientCaseModel.h"

@interface PatientListCell ()

@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;
- (IBAction)chooseBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end


@implementation PatientListCell

+ (instancetype)cellInTableView:(UITableView *)tableView
{
    PatientListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PatinetListCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PatientListCell" owner:nil options:nil] lastObject];
    }
    cell.chooseBtn.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)setModel:(PatientCaseModel *)model
{
    _model = model;
    self.chooseBtn.selected = model.isSelected;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (IBAction)chooseBtnClick:(id)sender
{
    if (self.chooseBtn.isSelected) {
        return;
    }
    
    self.model.isSelected = YES;
    if ([self.delegate respondsToSelector:@selector(patientListCellDidSelect:)]) {
        [self.delegate patientListCellDidSelect:self];
    }
}

@end
