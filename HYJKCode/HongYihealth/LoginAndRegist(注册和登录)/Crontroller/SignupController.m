//
//  SignupController.m
//  
//
//  Created by wenzhizheng on 16/1/14.
//
//

#import "SignupController.h"
#import "SignUpDetailController.h"
#import "PrintscreenController.h"

@interface SignupController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate,UIActionSheetDelegate,PrintscreenControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *chooseIcon;
@property (weak, nonatomic) IBOutlet UITextField *niciName;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (nonatomic,strong) UIImage *icon;
@property (nonatomic,strong) NSString *nick_name;
@property (nonatomic,strong) UIButton *chooseSex;
@property (weak, nonatomic) IBOutlet UIButton *menBtn;

- (IBAction)chooseIconClick:(UIButton *)sender;
- (IBAction)femalBtnClick:(UIButton *)sender;
- (IBAction)maleBtnClick:(UIButton *)sender;
- (IBAction)nextBtnClick:(UIButton *)sender;



@end

@implementation SignupController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
}

#pragma mark - 初始化
- (void)setUp
{
    self.titleStr = @"填写基本资料";
    self.icon = [UIImage imageNamed:@"姓名图标"];
    self.niciName.delegate = self;
    [self maleBtnClick:self.menBtn];
    
    self.chooseIcon.layer.cornerRadius = self.chooseIcon.width / 2;
    self.chooseIcon.clipsToBounds = YES;
    
    self.niciName.returnKeyType = UIReturnKeyDone;
    self.niciName.delegate = self;


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark - 选择头像
- (IBAction)chooseIconClick:(UIButton *)sender
{
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册",nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex !=0 && buttonIndex != 1) return;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    if (buttonIndex == 0) { // 相机
        if (![UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]) {
            [ShareFunction showToast:@"无法打开相机"];
            return;
        }
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if (buttonIndex == 1) { // 相册
        if (![UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary]) {
            [ShareFunction showToast:@"无法打开相册"];
            return;
        }
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:picker animated:YES completion:nil];
}


#pragma mark - 设置头像
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        PrintscreenController *controller = [PrintscreenController controllerWithImage:image];
        controller.delegate = self;
        [self presentViewController:controller animated:YES completion:nil];
    }];
}

- (void)printscreenController:(PrintscreenController *)controller cutImage:(UIImage *)image
{
    [controller dismissViewControllerAnimated:YES completion:nil];
    self.icon = image;
    [self.chooseIcon setImage:image forState:UIControlStateNormal];

}

#pragma mark - 选择性别
- (IBAction)femalBtnClick:(UIButton *)sender
{
    for (UIImageView *imageView in self.chooseSex.subviews) {
        if (imageView.tag == 1) {
            [imageView removeFromSuperview];
            break;
        }
    }
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.tag = 1;
    imageView.image = [UIImage imageNamed:@"chooseSex"];
    imageView.frame = CGRectMake(15, 15, 15, 15);
    [sender addSubview:imageView];
    self.chooseSex = sender;
}

- (IBAction)maleBtnClick:(UIButton *)sender
{
    [self femalBtnClick:sender];
}

#pragma mark - 下一步
- (IBAction)nextBtnClick:(UIButton *)sender
{
    if (self.nick_name.length < 1) {
        [ShareFunction showToast:@"请输入昵称"];
        return;
    }
    
    SignUpDetailController *vc = [[SignUpDetailController alloc] init];
    vc.nick_name = self.nick_name;
    if (self.icon == nil) {
        self.icon = [UIImage imageNamed:@"默认头像"];
    }
    vc.icon = self.icon;
    vc.sex = self.chooseSex.tag;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 监听昵称文字的变化
- (void)textFieldTextDidChange:(NSNotification *)noti
{
    self.nick_name = self.niciName.text;
    if (self.niciName.text.length > 0) {
        self.nextBtn.enabled = YES;
    } else {
        self.nextBtn.enabled = NO;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
