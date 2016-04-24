//
//  CTBtn.m
//  
//
//  Created by 刘朝涛 on 16/1/1.
//
//

#import "CTBtn.h"

@implementation CTBtn

- (instancetype)init {
    if (self = [super init]) {
    
        [self initView];
    }
    return self;
}

- (void)initView {
    
    self.btnIcon = [[UIImageView alloc] init];
    [self addSubview:self.btnIcon];
    
    self.btnTitle = [[UILabel alloc] init];
    [self addSubview:self.btnTitle];
    
    self.btnMinTitle = [[UILabel alloc] init];
    [self addSubview:self.btnMinTitle];
    
}

@end
