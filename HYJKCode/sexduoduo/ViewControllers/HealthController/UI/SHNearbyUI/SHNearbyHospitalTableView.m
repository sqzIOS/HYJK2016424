//
//  SHNearbyHospitalTableView.m
//  SexHealth
//
//  Created by ly1992 on 15/6/30.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHNearbyHospitalTableView.h"
#import "SHNearbyHospitalCell.h"
#import "SHNearbyHospitalModel.h"

@implementation SHNearbyHospitalTableView

- (id)initWithHospitalTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC
{
    if(self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        self.frame = frame;
        self.mainVC = VC;
        self.rowHeight = kNearbyHospitalCellHeight;
    }
    return self;
}
-(void)setTvData:(NSMutableArray *)tvData
{
    [self initData:tvData];
}
- (void)initData:(NSArray*)data
{
    if (_tvData == nil) {
        _tvData = [[NSMutableArray alloc]init];
    }
    [_tvData removeAllObjects];
    [_tvData addObjectsFromArray:data];
    [self reloadData];
}

#pragma mark ---TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tvData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showUserInfoCellIdentifier = @"SHNearbyHospitalCell";
    SHNearbyHospitalCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell) {
        cell = [[SHNearbyHospitalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
    }
    SHNearbyHospitalInfo *info = _tvData[indexPath.row];
    [cell initTableViewCellModel:info];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
}
@end
