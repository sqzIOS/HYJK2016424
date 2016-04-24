//
//  ConsultingTableView.m
//  
//
//  Created by 刘朝涛 on 16/1/1.
//
//  功能: 咨询TableView

#import "ConsultingTableView.h"

@implementation ConsultingTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Controller:(UIViewController *)vc {
    if (self = [super initWithFrame:frame style:style]) {
        self.mainVC = vc;
        self.delegate = self;
        self.dataSource = self;
        self.tableFooterView = [[UIView alloc] init];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_dataArr.count > 0) {
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return _dataArr.count;

    } else if (!_dataArr) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        return 0;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_dataArr.count > 0) {
        static NSString *identify = @"ConsultingTableViewCell";
        ConsultingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[ConsultingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        [cell theDataWith:_dataArr[indexPath.row]];
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"暂无相关数据";
    cell.textLabel.font = FONT_WITH_SIZE(MAKEOF5(13));
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_dataArr.count > 0) {
        UITableView *cell = (UITableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.height;
    }
    return self.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DoctorDetailsVC *vc = [[DoctorDetailsVC alloc] initWithType:ForServer];
    vc.model = _dataArr[indexPath.row];
    [self.mainVC.navigationController pushViewController:vc animated:YES];
}

@end
