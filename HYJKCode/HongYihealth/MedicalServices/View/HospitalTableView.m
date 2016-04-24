//
//  HospitalTableView.m
//
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能：医院tableView

#import "HospitalTableView.h"

@implementation HospitalTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Arr:(NSArray *)arr{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataArr = arr;
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"HospitalTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = FONT_WITH_SIZE(MAKEOF5(13));
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 43, SCREEN_WIDTH, 1)];
        line.backgroundColor = colorWith05;
        [cell.contentView addSubview:line];
    }
    HospitalModel *model = _dataArr[indexPath.row];
    cell.textLabel.text = model.brand_name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //??? 点击事件
    if (_hosBlock) {
        _hosBlock(indexPath);
    }
}
@end
