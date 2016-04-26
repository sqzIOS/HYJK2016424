//
//  SignUpDetailController.m
//  
//
//  Created by wenzhizheng on 16/1/14.
//
//

#import "SignUpDetailController.h"
#import "SettingDetailController.h"
#import "QRcodeManger.h"

@interface SignUpDetailController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *verificationvCode;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *getCode;
@property (weak, nonatomic) IBOutlet UIButton *agree;
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UITextField *inviter;
@property (nonatomic) int time;

@property (nonatomic,weak) UINavigationController *nav;

- (IBAction)agreeBtnClick:(UIButton *)sender;
- (IBAction)getCodeClick:(UIButton *)sender;
- (IBAction)protocolClick:(UIButton *)sender;
- (IBAction)submitBtnClick:(UIButton *)sender;
- (IBAction)scanBtnClick:(UIButton *)sender;


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
    [UserOperation userSignupWithName:self.account.text password:self.password.text nick_name:self.nick_name avatar:self.icon sex:self.sex email:@" " yzm:self.verificationvCode.text field:@"0" invitecode:self.inviter.text succeed:^{
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

- (IBAction)scanBtnClick:(UIButton *)sender
{
    
    UIViewController *scanController = [[UIViewController alloc] init];
    scanController.title = @"扫描二维码";
    scanController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(scanControllerDismiss)];
    
    
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.frame = CGRectMake(0, SCREEN_HEIGHT / 3 - 50, SCREEN_WIDTH, 40);
    tipLabel.text = @"请将扫描框对准二维码";
    tipLabel.textColor = [UIColor orangeColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    [scanController.view addSubview:tipLabel];
    
    
    UIView *scanView = [[UIView alloc] init];
    scanView.frame = CGRectMake(SCREEN_WIDTH / 4, SCREEN_HEIGHT / 3, SCREEN_WIDTH / 2, SCREEN_WIDTH / 2);
    scanView.clipsToBounds = YES;
    [scanController.view addSubview:scanView];
    
    UIImage *image = [UIImage imageNamed:@"qrcode_border"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width /2 topCapHeight:image.size.height / 2];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.frame = scanView.bounds;
    [scanView addSubview:imageView];
    
    UIImageView *line = [[UIImageView alloc] init];
    line.image = [UIImage imageNamed:@"qrcode_scanline_qrcode"];
    line.frame = scanView.bounds;
    line.top = -scanView.height;
    [scanView addSubview:line];
    
 
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(lineAnimate:) userInfo:line repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    UINavigationController *nav = [[UINavigationController alloc] init];
    _nav = nav;
    [nav pushViewController:scanController animated:NO];
    [self presentViewController:nav animated:YES completion:nil];
    
    [[QRcodeManger defaultManger] starCaptureInSubperView:scanController.view didCaptureMessage:^(NSString *message) {
        self.inviter.text = message;
        [self scanControllerDismiss];
    }];
}

- (void)lineAnimate:(NSTimer *)timer
{
    UIImageView *line = timer.userInfo;
    line.top = -line.height;
    [UIView animateWithDuration:1 animations:^{
        line.top = line.height;
    }];
}

- (void)scanControllerDismiss
{
    [_nav dismissViewControllerAnimated:YES completion:nil];
}

@end
