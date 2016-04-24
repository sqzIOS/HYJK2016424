//
//  SHDCPictureTextTableView.m
//  sexduoduo
//
//  Created by shown on 15/9/18.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCPictureTextTableView.h"
#import "SHDCPictureTextCell.h"
@implementation SHDCPictureTextTableView

- (id)initWithCopeTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC
{
    
    if(self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        self.frame = frame;
        self.mainVC = VC;
        self.rowHeight = 90;
        
    }
    return self;
    
}
#pragma mark ---TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
     static NSString *showUserInfoCellIdentifier = @"SHDCPictureTextCell";
     SHDCPictureTextCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
     if (!cell) {
     cell = [[SHDCPictureTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
     }
     return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
}


@end
