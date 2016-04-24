//
//  CalendarHeadView.h
//
//
//  Created by 刘朝涛 on 16/1/7.
//
//  功能：预约日期

#import <UIKit/UIKit.h>
#import "CalendarCollectionView.h"


@protocol CalendarHeadViewDelegate <NSObject>

- (void)selectTime;

- (void)sureTime:(NSString *)selectTime Date:(NSString *)selectDate;

@end

@interface CalendarHeadView : UIView

@property (nonatomic, strong) CalendarCollectionView *collectionView;

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *calendarTitleLab;    //显示当前几年几月

@property (nonatomic, strong) UIView *bgView2;

@property (nonatomic, strong) UIView *bgView3;

@property (nonatomic, strong) UIView *bgView4;

@property (nonatomic, strong) UILabel *selectedDate;    //选中的日期

@property (nonatomic, strong) UILabel *selectedTime;    //选择的时间

@property (nonatomic, strong) UIButton *selectedBtn;    //确定按钮

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSDate *currentDate;  //当前日期

@property (nonatomic, assign) id<CalendarHeadViewDelegate> delegate;

//- (instancetype)initWithFrame:(CGRect)frame Array:(NSMutableArray *)dateArr;

@end
