//
//  FeedBackController.m
//  
//
//  Created by wenzhizheng on 16/1/8.
//
//

#import "FeedBackController.h"
#import "UMFeedback.h"

#define FeedBackStr @"你好，请描述你遇到的问题..."
#define FeedBackClolr RGBCOLOR(100, 100, 100)

@interface FeedBackController () <UITextViewDelegate,UMFeedbackDataDelegate>

@property (nonatomic,weak) UITextView *textView;

@end

@implementation FeedBackController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleStr = @"意见反馈";
    
    [self setTextView];
    [self setSubmitBtn];
    
}

#pragma mark - 创建textView
- (void)setTextView
{
    UITextView *textView = [[UITextView alloc] init];
    self.textView = textView;
    [self.view addSubview:textView];
    textView.frame = CGRectMake(0, self.topView.bottom + 5, SCREEN_WIDTH,150);
    textView.text = FeedBackStr;
    textView.textColor = FeedBackClolr;
    textView.delegate = self;
    
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(0, textView.height - 1, SCREEN_WIDTH, 1);
    line.backgroundColor = RGBACOLOR(100, 100, 100, 0.2);
    [textView addSubview:line];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(SCREEN_WIDTH - 70, line.top - 31, 60, 30);
    label.text = @"4-200字";
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = FeedBackClolr;
    [textView addSubview:label];

}

#pragma mark - 创建提交按钮
- (void)setSubmitBtn
{
    UIButton *submitBtn = [[UIButton alloc] init];
    submitBtn.backgroundColor = MAINCOLOR;
    submitBtn.layer.cornerRadius = 5;
    submitBtn.clipsToBounds = YES;
    submitBtn.frame = CGRectMake(10, self.textView.bottom + 10, SCREEN_WIDTH - 20, 44);
    [self.view addSubview:submitBtn];
    
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - textViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:FeedBackStr]) {
        textView.text = nil;
    }
    textView.textColor = [UIColor blackColor];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    int i = 0;
    NSString *text = textView.text;
    while (i < text.length) {
        if ([text hasPrefix:@" "] || [text hasPrefix:@"\n"]) {
            if (text.length == 1) {
                text = nil;
            } else {
                text = [text substringFromIndex:2];
            }
        } else {
            break;
        }
    }

    if (text.length < 1 || [text isEqualToString:FeedBackStr]) {
        textView.text = FeedBackStr;
        textView.textColor = FeedBackClolr;
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    int length = 200;
    if (textView.text.length > length) {
        textView.text = [textView.text substringToIndex:length];
    }

    if (textView.contentSize.height > textView.height - 40) {
        textView.text = [textView.text substringToIndex:textView.text.length - 1];
    }
}

#pragma mark - 提交意见
- (void)submitBtnClick
{
    if (self.textView.text.length < 4 || [self.textView.text isEqualToString:FeedBackStr]) {
        [ShareFunction showToast:@"请输入4个字以上的意见"];
        return;
    }
    
    [UMFeedback sharedInstance].delegate = self;
    
    NSDictionary *userFeed = @{@"content":self.textView.text};
    [[UMFeedback sharedInstance] post:userFeed];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)postFinishedWithError:(NSError *)error
{
    
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    if (error) {
        [ShareFunction showToast:@"请检查当前网络环境"];
        return;
    }
    
    [ShareFunction showToast:@"意见已提交,感谢您的支持"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}

@end
