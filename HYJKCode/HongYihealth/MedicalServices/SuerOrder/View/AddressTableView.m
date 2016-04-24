//
//  AddressTableView.m
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能: address tableView

#import "AddressTableView.h"

@implementation AddressTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
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
 
    static NSString *identify = @"AddressTableViewCell";
    AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[AddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    NSDictionary *dict = _dataArr[indexPath.row];
    cell.lab.text = dict[@"shipping_name"];
    cell.addressLab.text = dict[@"shipping_area_name"];
//    AddressModel *model = _dataArr[indexPath.row];
    [cell theDateWith:nil];
//    if (model.isSelected) {
//        _selectedIndexPath = indexPath;
//        _selectedStr = model.address;
//    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressTableViewCell *cell = (AddressTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressTableViewCell *cell = (AddressTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
//    _selectedCell = (AddressTableViewCell *)[tableView cellForRowAtIndexPath:_selectedIndexPath];
    if (![_selectedCell isEqual:cell] && _selectedCell) {
        _selectedCell.imageView1.image = [UIImage imageNamed:@"order_agree_n"];
        cell.imageView1.image = [UIImage imageNamed:@"order_agree_p"];
        _selectedCell = cell;

    } else if (!_selectedCell) {
        cell.imageView1.image = [UIImage imageNamed:@"order_agree_p"];
        _selectedCell = cell;
    }
//    _selectedIndexPath = indexPath;
//    AddressModel *model = _dataArr[indexPath.row];
    NSDictionary *dict = _dataArr[indexPath.row];
    _idStr = dict[@"shipping_id"];
    _selectedStr = dict[@"shipping_name"];
}

@end
