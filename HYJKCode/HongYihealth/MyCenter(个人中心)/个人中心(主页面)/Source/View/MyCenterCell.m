//
//  MyCenterCell.m
//  
//
//  Created by wenzhizheng on 16/1/12.
//
//

#import "MyCenterCell.h"

@implementation MyCenterCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    UIImageView *iconView = [[UIImageView alloc] init];
    self.iconView = iconView;
    iconView.frame = CGRectMake(20, 10, self.height - 20, self.height - 20);
    iconView.layer.cornerRadius = iconView.width / 2;
    iconView.clipsToBounds = YES;
    [self.contentView addSubview:iconView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    self.titleLabel = titleLabel;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = RGBCOLOR(100,100,100);
    titleLabel.frame = CGRectMake(iconView.right + 10, 0, SCREEN_WIDTH / 2, self.height);
    [self.contentView addSubview:titleLabel];
    
    return self;
}

@end
