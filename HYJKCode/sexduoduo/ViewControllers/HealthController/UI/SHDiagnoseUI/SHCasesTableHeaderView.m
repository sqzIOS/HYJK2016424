//
//  SHCasesTableHeaderView.m
//  sexduoduo
//
//  Created by shown on 15/9/6.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHCasesTableHeaderView.h"

@implementation SHCasesTableHeaderView

-(id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor=[UIColor redColor];
        
        [self initView];
        
    }
    return self;
}
- (void)initView
{
    self.sexLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 20, 20)];
    self.sexLabel.backgroundColor=[UIColor redColor];
    [self addSubview:self.sexLabel];
    
    self.ageLabel=[[UILabel alloc]initWithFrame:CGRectMake(45, 5, 50, 20)];
    self.ageLabel.backgroundColor=[UIColor redColor];
    [self addSubview:self.ageLabel];
    
    self.headerImageVC=[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-80, 5, 40, 40)];
    self.headerImageVC.backgroundColor=[UIColor redColor];
    [self addSubview:self.headerImageVC];
    
    self.problemlabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 45, 60, 20)];
    self.problemlabel.backgroundColor=[UIColor redColor];
    [self addSubview:self.problemlabel];
    
    self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-90, 45, 60, 20)];
    self.nameLabel.backgroundColor=[UIColor blueColor];
    [self addSubview:self.nameLabel];
    
    self.contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 70, self.frame.size.width-20, 80)];
    self.contentLabel.backgroundColor=[UIColor yellowColor];
    [self addSubview:self.contentLabel];
    
}
- (void)initData
{
    self.sexLabel.text=@"男";
    self.ageLabel.text=@"23";
    self.problemlabel.text=@"问题详情";
    self.nameLabel.text=@"林韦君医师";
    self.contentLabel.text=@"你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗你是猪吗";
}
@end
