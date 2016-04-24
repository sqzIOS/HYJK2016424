//
//  MyBookingSwitch.m
//  
//
//  Created by wenzhizheng on 16/1/3.
//
//

#import "BookingSwitch.h"

@interface BookingSwitch ()

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UIButton *chooseBtn;

@end

@implementation BookingSwitch

+ (instancetype)bookingSwitchWithFrame:(CGRect)frame andLeftStr:(NSString *)leftStr andRightStr:(NSString *)rightStr
{
    BookingSwitch *bookingSwitch = [[BookingSwitch alloc] init];
    bookingSwitch.frame = frame;
    
    CGFloat bottomViewHeight = 4;
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0, 40, frame.size.width / 2, bottomViewHeight);
    bottomView.backgroundColor = MAINCOLOR;
    [bookingSwitch addSubview:bottomView];
    bookingSwitch.bottomView = bottomView;
    
    UIButton *leftBtn = [[UIButton alloc] init];
    leftBtn.frame = CGRectMake(0, 0,frame.size.width / 2,frame.size.height - bottomViewHeight);
    leftBtn.backgroundColor = [UIColor whiteColor];
    [leftBtn setTitle:leftStr forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn addTarget:bookingSwitch action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bookingSwitch addSubview:leftBtn];
    bookingSwitch.chooseBtn = leftBtn;
    [bookingSwitch.chooseBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];

    
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.frame = CGRectMake(frame.size.width / 2, 0,frame.size.width / 2,frame.size.height - bottomViewHeight);
    rightBtn.backgroundColor = [UIColor whiteColor];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn setTitle:rightStr forState:UIControlStateNormal];
    [bookingSwitch addSubview:rightBtn];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn addTarget:bookingSwitch action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return bookingSwitch;
    
    
}



#pragma mark - 通知代理
- (void)btnClick:(UIButton *)btn
{
    [self.chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.chooseBtn = btn;
    [self.chooseBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    self.bottomView.left = btn.left;

    NSLog(@"%@",NSStringFromCGRect(self.bottomView.frame));
    
    if (![self.delegate respondsToSelector:@selector(bookingSwitchVlaueChange:)]) return;
    if (self.bottomView.centerX > self.width / 2) {
        [self.delegate bookingSwitchVlaueChange:bookingSwitchValueRight];
    } else {
        [self.delegate bookingSwitchVlaueChange:bookingSwitchValueLeft];
    }
}

@end
