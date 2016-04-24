//
//  SHNavigationBar.m
//  sexduoduo
//
//  Created by shown on 15/9/28.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHNavigationBar.h"
@interface SHNavigationBar ()
@property (nonatomic, copy) LeftClick leftBlock;
@property (nonatomic, copy) rightClick rightBlock;

@property (nonatomic, strong) UIButton *btn_left;
@property (nonatomic, strong) UIButton *btn_right;
@property (nonatomic, strong) UIView *v_dash;
@property (nonatomic, strong) UILabel *lb_title;

@end
@implementation SHNavigationBar
- (instancetype)initWithTitle:(NSString *)title rightBtn:(UIButton *)rightBtn leftClick:(LeftClick)left rightClick:(rightClick)right{
    if (self = [super init]) {
        int layOutH = -20;
        if (IOS7_OR_LATER) {
            layOutH = 0;
        }
        self.frame = CGRectMake(0, layOutH, SCREEN_WIDTH, 64);
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.v_dash];
        self.leftBlock = left;
        self.rightBlock = right;
        
        if (title.length) {
            self.lb_title.text = title;
            [self addSubview:self.lb_title];
        }
        
        if (left) {
            [self addSubview:self.btn_left];
        }
        
        if (rightBtn && right) {
            NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:rightBtn.titleLabel.font, NSFontAttributeName, nil];
            CGFloat width = [rightBtn.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
            width += 10;
            rightBtn.frame = CGRectMake(SCREEN_WIDTH - width-10, 0, width, self.height-40);
            rightBtn.bottom = self.height-10;
            [rightBtn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:rightBtn];
        }
    }
    return self;
}
- (UILabel *)lb_title{
    if (!_lb_title) {
        _lb_title = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 120)/2, 0, 120, self.height-20)];
        _lb_title.bottom = self.height;
        _lb_title.font = [UIFont systemFontOfSize:20.f];
        _lb_title.textAlignment = NSTextAlignmentCenter;
        _lb_title.textColor = colorWith01;
    }
    return _lb_title;
}
- (UIButton *)btn_left{
    if (!_btn_left) {
        _btn_left = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, self.height)];
        [_btn_left addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        [_btn_left setImageEdgeInsets:UIEdgeInsetsMake(0, -60, -20, 0)];
        [_btn_left setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    }
    return _btn_left;
}
- (UIView *)v_dash{
    if (!_v_dash) {
        _v_dash = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-0.5, SCREEN_WIDTH, 0.5)];
        _v_dash.backgroundColor = UICOLOR_RGB(200, 200, 200);
    }
    return _v_dash;
}
#pragma mark - action
- (IBAction)leftClick:(id)sender{
    if (self.leftBlock) {
        self.leftBlock();
    }
}
- (IBAction)rightClick:(id)sender{
    if (self.rightBlock) {
        self.rightBlock();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
