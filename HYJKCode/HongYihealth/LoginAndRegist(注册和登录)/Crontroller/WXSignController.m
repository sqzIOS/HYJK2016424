//
//  WXSignController.m
//  
//
//  Created by apple on 16/2/1.
//
//

#import "WXSignController.h"
#import "BindAccountController.h"
#import "SignupController.h"

@interface WXSignController ()
- (IBAction)firstBtnClick:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)secondBtnClick:(UIButton *)sender;

@end

@implementation WXSignController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"选择方式";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)firstBtnClick:(UIButton *)sender forEvent:(UIEvent *)event
{
    BindAccountController *controller = [[BindAccountController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)secondBtnClick:(UIButton *)sender
{
    SignupController *controller = [[SignupController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
