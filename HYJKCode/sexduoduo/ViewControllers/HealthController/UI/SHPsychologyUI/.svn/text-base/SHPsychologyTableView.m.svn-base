//
//  SHPsychologyTableView.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHPsychologyTableView.h"
#import "SHPsychologyHeaderView.h"
#import "SHPsychologyModel.h"
#import "SHMydoctorCell.h"

@interface SHPsychologyTableView()
//广告区域
@property (nonatomic,strong) SHPsychologyHeaderView *headerADView;
//
@property (nonatomic,strong) SHPsychologyModel *model;
@end

@implementation SHPsychologyTableView

- (id)initTableView:(CGRect)frame withVC:(UIViewController*)VC
{
    if(self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.delegate = self;
        self.dataSource = self;
        self.frame = frame;
        self.mainVC = VC;
        [self initView];
        
    }
    return self;
}
#pragma mark ---UI
- (void)initView
{
    if (_headerADView == nil) {
        _headerADView = [[SHPsychologyHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, APP_SPACE(135)) pvc:self.mainVC];
        self.tableHeaderView = _headerADView;
    }
    
}

#pragma mark ---data
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
    static NSString *showUserInfoCellIdentifier = @"SHMydoctorCell";
    SHMydoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell) {
        cell = [[SHMydoctorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
    }
    SHPsychologyInfo *info = _tvData[indexPath.row];
    [cell initPsyTableCellModel:info];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    SHPsychologyInfo *info = _tvData[indexPath.row];
//    return [SHMydoctorCell getPsyTableViewCellModel:info];
    return kNearbyHospitalCellHeight;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
