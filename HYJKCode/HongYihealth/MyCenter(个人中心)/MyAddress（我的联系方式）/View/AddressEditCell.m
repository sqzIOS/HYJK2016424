//
//  AddressEditCell.m
//  
//
//  Created by apple on 16/1/25.
//
//

#import "AddressEditCell.h"

@interface AddressEditCell ()

@property (nonatomic,weak) UILabel *contentLabel;

@end

@implementation AddressEditCell

+ (instancetype)cellWithTitle:(NSString *)title
{
    AddressEditCell *cell = [[AddressEditCell alloc] init];
    cell.textLabel.text = title;
    cell.textLabel.textColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UILabel *content = [[UILabel alloc] init];
    content.userInteractionEnabled = NO;
    cell.contentLabel = content;
    content.backgroundColor = [UIColor clearColor];
    content.textAlignment = NSTextAlignmentRight;
    content.frame = CGRectMake(100, 0, [UIScreen mainScreen].bounds.size.width - 150, 60);
    [cell.contentView addSubview:content];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    content.text = cell.content;
    content.textColor = [UIColor grayColor];
    
    return cell;
}

- (void)setContent:(NSString *)content
{
    _content = content;
    self.contentLabel.text = content;
}

@end
