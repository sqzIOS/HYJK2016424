//
//  CommentBar.m
//  
//
//  Created by apple on 16/1/29.
//
//

#import "CommentBar.h"

@implementation CommentBar

+ (instancetype)commentBarWithFrame:(CGRect)frame andMargin:(CGFloat)margin
{
    CommentBar *commentBar = [[CommentBar alloc] init];
    commentBar.frame = frame;
    for (int i = 1; i<=5; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:@"notSelect"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"didSelect"] forState:UIControlStateSelected];

        [btn addTarget:commentBar action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat btnW = (frame.size.width - margin * 6) / 5;
        CGFloat btnH = btnW;
        CGFloat btnY = ( frame.size.height - btnW ) / 2;
        CGFloat btnX = (margin + btnW) * (i - 1) + margin;
        CGRect btnFrame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.frame = btnFrame;
        
        [commentBar addSubview:btn];
    }
    
    return  commentBar;
}

- (void)btnClick:(UIButton *)clickedBtn
{
    for (UIButton *btn in self.subviews) {
        btn.selected = (btn.tag <= clickedBtn.tag);
    }
    self.value = (int)clickedBtn.tag;
    if ([self.delegate respondsToSelector:@selector(commentBar:didSetValue:)]) {
        [self.delegate commentBar:self didSetValue:self.value];
    }
}

- (void)setValue:(int)value
{
    _value = value;
    
    for (UIButton *btn in self.subviews) {
         btn.selected = (btn.tag <= value);
    }
}

@end
