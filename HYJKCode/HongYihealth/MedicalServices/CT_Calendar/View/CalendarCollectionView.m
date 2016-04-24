//
//  CalendarCollectionView.m
//  选择日期
//
//  Created by shown on 16/1/7.
//  Copyright (c) 2016年 shown. All rights reserved.
//  功能：日历UICollectionView

#import "CalendarCollectionView.h"

@implementation CalendarCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor whiteColor];
        self.dataSource = self;
        self.delegate = self;
        //注册cell
        [self registerClass:[CalenderCell class] forCellWithReuseIdentifier:IDENTIFY];
        [self registerNib:[UINib nibWithNibName:@"CalenderCell" bundle:nil] forCellWithReuseIdentifier:IDENTIFY];
        
        _currentDate = [NSDate date];
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dateArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalenderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IDENTIFY forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.bgImageView.image = nil;
    CalenderModel *model = _dateArr[indexPath.row];
    cell.dayStr.text = model.day;
    if ([_currentDate currentYear] == [model.year integerValue] && [_currentDate currentMonth] == [model.month integerValue] && [_currentDate currentDay] == [model.day integerValue]) {
        cell.bgImageView.image = [UIImage imageNamed:@"allow"];
        _selectedCell = cell;
    }else {
        if (![cell.dayStr.text isEqualToString:@""]) {
            cell.bgImageView.image = [UIImage imageNamed:@"normal"];
        }
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(38, 38.5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CalenderModel *model = _dateArr[indexPath.row];
    if ([_currentDate currentYear] > [model.year integerValue]) {
        [ShareFunction showToast:@"不能穿越哦!"];
    } else if ([_currentDate currentMonth] > [model.month integerValue]) {
        [ShareFunction showToast:@"不能穿越哦!"];
    } else if ([_currentDate currentDay] > [model.day integerValue]) {
        [ShareFunction showToast:@"不能穿越哦!"];
    }else {
        CalenderCell *cell = (CalenderCell *)[collectionView cellForItemAtIndexPath:indexPath];
        if (![_selectedCell isEqual:cell]) {
            _selectedCell.bgImageView.image = [UIImage imageNamed:@"normal"];
            cell.bgImageView.image = [UIImage imageNamed:@"allow"];
            _selectedCell = cell;
            if (_collectionBlock) {
                _collectionBlock(model);
            }
        }
    }
}


@end
