//
//  QzImageView.m
//  sexduoduo
//
//  Created by showm on 15/6/16.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "QzImageView.h"

@implementation QzImageView



- (void)qzSetImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self startWaitting];
    
    self.contentMode = UIViewContentModeScaleAspectFill;
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [self stopWaitting];
    }];
}
- (void)qzSetImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock
{
    [self startWaitting];
    self.contentMode = UIViewContentModeScaleAspectFill;

    
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        
        [self stopWaitting];
        
        completedBlock(image,error,cacheType,imageURL);
        
        
    }];
}
-(void)startWaitting
{
    if (_waittingView == nil) {
        _waittingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:_waittingView];
    }
    
    if (_waittingView) {
        _waittingView.hidden = NO;
        _waittingView.center = CGPointMake(self.width/2, self.height/2);
        [_waittingView startAnimating];
    }
}

-(void)stopWaitting
{
    if (_waittingView) {
        _waittingView.hidden = YES;
        [_waittingView stopAnimating];
    }
}

- (void)qzCancelCurrentImageLoad;//取消下载
{
//    [[SDWebImageManager sharedManager] cancelForDelegate:self];
    [self sd_cancelCurrentImageLoad];
    [self stopWaitting];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
