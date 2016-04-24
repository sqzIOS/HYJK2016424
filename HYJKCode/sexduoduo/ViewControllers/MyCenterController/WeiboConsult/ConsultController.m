//
//  ConsultController.m
//  sexduoduo
//
//  Created by Showm on 14-8-25.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//

#import "ConsultController.h"

@interface ConsultController ()

@end

@implementation ConsultController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTopNavView];
    
    self.messageText.layer.cornerRadius = 2;
    self.messageText.layer.masksToBounds = YES;
    self.messageText.delegate = self;
    self.messageText.layer.borderColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:.2f].CGColor;
    self.messageText.layer.borderWidth = 0.5;
    self.messageText.text = self.text;
    self.textRemain.text = [NSString stringWithFormat:@"还可输入%d字",(140 - self.text.length)];
    [self.messageText becomeFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(textChanged:)
												 name:UITextViewTextDidChangeNotification
											   object:self.messageText];

}


//顶部NavView
-(void)setTopNavView
{
    int imgY = -20;
    if (IOS7_OR_LATER) {
        imgY = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, imgY,self.view.frame.size.width, 64)];
    [self.view addSubview:navView];
    
    [navView addLeftBtnTarget:self action:@selector(toBackView) forControlEvents:UIControlEventTouchUpInside];
    [navView setTitleStr:@"微博咨询"];
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(265, 30 , 45, 25);
    [rightBtn setTitle:@"咨询" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    rightBtn.layer.cornerRadius = 11.5;
    rightBtn.layer.borderColor = NAV_RED_COLOR.CGColor;
    rightBtn.layer.borderWidth = 0.5;
    [rightBtn setTitleColor:NAV_RED_COLOR forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(sendWeibo) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:rightBtn];
    

    
}


//返回
-(void)toBackView
{
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(void)sendWeibo
{

}

- (void)textChanged:(NSNotification *)notification{
    
    self.textRemain.text = [NSString stringWithFormat:@"还可输入%d字",(140 - self.messageText.text.length)];
    if (self.messageText.text.length > 140) {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }else {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
}





#pragma mark - callback


- (void)successCallBack:(id)result{
    //    [SVProgressHUD showSuccessWithStatus:@"发送成功"];
    NSLog(@"《》《》%@",result);
}

- (void)failureCallBack:(NSError *)error{
    //    [SVProgressHUD showErrorWithStatus:error.description];
    NSLog(@"《》《》error: %@", error);
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
