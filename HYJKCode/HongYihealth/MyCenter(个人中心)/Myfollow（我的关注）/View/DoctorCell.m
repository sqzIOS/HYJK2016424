//
//  DoctorCell.m
//  
//
//  Created by wenzhizheng on 16/1/24.
//
//

#import "DoctorCell.h"

@interface DoctorCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *detail;



@end

@implementation DoctorCell

- (void)awakeFromNib
{
    self.icon.layer.cornerRadius = 35;
    self.icon.clipsToBounds = YES;
}

+ (instancetype)cellWithModel:(DorctorModel *)model inTableView:(UITableView *)tableView
{
    DoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [DoctorCell loadFromXIBName:@"DoctorCell"];
    }
    
    cell.model = model;
    return cell;
}

- (void)setModel:(DorctorModel *)model
{
    _model = model;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    self.name.text = model.name;
    self.detail.text = model.detail;
}

@end
