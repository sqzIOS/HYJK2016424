//
//  PatientListCell.h
//  sexduoduo
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 dbCode. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PatientCaseModel,PatientListCell;

@protocol PatientListCellDelegate <NSObject>

- (void)patientListCellDidSelect:(PatientListCell *)cell;

@end

@interface PatientListCell : UITableViewCell

/**
 * 代理
 */
@property (nonatomic,weak) id<PatientListCellDelegate> delegate;


/**
 * 创建cell
 */
+ (instancetype)cellInTableView:(UITableView *)tableView;


/**
 * 数据模型
 */
@property (nonatomic,strong) PatientCaseModel *model;

/**
 * title
 */
@property (nonatomic,strong) NSString *title;




@end
