//
//  SHConsultingCell.m
//  sexduoduo
//
//  Created by shown on 15/9/28.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHConsultingCell.h"
#import "SHConsulting.h"
@interface SHConsultingCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iv_avatar;
@property (weak, nonatomic) IBOutlet UIButton *btn_sex;
@property (weak, nonatomic) IBOutlet UILabel *lb_content;
@property (weak, nonatomic) IBOutlet UILabel *lb_time;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint_sex;

@end
@implementation SHConsultingCell

- (void)awakeFromNib {
    // Initialization code
    self.iv_avatar.layer.borderWidth = 2;
    self.iv_avatar.layer.borderColor = RGBACOLOR(204, 237, 254, 1).CGColor;
    self.iv_avatar.layer.cornerRadius = self.iv_avatar.width/2;
    self.iv_avatar.layer.masksToBounds = YES;
    self.iv_avatar.backgroundColor = RGBACOLOR(162, 200, 251, 1);
    
    self.btn_sex.userInteractionEnabled = NO;
    self.btn_sex.layer.cornerRadius = 3;
    self.btn_sex.layer.masksToBounds = YES;
    [self.btn_sex setImageEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 17)];
    [self.btn_sex setTitleEdgeInsets:UIEdgeInsetsMake(0, -9, 0, 0)];
    
    self.lb_time.textColor = colorWith03;
    self.lb_content.textColor = colorWith02;
}
- (void)loadWithConsult:(SHConsulting *)consult{

    if (consult.headImg && ![consult.headImg isKindOfClass:[NSNull class]]) {
        [self.iv_avatar sd_setImageWithURL:[NSURL URLWithString:consult.headImg] placeholderImage:nil];
    }

    [self.btn_sex setTitle:[NSString stringWithFormat:@"%d",consult.age] forState:UIControlStateNormal];
    if (consult.age>99) {
        self.constraint_sex.constant = 40;
        [self.btn_sex setImageEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 25)];
    }
    if ([consult.sex isEqualToString:@"男"]) {
        self.btn_sex.backgroundColor = RGBACOLOR(253, 156, 157, 1);
        [self.btn_sex setImage:[[UIImage imageNamed:@"health_woman_flag"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }else{
        self.btn_sex.backgroundColor = RGBACOLOR(0, 169, 232, 1);
        [self.btn_sex setImage:[[UIImage imageNamed:@"health_man_flag"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    self.lb_content.text = consult.content;
    self.lb_time.text = [NSString dateFromLongLong:consult.createDate dateFormat:@"yyyy-MM-dd HH:mm"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (CGFloat)getCellHeight
{
    return 90;
}
@end
