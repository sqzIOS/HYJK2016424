//
//  SHActivityCell.m
//  sexduoduo
//
//  Created by shown on 15/9/30.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//
#define kBottomLabelHeight  70
#import "SHActivityCell.h"
@interface SHActivityCell ()
@property (nonatomic, strong) UILabel *lb_content;
@property (nonatomic, strong) UIView *v_dash;
@property (nonatomic, strong) UILabel *lb_storey;
@property (nonatomic, strong) UILabel *lb_date;
@property (nonatomic, strong) UILabel *lb_userName;
@property (nonatomic, strong) UILabel *lb_reply;
@end
@implementation SHActivityCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    [self.contentView addSubview:self.lb_content];
    
    self.v_dash.top = self.lb_content.bottom + 15;
    [self.contentView addSubview:self.v_dash];
    
    [self.contentView addSubview:self.lb_storey];
    [self.contentView addSubview:self.lb_date];
    
    self.lb_userName.width = SCREEN_WIDTH/3 - self.lb_reply.width;
    [self.contentView addSubview:self.lb_userName];
    
    self.lb_reply.left = self.lb_userName.right;
    [self.contentView addSubview:self.lb_reply];
}
#pragma mark -UI
- (UILabel *)lb_content{
    if (!_lb_content) {
        _lb_content = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, SCREEN_WIDTH - 20*2, 0)];
        _lb_content.font = FONT(15);
        _lb_content.textColor = colorWith02;
    }
    return _lb_content;
}
- (UIView *)v_dash{
    if (!_v_dash) {
        _v_dash = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        _v_dash.backgroundColor = colorWith04;
    }
    return _v_dash;
}
- (UILabel *)lb_storey{
    if (!_lb_storey) {
        _lb_storey = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3, kBottomLabelHeight)];
        _lb_storey.backgroundColor = colorWith04;
        _lb_storey.textAlignment = NSTextAlignmentCenter;
    }
    return _lb_storey;
}
- (UILabel *)lb_date{
    if (!_lb_date) {
        _lb_date = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, kBottomLabelHeight)];
        _lb_date.backgroundColor = colorWith04;
        _lb_date.textAlignment = NSTextAlignmentCenter;
    }
    return _lb_date;
}
- (UILabel *)lb_userName{
    if (!_lb_userName) {
        _lb_userName = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2/3, 0, 0, kBottomLabelHeight)];
        _lb_userName.textColor = RGBACOLOR(121, 205, 145, 1);
        _lb_userName.textAlignment = NSTextAlignmentRight;
    }
    return _lb_userName;
}
- (UILabel *)lb_reply{
    if (!_lb_reply) {
        _lb_reply = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, kBottomLabelHeight)];
        _lb_reply.textColor = colorWith04;
        _lb_reply.text = @"回复";
    }
    return _lb_reply;
}
@end
