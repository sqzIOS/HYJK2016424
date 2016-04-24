//
//  TYWaveProgressDemo.m
//  TYWaveProgressDemo
//
//  Created by tanyang on 15/4/14.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "TYWaveProgressView.h"
#import "TYWaterWaveView.h"

@interface TYWaveProgressView ()

@property (nonatomic, strong) TYWaterWaveView *waterWaveView;

@end

@implementation TYWaveProgressView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    [self addBackgroudImageView];
    [self addWaterWaveView];
    [self addBackIconImageView];
}

- (void)addBackgroudImageView
{
    UIImageView *backgroundImageView = [[UIImageView alloc]init];
    [self addSubview:backgroundImageView];
    _backgroundImageView = backgroundImageView;
}

- (void)addWaterWaveView
{
    TYWaterWaveView *waterWaveView = [[TYWaterWaveView alloc]init];
    [self addSubview:waterWaveView];
    _waterWaveView = waterWaveView;
}

- (void)addBackIconImageView
{
    UIImageView *backgroundImageView = [[UIImageView alloc]init];
    [self addSubview:backgroundImageView];
    _backIconImageView = backgroundImageView;
}


- (void)startWave
{
    _waterWaveView.percent = 1.0f;
    [_waterWaveView startWave];
    
}
-(void) stopWave
{
     [_waterWaveView stopWave];
}
- (void)resetWave
{
    [_waterWaveView reset];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _waterWaveView.firstWaveColor = _firstWaveColor;
    _waterWaveView.secondWaveColor = _secondWaveColor;
    
    CGFloat viewHeight = CGRectGetHeight(self.frame);
    CGFloat viewWidth = CGRectGetWidth(self.frame);
    
    _backgroundImageView.frame = self.bounds;
    
    _waterWaveView.frame = CGRectMake( 0, 0, viewWidth, viewHeight);
    _waterWaveView.layer.cornerRadius = viewWidth/2;
    _waterWaveView.layer.masksToBounds = YES;
    
    _backIconImageView.frame = CGRectMake((viewWidth - _backIconImageView.image.size.width)/2, (viewHeight - _backIconImageView.image.size.height)/2, _backIconImageView.image.size.width, _backIconImageView.image.size.height);

}

@end
