//
//  MyAddressCell.m
//  
//
//  Created by apple on 16/1/25.
//
//

#import "MyAddressCell.h"

@interface MyAddressCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;
- (IBAction)defaultBtnClick:(id)sender;


@end

@implementation MyAddressCell


- (void)setModel:(AddressModel *)model
{
    _model = model;
    self.nameLabel.text = [NSString stringWithFormat:@"联系人:%@",model.consignee];
    
    NSString *province = [NSString stringWithFormat:@"%@",model.province];
    NSString *city = [NSString stringWithFormat:@"%@",model.city];
    NSString *district = [NSString stringWithFormat:@"%@",model.district];

    if ([province isEqualToString:@"<null>"]) {
        province = @" ";
    }
    if ([city isEqualToString:@"<null>"]) {
        city = @" ";
    }
    if ([district isEqualToString:@"<null>"]) {
        district = @" ";
    }
    self.addressLabel.text = [NSString stringWithFormat:@"地址:%@ %@ %@ %@ ",province,city,district,model.address];
    
    self.telLabel.text = [NSString stringWithFormat:@"联系电话:%@",model.tel];
    NSString *str = [NSString stringWithFormat:@"%@",model.default_address];
    if ([str isEqualToString:@"1"]) {
        self.defaultBtn.selected = YES;
    } 
}

- (IBAction)defaultBtnClick:(id)sender
{
    UIButton *btn = sender;
    if (!btn.selected) {
        if ([self.delegate respondsToSelector:@selector(myAddressCellsetDefaultWithAddressID:)]) {
            [self.delegate myAddressCellsetDefaultWithAddressID:self.model.addressID];
        }
    }
}
@end
