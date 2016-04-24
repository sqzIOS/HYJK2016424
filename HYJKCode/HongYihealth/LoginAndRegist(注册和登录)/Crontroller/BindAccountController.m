//
//  BindAccountController.m
//  
//
//  Created by apple on 16/2/1.
//
//

#import "BindAccountController.h"
#import "UserOperation.h"

@interface BindAccountController ()
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *bindBtn;
- (IBAction)bindBtnClick:(UIButton *)sender;


@end

@implementation BindAccountController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleStr = @"绑定账号";
    
    self.bindBtn.backgroundColor = RGBCOLOR(84,198, 117);
    self.bindBtn.layer.cornerRadius = 5;
    self.bindBtn.clipsToBounds = YES;
}



- (IBAction)bindBtnClick:(UIButton *)sender
{
    if (self.account.text.length < 1) {
        [ShareFunction showMessageMiddle:@"请输入账号"];
        return;
    }
    if (self.pwd.text.length < 1) {
        [ShareFunction showMessageMiddle:@"请输入密码"];
        return;
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [UserOperation userBindAccount:self.account.text andPassword:self.pwd.text succeed:^{
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [m_appDelegate setUpCustomTab];
    } failed:^{
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
    
}
@end
