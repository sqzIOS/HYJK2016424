//
//  DoctorDetailsTableView.m
//
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能:医师详情tableView

#import "DoctorDetailsTableView.h"

@implementation DoctorDetailsTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_dataArr.count > 0) {
        return _dataArr.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_dataArr.count > 0) {
        static NSString *identify = @"DoctorDetailsTableViewCell";
        DoctorDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[DoctorDetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        [cell theDataWithModel:_dataArr[indexPath.row]];
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.font = FONT_WITH_SIZE(QZMake(13));
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = @"暂无评价~~";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_dataArr.count > 0) {
        DoctorDetailsTableViewCell *cell = (DoctorDetailsTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.height;
    }
    return 44;
}

@end
