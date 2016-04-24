//
//  CustomerServiceViewController.m
//  
//
//  Created by wenzhizheng on 16/1/8.
//
//

#import "CustomerServiceViewController.h"
#import "CustomerServiceView.h"

@interface CustomerServiceViewController ()

@end

@implementation CustomerServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"联系客服";
    
    CustomerServiceView *view = [[CustomerServiceView alloc] init];
    view.phoneNumber = ServiceNumber;
    view.frame = CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.height);
    [self.view addSubview:view];


}



@end
