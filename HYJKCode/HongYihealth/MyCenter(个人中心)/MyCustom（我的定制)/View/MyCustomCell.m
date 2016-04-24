//
//  MyCustomCell.m
//  
//
//  Created by apple on 16/1/27.
//
//

#import "MyCustomCell.h"


@interface MyCustomCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statueLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation MyCustomCell

+ (instancetype)cellWithModel:(NSObject *)model inTableView:(UITableView *)tableView
{
    MyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [MyCustomCell loadFromXIBName:@"MyCustomCell"];
    }
    cell.model = model;
    cell.statueLabel.textColor = MAINCOLOR;
    return cell;
}

- (void)setModel:(NSObject *)model
{
    _model = model;
    NSString *contact_name = [model performSelector:@selector(contact_name)];
    NSString *custom_time = [model performSelector:@selector(custom_time)];
    NSString *update_time = [model performSelector:@selector(update_time)];
    NSString *status = [model performSelector:@selector(status)];

    self.nameLabel.text = contact_name;
    
    if (status.boolValue) {
        self.statueLabel.text = @"已受理";
        self.timeLabel.text = update_time;
    } else {
        self.statueLabel.text = @"未受理";
        self.timeLabel.text = custom_time;
    }
}

@end
