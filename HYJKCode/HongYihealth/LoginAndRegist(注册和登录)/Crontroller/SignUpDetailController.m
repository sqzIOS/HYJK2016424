//
//  SignUpDetailController.m
//  
//
//  Created by wenzhizheng on 16/1/14.
//
//

#import "SignUpDetailController.h"
#import "SettingDetailController.h"

@interface SignUpDetailController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *verificationvCode;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *getCode;
@property (weak, nonatomic) IBOutlet UIButton *agree;
@property (weak, nonatomic) IBOutlet UIButton *submit;

@property (nonatomic) int time;

- (IBAction)agreeBtnClick:(UIButton *)sender;
- (IBAction)getCodeClick:(UIButton *)sender;
- (IBAction)protocolClick:(UIButton *)sender;
- (IBAction)submitBtnClick:(UIButton *)sender;

@end

@implementation SignUpDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleStr = @"填写账户信息";
    
    self.account.returnKeyType = UIReturnKeyDone;
    self.password.returnKeyType = UIReturnKeyDone;
    self.verificationvCode.returnKeyType = UIReturnKeyDone;
    
    self.account.delegate = self;
    self.password.delegate = self;
    self.verificationvCode.delegate = self;

}

#pragma mark - 是否同意用户协议
- (IBAction)agreeBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    [self textFieldDidEndEditing:nil];
}



#pragma mark - 获取验证码
- (IBAction)getCodeClick:(UIButton *)sender
{
    [ShareFunction showToast:@"验证码正发送至您的手机..."];
    [UserOperation getVerificationCodeWithPhoneNumber:self.account.text];
}


#pragma mark - 显示用户协议
- (IBAction)protocolClick:(UIButton *)sender
{
   SettingDetailController *controller = [SettingDetailController settingDetailControllerWithTitle:@"用户协议"];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - 判断是否可以提交信息
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    BOOL enabled = YES;
    self.getCode.enabled = enabled;
    if (self.account.text.length < 1) {
        enabled = NO;
        self.getCode.enabled = enabled;
    }
    if (self.verificationvCode.text.length < 1) {
        enabled = NO;
    }
    if (self.password.text.length < 1) {
        enabled = NO;
    }
    if (!self.agree.selected) {
        enabled = NO;
    }
    self.submit.enabled = enabled;
}

#pragma mark - 提交注册信息
- (IBAction)submitBtnClick:(UIButton *)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [UserOperation userSignupWithName:self.account.text password:self.password.text nick_name:self.nick_name avatar:self.icon sex:self.sex email:@"123" yzm:self.verificationvCode.text field:@"0" succeed:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [ShareFunction showToast:@"注册成功,自动跳转到主界面"];
        // 俩秒后进入主界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [m_appDelegate setUpCustomTab];
        });
    } failed:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [ShareFunction showMessageMiddle:@"注册失败"];
    }];
}

@end
