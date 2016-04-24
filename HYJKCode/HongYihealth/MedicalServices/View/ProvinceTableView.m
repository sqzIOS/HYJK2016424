//
//  ProvinceTableView.m
//  
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能：省tableView

#import "ProvinceTableView.h"

@implementation ProvinceTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style Arr:(NSMutableArray *)arr {
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
    static NSString *identify = @"ProvinceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = FONT_WITH_SIZE(MAKEOF5(13));
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 43, SCREEN_WIDTH/2., 1)];
        line.backgroundColor = RGBCOLOR16(0xf8f8f8);
        [cell.contentView addSubview:line];
    }
    ProvinceModel *model = _dataArr[indexPath.row];
    cell.textLabel.text = model.pName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_PBlock) {
        _PBlock(indexPath);
    }
}

@end
