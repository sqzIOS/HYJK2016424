//
//  SettingDetailController.m
//  
//
//  Created by wenzhizheng on 16/1/8.
//
//

#import "SettingDetailController.h"
#import "UpdataPWView.h"
#import "Tools.h"

@interface SettingDetailController () <UpdataPWViewDelegate>


@end

@implementation SettingDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.titleStr isEqualToString: @"免责条款"]) {
        [self makeViewOfMZTK];
    }
    if ([self.titleStr isEqualToString: @"用户协议"]) {
        [self makeViewOfYHXY];
    }
    if ([self.titleStr isEqualToString: @"关于弘医"]) {
        [self makeViewOfGYHY];
    }
    if ([self.titleStr isEqualToString: @"评分"]) {
        [self makeViewOfYHPF];
    }
    if ([self.titleStr isEqualToString: @"重置密码"] || [self.titleStr isEqualToString:@"找回密码"]) {
        [self makeViewOfXGMM];
    }

}

#pragma mark - 设置内容
- (void)makeViewOfMZTK
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.frame = CGRectMake(0 , self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.height);
    [self.view addSubview:scrollView];
    
    UILabel *label = [[UILabel alloc] init];
    [scrollView addSubview:label];
    label.contentMode = UIViewContentModeTop;
    label.numberOfLines = 0;
    label.text = @"1.现行法律缺乏认定互联网医疗行为责任的机制，发生医疗事故后，是互联网平台，还是平台预约医生或医疗机构承担责任都没有明确的法律规定。因此，应在平台的显著位置声明免责条款如下：“弘医健康管理平台为医患交流、对接渠道，医生在医疗机构之外仅提供健康咨询服务，医生基于患者自述病情所提供的建议仅供参考，不能作为诊断和治疗的直接依据；患者在医疗机构就诊产生的问题和纠纷，本平台不承担责任。”\n2.在平台运营过程中，应明确平台仅提供健康咨询、导诊和医患对接服务，严禁出现诊断治疗等类似的字眼。在平台宣传、推广过程中，根据《医疗广告管理办法》第5条规定：“非医疗机构不得发布医疗广告”，应避免使用使人产生平台直接提供医疗服务的误解。";
    label.font = [UIFont systemFontOfSize:14];
    
    CGFloat labelW = SCREEN_WIDTH - 20;
    CGSize size = [Tools sizeOfString:label.text withFont:label.font andMaxSize:CGSizeMake(labelW, MAXFLOAT)];
    label.frame = CGRectMake(10, 10, labelW, size.height + 10);
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, label.height);

}
- (void)makeViewOfYHXY
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.bottom);
    [self.view addSubview:scrollView];
    
    UIView *protrocol = [UIView loadFromXIBName:@"UserProtrocol"];
    [scrollView addSubview:protrocol];
    protrocol.frame = CGRectMake(0, 0, scrollView.width, 5000);
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 5000);
}

- (void)makeViewOfGYHY
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 132, 163);
    imageView.image = [UIImage imageNamed:@"appIcon"];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
    UILabel *versionLabel = [[UILabel alloc] init];
    NSString *version = @"1.1.1";
    versionLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 30);
    versionLabel.text = [NSString stringWithFormat:@"版本号:%@",version];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.center = CGPointMake(imageView.centerX, imageView.centerY + 100);
    [self.view addSubview:versionLabel];
    
}
- (void)makeViewOfYHPF
{
    
}
- (void)makeViewOfXGMM
{
    UpdataPWViewChangePasswordType type = UpdataPWViewChangePasswordTypeForget;
    
    if ([self.titleStr isEqualToString:@"重置密码"]) {
        type = UpdataPWViewChangePasswordTypeReset;
    }
    UpdataPWView *updataPWView = [UpdataPWView viewWithType:type];
    updataPWView.delegate = self;
    updataPWView.frame = CGRectMake(0, self.topView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.topView.height);
    [self.view addSubview:updataPWView];
}

- (void)updataPWViewUpdataSucceed
{
    self.view.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}

#pragma mark - 创建控制器
+ (instancetype)settingDetailControllerWithTitle:(NSString *)titleStr
{
    SettingDetailController *controller = [[SettingDetailController alloc] init];
    controller.titleStr = titleStr;
    return controller;
}



@end
