//
//  DescriptionCell.m
//  
//
//  Created by wenzhizheng on 16/1/2.
//
//

#import "DescriptionCell.h"
#import "ShareFunction.h"
#import "UIView+Extend.h"

@interface DescriptionCell ()<UITextViewDelegate>

@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UITextView *textView;

@property (nonatomic,copy) NSString *titleStr;
@property (nonatomic,copy) NSString *placeHolder;


@end

@implementation DescriptionCell


+ (instancetype)descriptionCellWithTitle:(NSString *)title andPlaceHolder:(NSString *)palceHolder
{
    DescriptionCell *cell = [[DescriptionCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleStr = title;
    cell.placeHolder = palceHolder;
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    cell.titleLabel = titleLabel;
    cell.titleLabel.font = [UIFont systemFontOfSize:14];
    cell.titleLabel.textColor = RGBCOLOR(100,100,100);
    [cell.contentView addSubview:titleLabel];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.layer.borderWidth = 1;
    cell.textView = textView;
    [cell.contentView addSubview:textView];
    textView.text = palceHolder;
    textView.textColor = RGBCOLOR(220, 220, 220);
    textView.layer.borderColor = textView.textColor.CGColor;
    textView.delegate = cell;
    
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(QZMake(15), 0, SCREEN_WIDTH - QZMake(15),44);
    self.textView.frame = CGRectMake(QZMake(10), self.titleLabel.bottom, SCREEN_WIDTH - QZMake(20), 145 - self.titleLabel.height );
}

- (void)setDescriptionStr:(NSString *)descriptionStr
{
    _descriptionStr = descriptionStr;
    self.textView.text = descriptionStr;
    self.textView.textColor = [UIColor blackColor];
    if (descriptionStr.length < 1 || [descriptionStr isEqualToString:self.placeHolder]) {
        self.textView.text = self.placeHolder;
        self.textView.textColor = RGBCOLOR(220, 220, 220);
    }
    
}

#pragma mark - textViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    NSString *text = textView.text;
    if ([text isEqualToString:self.placeHolder]) {
        textView.text = nil;
        textView.textColor = [UIColor blackColor];
    }
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    NSString *text = textView.text;
    
    int i = 0;
    while (i < text.length) {
        if ([text hasPrefix:@" "] || [text hasPrefix:@"\n"]) {
            if (text.length == 1) {
                text = nil;
            } else {
                text = [text substringFromIndex:2];
            }
        } else {
            break;
        }
    }
    self.descriptionStr = text;
}

- (void)textViewDidChange:(UITextView *)textView
{
    int length = 100;
    if (textView.text.length > length) {
        textView.text = [textView.text substringToIndex:length];
    }
    
    if (textView.contentSize.height > textView.height - 10) {
        textView.text = [textView.text substringToIndex:textView.text.length - 1];
    }
    
    _descriptionStr = textView.text;
    if ([self.delegate respondsToSelector:@selector(descriptionCellTextDidChange:)]) {
        [self.delegate descriptionCellTextDidChange:self];
    }
}



@end
