//
//  SearchHeadView.m
//  搜索以及纪录保存
//
//  Created by shown on 16/1/8.
//  Copyright (c) 2016年 shown. All rights reserved.
//  功能：搜索tableView headView

#import "SearchHeadView.h"

@interface SearchHeadView ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *bgImageView; //背景图

@property (nonatomic, strong) UIImageView *searchImageview; //搜索背景图

@end

@implementation SearchHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initView];
    }
    return self;
}

- (void)initView {
    
    UIImage *image = [UIImage imageNamed:@"searchBg"];
    _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MAKEOF5(320), MAKEOF5(51))];
    _bgImageView.image = image;
    _bgImageView.userInteractionEnabled = YES;
    [self addSubview:_bgImageView];
    
    image = [UIImage imageNamed:@"search_line"];
    _searchImageview = [[UIImageView alloc] initWithFrame:CGRectMake(MAKEOF5(12), _bgImageView.height/2. - MAKEOF5(35)/2., MAKEOF5(296), MAKEOF5(35))];
    _searchImageview.image = image;
    _searchImageview.userInteractionEnabled = YES;
    [_bgImageView addSubview:_searchImageview];
    
    
    _editF = [[UITextField alloc] initWithFrame:CGRectMake(MAKEOF5(15), 0, _searchImageview.width - MAKEOF5(30), _searchImageview.frame.size.height)];
    _editF.backgroundColor = [UIColor clearColor];
    _editF.placeholder = @"请输入医生姓名";
    _editF.font = FONT_WITH_SIZE(MAKEOF5(13));
    _editF.borderStyle = UITextBorderStyleNone;
    _editF.delegate = self;
    _editF.returnKeyType = UIReturnKeySearch;
    [_searchImageview addSubview:_editF];
    
//
    image = [UIImage imageNamed:@"srearch_n"];
    _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _searchBtn.frame = CGRectMake(_searchImageview.width - MAKEOF5(53.5), 0, MAKEOF5(53.5), _searchImageview.height);
    [_searchBtn setBackgroundImage:image forState:UIControlStateNormal];
    [_searchBtn addTarget:self action:@selector(searchBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_searchImageview addSubview:_searchBtn];
    _searchBtn.enabled = NO;
    
    CGRect rect = self.frame;
    rect.size.height = _bgImageView.height;
    self.frame = rect;
}
/**
 *  搜索
 */
- (void)searchBtnAction {
    if (_editF.text.length > 0) {
        if (_SearchHeadViewBlock) {
            _SearchHeadViewBlock(_editF.text);
            _editF.text = @"";
            [_searchBtn setBackgroundImage:[UIImage imageNamed:@"srearch_n"] forState:UIControlStateNormal];
            [_editF resignFirstResponder];
            if (_headDelegate) {
                [_headDelegate showMaskView:NO];
            }
        }
    }
}

#pragma mark --- <UITextFieldDelegate>
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (_editF.text.length > 0) {
        if (_SearchHeadViewBlock) {
            _SearchHeadViewBlock(_editF.text);
            _editF.text = @"";
            [_searchBtn setBackgroundImage:[UIImage imageNamed:@"srearch_n"] forState:UIControlStateNormal];
            [_editF resignFirstResponder];
            if (_headDelegate) {
                [_headDelegate showMaskView:NO];
            }
        }
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (_headDelegate) {
        [_headDelegate showMaskView:YES];
    }
    return YES;
}

@end
