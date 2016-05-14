//
//  SigninController.m
//  
//
//  Created by wenzhizheng on 16/1/14.
//
//

#import "SigninController.h"
#import "UserOperation.h"
#import "UMSocial.h"
#import "SignupController.h"
#import "WXSignController.h"
#import "SettingDetailController.h"

#import "WXApi.h"
@interface SigninController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)signin:(id)sender;
- (IBAction)signByWeiXin:(id)sender;
- (IBAction)back:(UIButton *)sender;
- (IBAction)forgetPassword:(id)sender;

@end

@implementation SigninController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.topView.hidden = YES;
    
    [self setUp];
    
    if ([WXApi isWXAppInstalled])
    {
        self.weiXinBtn.hidden = NO;
    }else self.weiXinBtn.hidden = YES;
    
}

#pragma mark - 初始化登陆界面
- (void)setUp
{
    UserModel *user = [UserOperation getUserFromeLocal];
    if (user.name && ![user.name isEqualToString:@"(null)"]) {
        self.account.text = user.name;
    }
    self.account.returnKeyType = UIReturnKeyDone;
    self.account.delegate = self;

    
    if (user.password && ![user.name isEqualToString:@"(null)"]) {
        self.password.text = user.password;
    }
    self.password.returnKeyType = UIReturnKeyDone;
    self.password.delegate = self;

}



- (IBAction)signin:(id)sender
{
    [self.view endEditing:YES];
    
   /****测试用直接进入主界面****/
//    [m_appDelegate setUpCustomTab];
//    return;
   /************************/
    
    if (self.account.text.length < 1) {
        [ShareFunction showMessageMiddle:@"请输入用户名"];
        return;
    }
    if (self.password.text.length<1) {
        [ShareFunction showMessageMiddle:@"请输入密码"];
        return;
    }
    
    
    UIButton *signBtn = sender;
    signBtn.userInteractionEnabled = NO;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [UserOperation userSigninWithName:self.account.text andPassword:self.password.text succeed:^{
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [m_appDelegate setUpCustomTab];
        signBtn.userInteractionEnabled = YES;
    } failed:^{
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        signBtn.userInteractionEnabled = YES;
    }];
}

#pragma mark - 微信登陆
- (IBAction)signByWeiXin:(id)sender
{
    appType = WECHAT_RET;
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:UMShareToWechatSession];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [UserOperation userSignByWXWithUid:snsAccount.usid andNickname:snsAccount.userName succeed:^{
                
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                [m_appDelegate setUpCustomTab];
                
            } failed:^{
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                WXSignController *conttoller = [[WXSignController alloc] init];
                [self.navigationController pushViewController:conttoller animated:YES];
            }];
            [[NSUserDefaults standardUserDefaults] setObject:snsAccount.usid forKey:@"openapi"];
            
        }
        
    });
}

- (IBAction)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 忘记密码
- (IBAction)forgetPassword:(id)sender
{
    SettingDetailController *controller = [SettingDetailController settingDetailControllerWithTitle:@"找回密码"];
    [self.navigationController pushViewController:controller animated:YES];
}



@end
