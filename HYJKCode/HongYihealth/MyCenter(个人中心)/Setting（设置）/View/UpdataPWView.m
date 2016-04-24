//
//  UpdataPWView.m
//  
//
//  Created by wenzhizheng on 16/1/8.
//
//

#import "UpdataPWView.h"
#import "UserOperation.h"

@interface UpdataPWView () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (weak, nonatomic) IBOutlet UITextField *nowPW;
@property (weak, nonatomic) IBOutlet UITextField *confirmPW;

@property (weak, nonatomic) IBOutlet UIButton *confimBtn;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;


@property (nonatomic) int timeCount;



- (IBAction)confirmBtnClick:(UIButton *)sender;
- (IBAction)getCode:(id)sender;

@end

@implementation UpdataPWView

+ (instancetype)viewWithType:(UpdataPWViewChangePasswordType)type
{
    UpdataPWView *view = [UIView loadFromXIBName:@"UpdataPassWordView"];
    view.changePasswordType = type;
    
    if (view.changePasswordType == UpdataPWViewChangePasswordTypeReset) {
        view.account.text = [UserOperation getUserFromeLocal].mobile_phone;
    }

    return view;
}

- (void)awakeFromNib
{
    self.confimBtn.layer.cornerRadius = 5;
    self.confimBtn.clipsToBounds = YES;
    
    
    self.getCodeBtn.layer.cornerRadius = 12.5;
    self.getCodeBtn.clipsToBounds = YES;
    self.getCodeBtn.backgroundColor = AppColor;
    
    self.account.delegate = self;
    self.code.delegate = self;
    self.nowPW.delegate = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    BOOL enable = YES;
    if (self.account.text.length < 1) {
        enable = NO;
    }
    if (self.code.text.length < 1) {
        enable = NO;
    }
    if (self.nowPW.text.length < 1) {
        enable = NO;
    }
    self.confimBtn.enabled = enable;
}

- (IBAction)confirmBtnClick:(UIButton *)sender
{
    
    if (self.nowPW.text.length > 12 || self.nowPW.text.length < 6) {
        [ShareFunction showToast:@"请输入长度大于6不小于12的密码"];
        return;
    }
    
    if (![self.nowPW.text isEqualToString:self.confirmPW.text]) {
        [ShareFunction showToast:@"俩次密码输入不一致"];
        return;
    }
    
    [MBProgressHUD showHUDAddedTo:self animated:YES];
    [UserOperation updataPasswordWithCode:self.code.text account:self.account.text password:self.nowPW.text succeed:^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        [ShareFunction showToast:@"修改成功"];
    } failed:^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
    }];
}

- (IBAction)getCode:(UIButton *)btn
{
    if (self.account.text.length != 11) {
        [ShareFunction showToast:@"请输入正确的手机号"];
        return;
    }
    [ShareFunction showToast:@"验证码正发送至您的手机...(30秒后可重新获取)"];
    [UserOperation getVerificationCodeWithAccount:self.account.text];

    btn.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    self.getCodeBtn.userInteractionEnabled = NO;
    self.timeCount = 30;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeCount:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)timeCount:(NSTimer *)timer
{
    [self.getCodeBtn setTitle:[NSString stringWithFormat:@"%dS",self.timeCount] forState:UIControlStateNormal];
    self.timeCount--;
    if (self.timeCount < 0) {
        self.getCodeBtn.enabled = YES;
        self.getCodeBtn.backgroundColor = AppColor;
        [self.getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [timer invalidate];
    }
}

@end
