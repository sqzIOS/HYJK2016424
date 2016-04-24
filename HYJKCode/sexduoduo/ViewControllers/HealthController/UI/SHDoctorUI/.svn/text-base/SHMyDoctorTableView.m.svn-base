//
//  SHMyDoctorTableView.m
//  SexHealth
//
//  Created by ly1992 on 15/6/19.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHMyDoctorTableView.h"
#import "SHMydoctorModel.h"
#import "SHMydoctorCell.h"
#import "SHHistoryCell.h"
//#import "SHProblemDetailVC.h"
#import "SHVIPVC.h"
#import "SHDoctorDetailVC.h"
@implementation SHMyDoctorTableView
- (id)initWithTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC withType:(NSInteger)type
{
    if(self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        self.frame = frame;
        self.type = type;
        self.mainVC = VC;
//        self.rowHeight = kNearbyHospitalCellHeight;
    }
    return self;
}
-(void)setDocData:(NSMutableArray *)docData
{
    [self initData:docData];
}
- (void)setHosData:(NSMutableArray *)hosData
{
    [self initData:hosData];
}
- (void)initData:(NSArray*)data
{
    if (_docData == nil) {
        _docData = [[NSMutableArray alloc]init];
    }
    if (_hisData == nil) {
        _hisData = [[NSMutableArray alloc]init];
    }
    if (_type == 1) {
        [_docData removeAllObjects];
        [_docData addObjectsFromArray:data];
    } else if(_type == 2){
        [_hisData removeAllObjects];
        [_hisData addObjectsFromArray:data];
    }
    [self reloadData];
}
//#pragma mark ---action 事件
//- (void)bt_action_event:(UIButton*)sender
//{
//    NSInteger index = sender.tag;
//    [SHVIPVC gotoMySelf:self.mainVC withType:SHExternalTypeDoctor];
//}


#pragma mark ---TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_type == 1) {
        return _docData.count;
    } else if(_type == 2){
        return _hisData.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_type == 1)
    {
        static NSString *showUserInfoCellIdentifier = @"SHMydoctorCell";
        SHMydoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
        if (!cell) {
            cell = [[SHMydoctorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
        }
        cell.backgroundColor=[UIColor whiteColor];
        SHMydoctorInfo *info = _docData[indexPath.row];
        [cell initDoctorTableCellModel:info];
//        [cell.callBtn addTarget:self action:@selector(bt_action_event:) forControlEvents:UIControlEventTouchUpInside];
//        cell.callBtn.tag = 1000 + indexPath.row;
        return cell;
    }else if (_type == 2)
    {
        static NSString *showUserInfoCellIdentifier = @"SHHistoryCell";
        SHHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
        if (!cell) {
            cell = [[SHHistoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
        }
        SHHistoryInfo *info = _hisData[indexPath.row];
        [cell initTableCellModel:info];
        return cell;
    }
    
    return nil;
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    SHMydoctorInfo *info = _docData[indexPath.row];
//    return [SHMydoctorCell getDoctorTableViewCellModel:info];
    
    if (_type == 1) {
//        SHMydoctorInfo *info = _docData[indexPath.row];
//        return [SHMydoctorCell getDoctorTableViewCellModel:info];
        
        return kNearbyHospitalCellHeight;
    } else if(_type == 2) {
        return [SHHistoryCell getTableViewCellHeight];
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
    SHMydoctorInfo *model = _docData[indexPath.row];
    [SHDoctorDetailVC gotoMySelf:self.mainVC withModel:model.nearbyDoctorId];
    
}
@end
