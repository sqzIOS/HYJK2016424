//
//  MedicalCell.m
//  
//
//  Created by wenzhizheng on 16/1/1.
//
//

#import "MedicalCell.h"
#import "ShareFunction.h"
#import "UIView+Extend.h"

@interface MedicalCell ()

@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *detailLabel;
@property (nonatomic,weak) UIButton *rightBtn;
@property (nonatomic,weak) UIView *line;


@end

@implementation MedicalCell

+ (instancetype)medicalCell
{
    MedicalCell *cell = [[MedicalCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    UILabel *titleLabel = [[UILabel alloc] init];
    cell.titleLabel = titleLabel;
    cell.titleLabel.font = [UIFont systemFontOfSize:14];
    cell.titleLabel.textColor = RGBCOLOR(100,100,100);
    [cell.contentView addSubview:titleLabel];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.textAlignment = NSTextAlignmentRight;
    cell.detailLabel = detailLabel;
    if (cell.detailStr == nil) {
        cell.detailStr = @"未填写";
    }
    detailLabel.font = [UIFont systemFontOfSize:QZMake(14)];
    [cell.contentView addSubview:detailLabel];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:line];
    line.alpha = 0.2;
    cell.line = line;
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(QZMake(15),0,QZMake(150),self.height);
    self.detailLabel.frame = CGRectMake(self.titleLabel.right,0, QZMake(170), self.height);
    self.line.frame = CGRectMake(QZMake(15), self.titleLabel.bottom - 1, SCREEN_WIDTH - QZMake(15), 1);
    
}

- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

- (void)setDetailStrColor:(UIColor *)detailStrColor
{
    _detailStrColor = detailStrColor;
    self.detailLabel.textColor = detailStrColor;
}

- (void)setDetailStr:(NSString *)detailStr
{
    if (detailStr.length < 1 || [detailStr isEqualToString:@"未填写"]) {
        _detailStr = nil;
        self.detailLabel.text = @"未填写";
        self.detailLabel.textColor = RGBCOLOR(220, 220, 200);
        return;
    }
    _detailStr = detailStr;
    self.detailLabel.textColor = [UIColor blackColor];
    self.detailLabel.text = detailStr;
    
    if ([self.delegate respondsToSelector:@selector(medicalCell:detailStrChanged:)]) {
        [self.delegate medicalCell:self detailStrChanged:self.detailStr];
    }
}




@end
