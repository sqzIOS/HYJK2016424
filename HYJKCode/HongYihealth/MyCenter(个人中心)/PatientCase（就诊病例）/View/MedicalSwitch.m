//
//  MedicalSwitch.m
//  
//
//  Created by wenzhizheng on 15/12/31.
//
//

#import "MedicalSwitch.h"
#import "ShareFunction.h"
#import "UIView+Extend.h"


@interface MedicalSwitch ()

@property (nonatomic,weak) UIButton *chooseBtn;

@end

@implementation MedicalSwitch

+ (instancetype)medicalSwitch;
{
    MedicalSwitch *medicalSwitch = [[MedicalSwitch alloc] init];
    medicalSwitch.backgroundColor = [UIColor whiteColor];
    medicalSwitch.frame = CGRectMake(0, 0, SCREEN_WIDTH / 2, QZMake(30));
    medicalSwitch.layer.cornerRadius = QZMake(15);
    medicalSwitch.clipsToBounds = YES;
    
    UIButton *leftBtn = [[UIButton alloc] init];
    leftBtn.frame = CGRectMake(QZMake(5), QZMake(3), SCREEN_WIDTH / 4 - QZMake(5), QZMake(24));
    leftBtn.layer.cornerRadius = QZMake(12);
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:QZMake(14)];
    leftBtn.clipsToBounds = YES;
    [medicalSwitch addSubview:leftBtn];
    [leftBtn setTitle:@"服务定制" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    leftBtn.tag = switchStateLeft;
    [leftBtn setTitleColor:RGBCOLOR(84,198, 117) forState:UIControlStateNormal];
    leftBtn.backgroundColor = RGBCOLOR(84,198, 117);
    medicalSwitch.chooseBtn = leftBtn;
    [leftBtn addTarget:medicalSwitch action:@selector(btnClcik:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.selected = YES;
    
    
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.frame = CGRectMake(leftBtn.right, QZMake(3), leftBtn.width, QZMake(24));
    rightBtn.tag = switchStateRight;
    rightBtn.layer.cornerRadius = QZMake(12);
    rightBtn.clipsToBounds = YES;
    [medicalSwitch addSubview:rightBtn];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:QZMake(14)];
    [rightBtn setBackgroundColor:[UIColor whiteColor]];
    [rightBtn setTitle:@"体验定制" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [rightBtn setTitleColor:RGBCOLOR(84,198, 117) forState:UIControlStateNormal];
    [rightBtn addTarget:medicalSwitch action:@selector(btnClcik:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return medicalSwitch;
}

#pragma mark - 改变按钮状态
- (void)btnClcik:(UIButton *)btn
{
    self.chooseBtn.selected = NO;
    [self.chooseBtn setBackgroundColor:[UIColor whiteColor]];
    btn.selected = YES;
    [btn  setBackgroundColor:RGBCOLOR(84,198, 117)];
    self.chooseBtn = btn;
    
   // 通知代理
    if ([self.delegete respondsToSelector:@selector(medicaSwitchChangeState:)]) {
        [self.delegete medicaSwitchChangeState:(int)btn.tag];
    }
}

@end
