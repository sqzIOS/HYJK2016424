//
//  UIImageView+NetWorking.m
//  Sexduoduo
//
//  Created by ly1992 on 15/5/30.
//  Copyright (c) 2015年 ly. All rights reserved.
//

#import "UIImageView+NetWorking.h"
#import "UIImageView+WebCache.h"
#import "JRSwizzle.h"

#import <objc/runtime.h>
#import <execinfo.h>

static char imageURLKey;
static char imageModelKey;
static char imageStatusKey;
static char imageTapEventKey;

static char imageLoadedModelKey;
static char imageLoadedEventKey;

@implementation UIImageView (NetWorking)


#pragma mark ---初始化 属性
- (void)setStatus:(LYImageViewStatus)status
{
    objc_setAssociatedObject(self, &imageStatusKey, @(status), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (LYImageViewStatus)status
{
    NSNumber *value = objc_getAssociatedObject(self, &imageStatusKey);
    if (value)
    {
        return [value intValue];
    }
    return LYImageViewStatusNone;
}
-(void)setLoadedContentModel:(NSInteger)loadedContentModel
{
    NSNumber *value = [[NSNumber alloc] initWithInteger:loadedContentModel];
    objc_setAssociatedObject(self, &imageLoadedModelKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSInteger)loadedContentModel
{
    NSNumber *value = objc_getAssociatedObject(self, &imageLoadedModelKey);
    if(value){
        return [value intValue];
    }
    return -1;
}
- (void)setImageModel:(id)imageModel
{
    objc_setAssociatedObject(self, &imageModelKey, imageModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id)imageModel
{
    return objc_getAssociatedObject(self, &imageModelKey);
}


- (id)imageURL_SD
{
    return objc_getAssociatedObject(self, &imageURLKey);
}

/**
 *  imageURL 远程图片地址
 *
 *  @param imageURL 获取
 */
- (void)setImageURLFromCache:(id)imageURL
{
    [self sy_loadTapEvent];
    self.status = LYImageViewStatusLoaded;
    if (self.loadedContentModel >= 0 && self.contentMode != self.loadedContentModel)
    {
        self.contentMode = self.loadedContentModel;
    }
    objc_setAssociatedObject(self, &imageURLKey, imageURL, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(void)setImageURL_SD:(id)imageURL_SD
{
    [self sy_loadTapEvent];
    objc_setAssociatedObject(self, &imageURLKey, imageURL_SD, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (imageURL_SD)
    {
        [self reloadImageURL];
    }
    else
    {
        [self sy_cancelCurrentImageLoad];
        self.image = nil;
        self.backgroundColor = colorFrom16RGB(0xfff4fc);
        self.status = LYImageViewStatusNone;
        
        UIActivityIndicatorView *pv = [self sy_progressView:NO];
        pv.hidden = YES;
        [pv removeFromSuperview];
    }

}

- (void)sy_loadTapEvent
{
    self.userInteractionEnabled = YES;
    static char tapEventLoadedKey;
    id loaded = objc_getAssociatedObject(self, &tapEventLoadedKey);
    if (loaded == nil)
    {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sy_handleTapEvent:)];
        [self addGestureRecognizer:tap];
        objc_setAssociatedObject(self, &tapEventLoadedKey,tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)reloadImageURL
{
    id imageURL = self.imageURL_SD;
    if ([imageURL isKindOfClass:[NSString class]])
    {
        if ([imageURL isEqualToString:@""] == NO)
        {
            imageURL = [NSURL URLWithString:imageURL];
        }
    }
    if ([imageURL isKindOfClass:[NSURL class]] == NO)
    {
        return;
    }
    
    [self sy_cancelCurrentImageLoad];
    
    self.image = nil;
    self.backgroundColor = colorWithSDImage_bg;
    
    __weak UIImageView *wself = self;
    
    self.contentMode = UIViewContentModeScaleAspectFill;
    
    self.status = LYImageViewStatusLoading;
    
    __weak __block UIActivityIndicatorView *pv = [self sy_progressView:YES];
    pv.hidden = YES;
    dispatch_async(dispatch_get_main_queue(), ^{
        pv.hidden = NO;
    });
    
    [self sd_setImageWithURL:imageURL placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        //加载 进度条
//        float pvalue = MAX(0, MIN(1, receivedSize / (float) expectedSize));
        dispatch_main_sync_safe(^{
            if(!pv){
                pv = [wself sy_progressView:YES];
            }
            if(wself.image == nil){
                pv.hidden = NO;
            }
            CGSize size = wself.bounds.size;
            CGPoint center = CGPointMake(size.width / 2, size.height / 2);
            pv.size = CGSizeMake(20, 20);
//            if (pv.width != size.width)
//            {
//                pv.width = size.width * 0.76;
//            }
            if (CGPointEqualToPoint(pv.center, center) == NO)
            {
                pv.center = center;
            }
            [pv startAnimating];
//           pv.progress = pvalue;
        });

    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if(!pv){
            pv = [wself sy_progressView:NO];
        }
        
        if (image)
        {
            pv.hidden = YES;
            [NSObject asyncMainBlock:^{
//               pv.progress = 0;  //todo
                [pv removeFromSuperview];
            }];
            
            if (wself.loadedContentModel >= 0 && wself.contentMode != wself.loadedContentModel)
            {
                wself.contentMode = wself.loadedContentModel;
                [wself setNeedsDisplay];
            }
            wself.status = LYImageViewStatusLoaded;
            if(wself.onImageLoadedBlock)
            {
                wself.onImageLoadedBlock(wself);
            }
            
            wself.backgroundColor = [UIColor clearColor];
            
        }
        else
        {
            if (error)
            {
                [pv stopAnimating];
                pv.hidden = YES;
                wself.status = LYImageViewStatusFail;
                dispatch_async(dispatch_get_main_queue(), ^{
                    pv.hidden = YES;
                    [pv stopAnimating];
//                    pv.progress = 0;
                    [pv removeFromSuperview];
                    //加载失败 默认破图
                    UIImage *remindNoImage = [UIImage imageNamed:@"all_SDWebImage_Fail"];
                    if (wself.width < remindNoImage.size.width || wself.height < remindNoImage.size.height)
                    {
                        wself.contentMode = UIViewContentModeScaleAspectFit;
                    }
                    else
                    {
                        wself.contentMode = UIViewContentModeCenter;
                    }
                    wself.image = remindNoImage;
                    [wself setNeedsDisplay];
                });
            }
        }

    }];
    
}
#pragma mark ---图片点击事件
static double __imageTapTime;
static CGPoint __imageTapLocation;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    UITouch* touch = [touches anyObject];
    __imageTapLocation = [touch locationInView:[UIApplication sharedApplication].keyWindow];
    __imageTapTime = CFAbsoluteTimeGetCurrent();
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    if(__imageTapTime > 0)
    {
        double time = CFAbsoluteTimeGetCurrent();
        double time_diff = time - __imageTapTime;
        
        UITouch* touch = [touches anyObject];
        CGPoint location = [touch locationInView:[UIApplication sharedApplication].keyWindow];
        
        CGFloat xDist = (location.x - __imageTapLocation.x);
        CGFloat yDist = (location.y - __imageTapLocation.y);
        double  location_diff = sqrt((xDist * xDist) + (yDist * yDist));
        if(time_diff<0.5 && location_diff < 20)
        {
            [self sy_handleTapEvent:nil];
        }
        __imageTapTime = 0;
        __imageTapLocation = CGPointZero;
    }
}
- (void)setOnImageLoadedBlock:(void (^)(UIImageView *))onImageLoadedBlock
{
    objc_setAssociatedObject(self, &imageLoadedEventKey, onImageLoadedBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(void (^)(UIImageView *))onImageLoadedBlock
{
    return objc_getAssociatedObject(self, &imageLoadedEventKey);
}


- (void)setOnTouchTapBlock:(void (^)(UIImageView *))onTouchTapBlock
{
    [self sy_loadTapEvent];
    objc_setAssociatedObject(self, &imageTapEventKey, onTouchTapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIImageView *))onTouchTapBlock
{
    return objc_getAssociatedObject(self, &imageTapEventKey);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.sd_imageURL && self.status != LYImageViewStatusFail && self.onTouchTapBlock == nil)
    {
        return NO;
    }
    return [super pointInside:point withEvent:event];
}

- (void)sy_cancelCurrentImageLoad
{
    if (self.sd_imageURL)
    {
        void *callstack[2];
        int frames = backtrace(callstack, 2);
        char **strs = backtrace_symbols(callstack, 2);
        NSString *func_name = nil;
        if (frames > 1 && strs && strs[1])
        {
            func_name = [NSString stringWithUTF8String:strs[1]];
        }
        free(strs);
        
        //如果从外部调用 cancelImageLoad  才进行扫尾工作
        if ([func_name rangeOfString:@"UIImageView(WebCache)"].length == 0)
        {
            UIActivityIndicatorView *pv = [self sy_progressView:NO];
            pv.hidden = YES;
            [pv removeFromSuperview];
            
            self.status = LYImageViewStatusNone;
        }
    }
    [self sy_cancelCurrentImageLoad];
}

- (void)sy_handleTapEvent:(UITapGestureRecognizer *)sender
{
    switch (self.status)
    {
        case LYImageViewStatusFail:
            [self reloadImageURL];
            break;
        default:
            if (self.onTouchTapBlock)
            {
                self.onTouchTapBlock(self);
            }
            break;
    }
}

#pragma mark --- load
+ (void)load
{
    [UIImageView jr_swizzleMethod:@selector(cancelCurrentImageLoad) withMethod:@selector(sy_cancelCurrentImageLoad) error:nil];
}

#pragma mark ---图片加载中 图片动作
- (UIActivityIndicatorView *)sy_progressView:(BOOL)isCreate
{
    static char imageProgressKey;
    UIActivityIndicatorView *progressView = objc_getAssociatedObject(self, &imageProgressKey);
    if (isCreate)
    {
        if (progressView == nil)
        {
            progressView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
            progressView.hidden = YES;
            
            objc_setAssociatedObject(self, &imageProgressKey, progressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        };
        progressView.center = CGPointMake(self.width / 2, self.height / 2);
        
        __weak UIImageView* wself = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [wself addSubview:progressView];
        });
    }
    return progressView;
}

@end
