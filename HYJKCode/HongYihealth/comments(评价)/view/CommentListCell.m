//
//  CommentListCell.m
//  
//
//  Created by apple on 16/2/1.
//
//

#import "CommentListCell.h"
#import "CommentBar.h"

@interface CommentListCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *deseaseLabel;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

// 评分条
@property (nonatomic,weak) CommentBar *bar1;
@property (nonatomic,weak) CommentBar *bar2;
@property (nonatomic,weak) CommentBar *bar3;

@end

@implementation CommentListCell

- (void)awakeFromNib
{
    CGFloat width = SCREEN_WIDTH / 5 - 4;
    CGFloat height = self.view1.frame.size.height;
    CommentBar *bar1 = [CommentBar commentBarWithFrame:CGRectMake(0, 0, width, height) andMargin:1];
    self.bar1 = bar1;
    [self.view1 addSubview:bar1];
    
    CommentBar *bar2 = [CommentBar commentBarWithFrame:CGRectMake(0, 0, width, height) andMargin:1];
    self.bar2 = bar2;
    [self.view2 addSubview:bar2];
    
    CommentBar *bar3 = [CommentBar commentBarWithFrame:CGRectMake(0, 0, width, height) andMargin:1];
    self.bar3 = bar3;
    [self.view3 addSubview:bar3];
}

+ (instancetype)commentListCellInTableView:(UITableView *)tableView
{
    CommentListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil) {
        cell = [CommentListCell loadFromXIBName:@"CommentListCell"];
    }
    return cell;
}

- (void)setContent:(NSString *)content
{
    _content = content;
    self.contentLabel.text = content;
}

- (void)setName:(NSString *)name
{
    _name = name;
    NSString *text = [NSString stringWithFormat:@"%@评价",name];
    self.nameLabel.text = text;
}

- (void)setDesease:(NSString *)desease
{
    _desease = desease;
    self.deseaseLabel.text = desease;
}

- (void)setValue1:(int)value1
{
    _value1 = value1;
    self.bar1.value = value1;
}
- (void)setValue2:(int)value2
{
    _value2 = value2;
    self.bar2.value = value2;
}
- (void)setValue3:(int)value3
{
    _value3 = value3;
    self.bar3.value = value3;
}

@end
