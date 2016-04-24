//
//  LeveyTabBar.m
//  LeveyTabBarController
//
//  Created by zhang on 12-10-10.
//  Copyright (c) 2012年 jclt. All rights reserved.
//
//

#import "LeveyTabBar.h"

@implementation LeveyTabBar
@synthesize backgroundView = _backgroundView;
@synthesize delegate = _delegate;
@synthesize buttons = _buttons;

- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray
{
    self = [super initWithFrame:frame];
    if (self)
	{
		self.backgroundColor = [UIColor clearColor];
		_backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
		[self addSubview:_backgroundView];
		
		self.buttons = [NSMutableArray arrayWithCapacity:[imageArray count]];
		UIButton *btn;
		CGFloat width = SCREEN_WIDTH / [imageArray count];
        UIImage *image = [[imageArray objectAtIndex:0] objectForKey:@"Default"];
        CGFloat height = image.size.height/image.size.width *width;
        
		for (int i = 0; i < [imageArray count]; i++)
		{
			btn = [UIButton buttonWithType:UIButtonTypeCustom];
			btn.showsTouchWhenHighlighted = YES;
			btn.tag = i;
			btn.frame = CGRectMake(width * i, 0, width, height);
            
            
			[btn setBackgroundImage:[[imageArray objectAtIndex:i] objectForKey:@"Default"] forState:UIControlStateNormal];
			[btn setBackgroundImage:[[imageArray objectAtIndex:i] objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
			[btn setBackgroundImage:[[imageArray objectAtIndex:i] objectForKey:@"Seleted"] forState:UIControlStateSelected];
			
            
            [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
			[self.buttons addObject:btn];
			[self addSubview:btn];
            
            if ( IS_ShowMessageIcon && isPassStoreCheck && isShowLunTan && isShowFenLei && i==2 && IS_SexDuoDuo) {
                // 我的消息
                self.numImg = [[UIImageView alloc] initWithFrame:CGRectMake(37, 5 , 17/2., 17/2.)];
                [self.numImg setImage:[UIImage imageNamed:@"numBg.png"]];
                [btn addSubview:self.numImg];
                
                self.numLabel = [[UILabel alloc] initWithFrame:self.numImg.frame];
                self.numLabel.font = [UIFont systemFontOfSize:8.0];
                self.numLabel.textColor = WHITE_COLOR;
                self.numLabel.textAlignment = NSTextAlignmentCenter;
                self.numLabel.text = @"0";
                self.numLabel.backgroundColor = [UIColor clearColor];
                [btn addSubview:self.numLabel];
                
                NSString *bbsMessageNumStr=[UserDefaults objectForKey:@"BBSMessageNum"];
                if (bbsMessageNumStr && [bbsMessageNumStr intValue]>0) {
                    self.numLabel.text=bbsMessageNumStr;
                    
                    self.numLabel.text=@"";
                    self.numImg.hidden=NO;
                    self.numLabel.hidden=NO;
                }else
                {
                    self.numImg.hidden=YES;
                    self.numLabel.hidden=YES;
                }
                
                
                
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeInfoNum:) name:NOTIFICATION_BBSMESSAGE object:nil];
                
            }
            
            //购物车
            if ( (IS_ShowMessageIcon && isPassStoreCheck && isShowLunTan && isShowFenLei && i==3 && IS_SexDuoDuo) ) {
                // 我的消息
                self.numImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(35, 5 , 17, 17)];
                [self.numImg1 setImage:[UIImage imageNamed:@"numBg.png"]];
                [btn addSubview:self.numImg1];
                
                self.numLabel1 = [[UILabel alloc] initWithFrame:self.numImg1.frame];
                self.numLabel1.font = [UIFont systemFontOfSize:8.0];
                self.numLabel1.textColor = WHITE_COLOR;
                self.numLabel1.textAlignment = NSTextAlignmentCenter;
                self.numLabel1.text = @"0";
                self.numLabel1.backgroundColor = [UIColor clearColor];
                [btn addSubview:self.numLabel1];
                
                NSString *bbsMessageNumStr=[UserDefaults objectForKey:@"ShopCarNum"];
                if (bbsMessageNumStr && [bbsMessageNumStr intValue]>0) {
                    self.numLabel1.text=bbsMessageNumStr;
                    
                    
                    self.numImg1.hidden=NO;
                    self.numLabel1.hidden=NO;
                }else
                {
                    self.numImg1.hidden=YES;
                    self.numLabel1.hidden=YES;
                }
                
                
                
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeInfoNum1:) name:NOTIFICATION_SHOPCARMESSAGE object:nil];
                
            }
		}
    }
    return self;
}

-(void)changeInfoNum:(NSNotification *)sender
{
    
    NSLog(@"通知内容 =%@", sender.userInfo);
    NSDictionary *dic=sender.userInfo;
    if(dic[@"messageNum"])
    {
        NSInteger num=[dic[@"messageNum"] integerValue];
        if (num >0) {
            self.numLabel.text=[NSString stringWithFormat:@"%ld",(long)num];
        
            [UserDefaults setValue:self.numLabel.text forKey:@"BBSMessageNum"];
            [UserDefaults synchronize];
            
            if (num>999) {
                self.numLabel.text=@"999";
            }
            
            self.numLabel.text=@"";
            
            self.numLabel.hidden=NO;
            self.numImg.hidden=NO;
            
        }else
        {
            self.numLabel.text=@"0";
            
            [UserDefaults setValue:self.numLabel.text forKey:@"BBSMessageNum"];
            [UserDefaults synchronize];
            
            self.numImg.hidden=YES;
            self.numImg.hidden=YES;
        }
    }
        
}


-(void)changeInfoNum1:(NSNotification *)sender
{
    
    NSLog(@"通知内容 =%@", sender.userInfo);
    NSDictionary *dic=sender.userInfo;
    if(dic[@"messageNum"])
    {
        NSInteger num=[dic[@"messageNum"] integerValue];
        if (num >0) {
            self.numLabel1.text=[NSString stringWithFormat:@"%ld",(long)num];
            
            [UserDefaults setValue:self.numLabel1.text forKey:@"ShopCarNum"];
            [UserDefaults synchronize];
            
            if (num>999) {
                self.numLabel1.text=@"999";
            }
            
            self.numLabel1.hidden=NO;
            self.numImg1.hidden=NO;
            
        }else
        {
            self.numLabel1.text=@"0";
            
            [UserDefaults setValue:self.numLabel1.text forKey:@"ShopCarNum"];
            [UserDefaults synchronize];
            
            self.numImg1.hidden=YES;
            self.numImg1.hidden=YES;
        }
    }
    
}

- (void)setBackgroundImage:(UIImage *)img
{
	[_backgroundView setImage:img];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toGoShoping:) name:@"ToGoToShoping" object:nil];
}

- (void)tabBarButtonClicked:(id)sender
{
	UIButton *btn = sender;
	[self selectTabAtIndex:btn.tag];
    NSLog(@"Select index: %d",(int)btn.tag);
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)])
    {
        [_delegate tabBar:self didSelectIndex:btn.tag];
    }
}

- (void)toGoShoping:(NSNotification *) noti
{
    
	NSString *index = [noti object];
	[self selectTabAtIndex:[index intValue]];
    NSLog(@"Select index: %d",[index intValue]);
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)])
    {
        [_delegate tabBar:self didSelectIndex:[index intValue]];
    }
}


- (void)selectTabAtIndex:(NSInteger)index
{
	for (int i = 0; i < [self.buttons count]; i++)
	{
		UIButton *b = [self.buttons objectAtIndex:i];
		b.selected = NO;
		b.userInteractionEnabled = YES;
	}
	UIButton *btn = [self.buttons objectAtIndex:index];
	btn.selected = YES;
	btn.userInteractionEnabled = NO;
}

- (void)removeTabAtIndex:(NSInteger)index
{
    // Remove button
    [(UIButton *)[self.buttons objectAtIndex:index] removeFromSuperview];
    [self.buttons removeObjectAtIndex:index];
   
    // Re-index the buttons
     CGFloat width = SCREEN_WIDTH / [self.buttons count];
    for (UIButton *btn in self.buttons) 
    {
        if (btn.tag > index)
        {
            btn.tag --;
        }
        btn.frame = CGRectMake(width * btn.tag, 0, width, self.frame.size.height);
    }
}
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    // Re-index the buttons
    CGFloat width = SCREEN_WIDTH / ([self.buttons count] + 1);
    for (UIButton *b in self.buttons) 
    {
        if (b.tag >= index)
        {
            b.tag ++;
        }
        b.frame = CGRectMake(width * b.tag, 0, width, self.frame.size.height);
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.showsTouchWhenHighlighted = YES;
    btn.tag = index;
    btn.frame = CGRectMake(width * index, 0, width, self.frame.size.height);
    [btn setImage:[dict objectForKey:@"Default"] forState:UIControlStateNormal];
    [btn setImage:[dict objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
    [btn setImage:[dict objectForKey:@"Seleted"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttons insertObject:btn atIndex:index];
    [self addSubview:btn];
}

- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [_backgroundView release];
    [_buttons release];
    [super dealloc];
}

@end
