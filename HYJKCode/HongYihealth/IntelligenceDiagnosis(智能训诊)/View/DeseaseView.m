//
//  DeseaseView.m
//  
//
//  Created by wenzhizheng on 16/1/10.
//
//

#import "DeseaseView.h"

@interface DeseaseView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;


@end


@implementation DeseaseView


-(void)setDesease:(Desease *)desease
{
    _desease = desease;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:desease.category_img]];
    self.label.text = desease.name;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    
    if (point.x < touch.view.width / 4 || point.x > touch.view.width * 0.75) {
        return;
    }
    if (point.y < touch.view.height / 4 || point.y > touch.view.height * 0.75) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(deseaseViewDidChoose:)]) {
        [self.delegate deseaseViewDidChoose:self];
    }
}


@end
