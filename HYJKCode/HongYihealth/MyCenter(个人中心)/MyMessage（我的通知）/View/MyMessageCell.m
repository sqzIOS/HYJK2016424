//
//  MyMessageCell.m
//  
//
//  Created by wenzhizheng on 16/1/24.
//
//

#import "MyMessageCell.h"

@interface MyMessageCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *time;


@end

@implementation MyMessageCell

+ (instancetype)cellWithModel:(MessageModel *)model inTableView:(UITableView *)tableView
{
    MyMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [MyMessageCell loadFromXIBName:@"MyMessageCell"];
    }
    
    cell.model = model;
    return cell;
}

- (void)setModel:(MessageModel *)model
{
    _model = model;
    self.title.text = model.title;
    self.content.text = model.content;
    self.time.text = model.time;
}

@end
