//
//  PhysicalTableView.m
//  
//
//  Created by 刘朝涛 on 16/1/5.
//
//  功能：体检tableView

#import "PhysicalTableView.h"
#import "DoctorDetailsVC.h"

@implementation PhysicalTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Controller:(UIViewController *)vc {
    if (self = [super initWithFrame:frame style:style]) {
        self.mainVC = vc;
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_dataArr.count > 0) {
        return _dataArr.count;
        
    } else if (!_dataArr) {
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
//        [cell theDataWithModel:_dataArr[indexPath.row]];
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
        return MAKEOF5(84.5);
    }
    return self.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DoctorDetailsVC *vc = [[DoctorDetailsVC alloc] initWithType:ForPhysical];
    vc.model = _dataArr[indexPath.row];
    [self.mainVC.navigationController pushViewController:vc animated:YES];
}

@end
