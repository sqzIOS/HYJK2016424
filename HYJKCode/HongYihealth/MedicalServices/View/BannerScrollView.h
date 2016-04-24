//
//  BannerScrollView.h
//  
//
//  Created by 刘朝涛 on 16/1/1.
//
//

#import <UIKit/UIKit.h>

@interface BannerScrollView : UIScrollView<UIScrollViewDelegate>

@property (nonatomic, copy) NSMutableArray *imageArr;

@property (nonatomic, copy) void (^bannerBlock)(NSInteger index, NSInteger page);

- (void)changeValue:(NSMutableArray *)dataArr;

@end
