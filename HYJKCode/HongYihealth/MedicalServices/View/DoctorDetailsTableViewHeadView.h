//
//  DoctorDetailsTableViewHeadView.h
//
//
//  Created by 刘朝涛 on 16/1/2.
//
//  功能：医师详情头部视图

#import <UIKit/UIKit.h>
#import "ConsultingModel.h"

typedef enum {
    
    ForServer = 0,
    ForPhysical
    
}DoctorDetailsVCType;

@protocol HeadViewDelegate <NSObject>

- (void)changeHeight;

@end

@interface DoctorDetailsTableViewHeadView : UIView

@property (nonatomic, strong) UIImageView *headImageView;   //头像

@property (nonatomic, strong) UILabel *nameLab; //姓名

@property (nonatomic, strong) UILabel *jobLab;  //主任医师

@property (nonatomic, strong) UILabel *jobLab2;  //教授

@property (nonatomic, strong) UILabel *deparmentLab;    //科室

@property (nonatomic, strong) UILabel *hospitalLab; //医院名称

@property (nonatomic, strong) UIView *line; //分割线

@property (nonatomic, strong) UIView *line2; //分割线

@property (nonatomic, strong) UIView *line3; //分割线

@property (nonatomic, strong) UIImageView *icon;

@property (nonatomic, strong) UILabel *lab;

@property (nonatomic, strong) UILabel *introduceLab;

@property (nonatomic, strong) UIButton *attentionBtn;   //关注按钮

@property (nonatomic, strong) CTBtn *unfoldBtn;  //展开按钮

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) ConsultingModel *model;

@property (nonatomic, assign) id<HeadViewDelegate> delegate;

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) BOOL isSelectedWithUnfoldBtn;

@property (nonatomic, assign) DoctorDetailsVCType type;

@property (nonatomic, copy) void(^detailsBlock)();

- (instancetype)initWithFrame:(CGRect)frame Model:(ConsultingModel *)model Type:(DoctorDetailsVCType)type;

- (void)refreshIntrodueLab:(NSString *)str;

- (void)changeCollected:(NSString *)collected;

@end
