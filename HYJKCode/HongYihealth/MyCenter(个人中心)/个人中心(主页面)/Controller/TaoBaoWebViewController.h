//
//  TaoBaoWebViewController.h
//  sexduoduo
//
//  Created by dsz on 15-1-28.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCenterBaseController.h"
@interface TaoBaoWebViewController :MyCenterBaseController
{
    UIWebView *detaiWebImg;
}
@property (strong,nonatomic)NSString *webURLStr;
@property (strong,nonatomic)NSString *nameStr;
@end
