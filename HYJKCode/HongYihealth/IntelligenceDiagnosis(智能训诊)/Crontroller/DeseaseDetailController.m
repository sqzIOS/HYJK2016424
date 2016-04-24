//
//  DeseaseDetailController.m
//  
//
//  Created by wenzhizheng on 16/1/11.
//
//

#import "DeseaseDetailController.h"

@interface DeseaseDetailController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) Desease *desease;
@property (nonatomic,weak) UITableView *tableView;

@end

@implementation DeseaseDetailController

+ (instancetype)deseaseDetailControllerWithDesease:(Desease *)desease
{
    DeseaseDetailController *controller = [[DeseaseDetailController alloc] init];
    controller.desease = desease;
    return controller;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleStr = self.desease.name;
    
    [self setTableView];
}

- (void)setTableView
{
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.height);
    [self.view addSubview:tableView];
    tableView.delegate =self;
    tableView.dataSource = self;
    [tableView clearDefaultLineByAddFootLine];
    self.tableView = tableView;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.desease.children.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSString *title = [self.desease.children objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    return cell;
}


@end
