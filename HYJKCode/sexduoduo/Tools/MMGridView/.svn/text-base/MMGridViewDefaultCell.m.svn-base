//
// Copyright (c) 2010-2011 René Sprotte, Provideal GmbH
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
// OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "MMGridViewDefaultCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation MMGridViewDefaultCell

@synthesize textLabel;
@synthesize textLabelBackgroundView;
@synthesize iconImageVIew;

- (void)dealloc
{
    [textLabel release];
    [textLabelBackgroundView release];
    [iconImageVIew release];
    [super dealloc];
}


- (id)initWithFrame:(CGRect)frame 
{
    if ((self = [super initWithFrame:frame])) {
        // Background view
        UIActivityIndicatorView * indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [indicator setUserInteractionEnabled:NO];
        [indicator startAnimating];
        [self addSubview:indicator];
        [indicator setCenter:self.center];
        
        self.iconImageVIew = [[[UIImageView alloc] initWithFrame:CGRectZero] autorelease];
        self.iconImageVIew.layer.borderWidth=0.5f;
        self.iconImageVIew.layer.borderColor=[[UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1] CGColor];
        [self addSubview:self.iconImageVIew];
        
        self.textLabel = [[[UILabel alloc] initWithFrame:self.frame] autorelease];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.font = [UIFont systemFontOfSize:14.0];
        self.textLabel.textAlignment = UITextAlignmentCenter;
        self.textLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:self.textLabel];
        
        // Label
//        self.textLabelBackgroundView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
//        self.textLabelBackgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
//        
//        self.textLabel = [[[UILabel alloc] initWithFrame:CGRectNull] autorelease];
//        self.textLabel.textAlignment = UITextAlignmentCenter;
//        self.textLabel.backgroundColor = [UIColor clearColor];
//        self.textLabel.textColor = [UIColor whiteColor];
//        self.textLabel.font = [UIFont systemFontOfSize:12];
//        
//        [self.textLabelBackgroundView addSubview:self.textLabel];
//        [self addSubview:self.textLabelBackgroundView];
//        self.layer.backgroundColor = UIColor.clearColor.CGColor;
//        self.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:0.5].CGColor;
//        self.layer.borderWidth =0.5;
//        self.layer.cornerRadius = self.layer.cornerRadius;
//  
//        self.layer.shadowColor = [UIColor colorWithWhite:0.12 alpha:0.7].CGColor;
//        self.layer.shadowOffset = CGSizeMake(0, 0.5);
//        self.layer.shadowRadius = 2;
//        self.layer.shadowOpacity = 1;
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    int labelHeight = 18;
//    int inset = 0;
    
    // Background view
    self.iconImageVIew.frame = self.bounds;
    [self.iconImageVIew setClipsToBounds:YES];
//    self.iconImageVIew.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // Layout label
//    self.textLabelBackgroundView.frame = CGRectMake(0, 
//                                                    self.bounds.size.height - labelHeight - inset, 
//                                                    self.bounds.size.width, 
//                                                    labelHeight);
//    self.textLabelBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    
//    // Layout label background
    CGRect f = CGRectMake(0, 
                          0, 
                          self.textLabel.superview.bounds.size.width,
                          self.textLabel.superview.bounds.size.height);
    self.textLabel.frame = f;
    self.textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

@end
