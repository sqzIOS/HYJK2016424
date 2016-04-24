//
//  CalendarCollectionView.h
//  选择日期
//
//  Created by shown on 16/1/7.
//  Copyright (c) 2016年 shown. All rights reserved.
//  功能：日历UICollectionView

#import <UIKit/UIKit.h>
#import "CalenderCell.h"

@interface CalendarCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *dateArr;

@property (nonatomic, copy) void (^collectionBlock)(CalenderModel *model);

@property (nonatomic, strong) CalenderCell *selectedCell;

@property (nonatomic, strong) NSDate *currentDate;  //当前时间

@end
