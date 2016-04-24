//
//  StarAppController.m
//  
//
//  Created by wenzhizheng on 16/1/14.
//
//

#import "StarAppController.h"
#import "SigninController.h"
#import "SignupController.h"


@interface StarAppController ()
- (IBAction)signin:(id)sender;
- (IBAction)signup:(id)sender;

@end

@implementation StarAppController

- (void)viewDidLoad
{
    
}

- (IBAction)signin:(id)sender {
    SigninController *signinVC = [[SigninController alloc] init];
    [self.navigationController pushViewController:signinVC animated:YES];
}

- (IBAction)signup:(id)sender {
    SignupController *signupVC = [[SignupController alloc] init];
    [self.navigationController pushViewController:signupVC animated:YES];
}


@end
