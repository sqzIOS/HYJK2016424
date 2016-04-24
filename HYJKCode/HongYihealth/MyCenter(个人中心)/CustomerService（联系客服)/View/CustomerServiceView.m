//
//  CustomerServiceView.m
//  
//
//  Created by wenzhizheng on 16/1/8.
//
//

#import "CustomerServiceView.h"

@interface CustomerServiceView ()


@property (weak, nonatomic) IBOutlet UILabel *servicePhoneNum;
@property (weak, nonatomic) IBOutlet UIButton *connectService;
- (IBAction)connectServiceBtnClick:(id)sender;


@end

@implementation CustomerServiceView

- (instancetype)init
{
    if (self = [super init]) {
        self = [UIView loadFromXIBName:@"CSView"];
    }
    return self;
}

- (void)awakeFromNib
{
    self.connectService.layer.cornerRadius = 5;
    self.connectService.clipsToBounds = YES;
    self.servicePhoneNum.textAlignment = NSTextAlignmentCenter;
}

- (void)setPhoneNumber:(NSString *)phoneNumber
{
    _phoneNumber = phoneNumber;
    self.servicePhoneNum.text = phoneNumber;
}

#pragma mark - 拨打客服热线
- (IBAction)connectServiceBtnClick:(id)sender
{
    UIWebView *callWebView = [[UIWebView alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",ServiceNumber]];
    NSURLRequest *callRequest = [NSURLRequest requestWithURL:url];
    [callWebView loadRequest:callRequest];
    [self addSubview:callWebView];
}
@end
