//
//  SearchTableView.m
//  搜索以及纪录保存
//
//  Created by shown on 16/1/8.
//  Copyright (c) 2016年 shown. All rights reserved.
//

#import "SearchTableView.h"

@implementation SearchTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Controller:(UIViewController *)vc {
    if (self = [super initWithFrame:frame style:style]) {
        self.mainVC = vc;
        self.backgroundColor = colorWith05;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.delegate = self;
        self.dataSource = self;
    
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"";
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[SearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
//    SearchModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:_dataArr[indexPath.row]];
    [cell theDataWithModel:_dataArr[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DoctorDetailsVC *vc = [[DoctorDetailsVC alloc] initWithType:ForServer];
    vc.model = _dataArr[indexPath.row];
    [self.mainVC.navigationController pushViewController:vc animated:YES];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [super touchesBegan:touches withEvent:event];
//    if ([_tableViewDelegate conformsToProtocol:@protocol(SearchTableViewDelegate)] && [_tableViewDelegate respondsToSelector:@selector(tableView:touchesBegan:withEvent:)]) {
//        [_tableViewDelegate tableView:self touchesBegan:touches withEvent:event];
//    }
//}

@end
