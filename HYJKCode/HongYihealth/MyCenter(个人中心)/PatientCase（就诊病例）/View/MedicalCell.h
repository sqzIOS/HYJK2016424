//
//  MedicalCell.h
//  
//
//  Created by wenzhizheng on 16/1/1.
//
//

#import <UIKit/UIKit.h>

@class MedicalCell;

@protocol MedicalCellDelegate <NSObject>

- (void)medicalCell:(MedicalCell *)cell detailStrChanged:(NSString *)titleStr;

@end

@interface MedicalCell : UITableViewCell

@property (nonatomic,copy) NSString *titleStr;
@property (nonatomic,copy) NSString *detailStr;
@property (nonatomic,weak) id<MedicalCellDelegate> delegate;
@property (nonatomic,strong) UIColor *detailStrColor;

+ (instancetype)medicalCell;

@end
