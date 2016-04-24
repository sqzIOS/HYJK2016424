//
//  UIScrollView+extend.m
//  
//
//  Created by apple on 16/1/11.
//
//

#import "UIScrollView+extend.h"

@implementation UIScrollView (extend)

- (int)pageNumber
{
    int pageNumber;
    
    pageNumber = (self.contentOffset.x + self.frame.size.width / 2) / self.frame.size.width;
    
    return pageNumber;
}

@end
