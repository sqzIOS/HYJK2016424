//
//  RatingViewController.m
//  RatingController
//
//  Created by Ajay on 2/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CRatingView.h"

@implementation CRatingView

@synthesize s1, s2, s3, s4, s5;

-(float)imageWidth
{
    return width;
}
-(float)imageHeight
{
    return height;
}
-(void)setImagesDeselected:(NSString *)deselectedImage
			partlySelected:(NSString *)halfSelectedImage
			  fullSelected:(NSString *)fullSelectedImage
 {
	unselectedImage = [UIImage imageNamed:deselectedImage];
	partlySelectedImage = halfSelectedImage == nil ? unselectedImage : [UIImage imageNamed:halfSelectedImage];
	fullySelectedImage = [UIImage imageNamed:fullSelectedImage];
	
	height=0.0; width=0.0;
     
     CGFloat valueMin=1.0;
     if (self.isMin) {
         valueMin=self.imageMultiple;
     }
	if (height < [fullySelectedImage size].height) {
		height = [fullySelectedImage size].height * valueMin;
	}
	if (height < [partlySelectedImage size].height) {
		height = [partlySelectedImage size].height * valueMin;
	}
	if (height < [unselectedImage size].height) {
		height = [unselectedImage size].height * valueMin;
	}
	if (width < [fullySelectedImage size].width) {
		width = [fullySelectedImage size].width * valueMin;
	}
	if (width < [partlySelectedImage size].width) {
		width = [partlySelectedImage size].width * valueMin;
	}
	if (width < [unselectedImage size].width) {
		width = [unselectedImage size].width * valueMin;
	}
	
	starRating = 0;
	lastRating = 0;
	s1 = [[UIImageView alloc] initWithImage:unselectedImage];
	s2 = [[UIImageView alloc] initWithImage:unselectedImage];
	s3 = [[UIImageView alloc] initWithImage:unselectedImage];
	s4 = [[UIImageView alloc] initWithImage:unselectedImage];
	s5 = [[UIImageView alloc] initWithImage:unselectedImage];
	
	[s1 setFrame:CGRectMake(0,         0, width, height)];
	[s2 setFrame:CGRectMake(width,     0, width, height)];
	[s3 setFrame:CGRectMake(2 * width, 0, width, height)];
	[s4 setFrame:CGRectMake(3 * width, 0, width, height)];
	[s5 setFrame:CGRectMake(4 * width, 0, width, height)];
	
	[s1 setUserInteractionEnabled:NO];
	[s2 setUserInteractionEnabled:NO];
	[s3 setUserInteractionEnabled:NO];
	[s4 setUserInteractionEnabled:NO];
	[s5 setUserInteractionEnabled:NO];
	
	[self addSubview:s1];
	[self addSubview:s2];
	[self addSubview:s3];
	[self addSubview:s4];
	[self addSubview:s5];
	
	CGRect frame = [self frame];
	frame.size.width = width * 5;
	frame.size.height = height;
	[self setFrame:frame];
}

-(void)displayRating:(float)rating {
	[s1 setImage:unselectedImage];
	[s2 setImage:unselectedImage];
	[s3 setImage:unselectedImage];
	[s4 setImage:unselectedImage];
	[s5 setImage:unselectedImage];
	
	if (rating >= 0.5) {
		[s1 setImage:partlySelectedImage];
	}
	if (rating >= 1) {
		[s1 setImage:fullySelectedImage];
	}
	if (rating >= 1.5) {
		[s2 setImage:partlySelectedImage];
	}
	if (rating >= 2) {
		[s2 setImage:fullySelectedImage];
	}
	if (rating >= 2.5) {
		[s3 setImage:partlySelectedImage];
	}
	if (rating >= 3) {
		[s3 setImage:fullySelectedImage];
	}
	if (rating >= 3.5) {
		[s4 setImage:partlySelectedImage];
	}
	if (rating >= 4) {
		[s4 setImage:fullySelectedImage];
	}
	if (rating >= 4.5) {
		[s5 setImage:partlySelectedImage];
	}
	if (rating >= 5) {
		[s5 setImage:fullySelectedImage];
	}
	
	starRating = rating;
	lastRating = rating;
	
}

//-(void) touchesBegan: (NSSet *)touches withEvent: (UIEvent *)event
//{
//	[self touchesMoved:touches withEvent:event];
//}
//
//-(void) touchesMoved: (NSSet *)touches withEvent: (UIEvent *)event
//{
//	CGPoint pt = [[touches anyObject] locationInView:self];
//	float newRating = (float) (pt.x / width) + 1;
////	if (newRating < 0.5 || newRating > 5)
////		return;
//	
//	if (newRating != lastRating)
//		[self displayRating:newRating];
//    
//    [viewDelegate ratingBChanged:newRating];
//}
//
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//	[self touchesMoved:touches withEvent:event];
//}

-(float)rating {
	return starRating;
}

@end