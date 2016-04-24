//
//  SHDCUserInteractTableView.m
//  sexduoduo
//
//  Created by shown on 15/9/15.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDCUserInteractTableView.h"
#import "SHDCUserInteractCell.h"
@implementation SHDCUserInteractTableView
//用户互动 －－－TableView
- (id)initWithCopeTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC
{
    
    if(self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        //self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        self.frame = frame;
        self.mainVC = VC;
        self.rowHeight = kSHCopeCellHeight;
        
    }
    return self;
    
}
//-(void)setTvData:(NSMutableArray *)tvData
//{
//    [self initData:tvData];
//}
//- (void)initData:(NSArray*)data
//{
//    if (_tvData == nil) {
//        _tvData = [[NSMutableArray alloc]init];
//    }
//    [_tvData removeAllObjects];
//    [_tvData addObjectsFromArray:data];
//    [self reloadData];
//}
#pragma mark ---TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *showUserInfoCellIdentifier = @"SHDCUserInteractCell";
    SHDCUserInteractCell *cell= [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell)
    {
        cell=[[SHDCUserInteractCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
    }
    return cell;
    /*
     static NSString *showUserInfoCellIdentifier = @"SHProblemDetailCell";
     SHProblemDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
     if (!cell) {
     cell = [[SHProblemDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
     }
     SHCommentInfo *info = _tvData[indexPath.row];
     [cell initTableCellModel:info];
     return cell;
     */
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    //    SHCopeDetailVC *vc=[[SHCopeDetailVC alloc]init];
    //SHCopeInfo *info = _tvData[indexPath.row];
    
    //[SHCopeDetailVC gotoMySelf:self.mainVC withIdStr:info.idStr];
    
    
    
    
    
}

@end