//
//  MyCenterBaseController.h
//  
//
//  Created by wenzhizheng on 16/1/8.
//
//

#import <UIKit/UIKit.h>

@interface MyCenterBaseController : UIViewController


@property (nonatomic,copy) NSString *titleStr;
@property (nonatomic,weak) UIView *topView;
@property (nonatomic) BOOL isNeedBack;

// 根据键盘调整frame
@property (nonatomic) int margin;


- (void)setTopView;



@end
