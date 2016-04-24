//
//  ChooseView.m
//  
//
//  Created by apple on 16/1/25.
//
//

#import "ChooseView.h"

@interface ChooseView () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *titleArry;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic) CGFloat height;
@property (nonatomic,copy) NSString *chooseTitle;
@property (nonatomic,weak) UIButton *cover;
@property (nonatomic,weak) UITableViewCell *chooseCell;
@property (nonatomic,weak) UILabel *titleLabel;

@end

@implementation ChooseView



+ (instancetype)chooseViewWithTitleArry:(NSArray *)titleArry andChosseTitle:(NSString *)choosetitle andTitle:(NSString *)title;
{
    ChooseView *chooseView = [[ChooseView alloc] init];
    chooseView.titleArry = titleArry;
    chooseView.chooseTitle = choosetitle;
    chooseView.frame = [UIScreen mainScreen].bounds;
    
    UIButton *cover = [[UIButton alloc] init];
    cover.backgroundColor = [UIColor blackColor];
    chooseView.cover = cover;
    cover.alpha = 0;
    cover.frame = chooseView.bounds;
    [chooseView addSubview:cover];
    [cover addTarget:chooseView action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    UITableView *tableView = [[UITableView alloc] init];
    chooseView.tableView = tableView;
    tableView.delegate = chooseView;
    tableView.dataSource = chooseView;
    
    CGFloat height;
    if (titleArry.count > 5) {
        height = 44 * 5;
    } else {
        tableView.bounces = NO;
        height = (titleArry.count) * 44;
    }
    chooseView.height = height + 44;
    tableView.frame = CGRectMake(0, chooseView.frame.size.height + 44, chooseView.frame.size.width, height);
    [chooseView addSubview:tableView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    chooseView.titleLabel = titleLabel;
    titleLabel.frame = CGRectMake(0, chooseView.frame.size.height, chooseView.frame.size.width, 44);
    titleLabel.backgroundColor = MAINCOLOR;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    [chooseView addSubview:titleLabel];
    
    return chooseView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString *title = [self.titleArry objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    if ([title isEqualToString:self.chooseTitle]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.chooseCell = cell;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.chooseCell.accessoryType = UITableViewCellAccessoryNone;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.chooseTitle = cell.textLabel.text;
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.chooseCell = cell;
    
    if ([self.delegate respondsToSelector:@selector(chooseViewDidSelected:)]) {
        [self.delegate chooseViewDidSelected:indexPath.row];
        [self dismiss];
    }
}

- (void)showInView:(UIView *)view
{
    [view addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.cover.alpha = 0.4;
        self.tableView.frame = CGRectOffset(self.tableView.frame, 0, -self.height);
        
        self.titleLabel.frame = CGRectOffset(self.titleLabel.frame, 0, -self.height);
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.3 animations:^{
        self.cover.alpha = 0;
        self.tableView.frame = CGRectOffset(self.tableView.frame, 0, self.tableView.frame.size.height);
        
        self.titleLabel.frame = CGRectOffset(self.titleLabel.frame, 0, self.height);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
