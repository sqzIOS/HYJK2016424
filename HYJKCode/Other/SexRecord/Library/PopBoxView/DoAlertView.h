//
//  DoAlertView.h
//  TestAlert
//
//  Created by Donobono on 2013. 12. 19..
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define DO_BUTTON_BOX               RGBCOLOR(255, 255, 255)
#define DO_DESTRUCTIVE_BOX          RGBCOLOR(236, 90, 73)
#define DO_DIMMED_COLOR             RGBACOLOR(0, 0, 0, 0.7)
#define DO_TEXT_FONT        [UIFont fontWithName:@"Avenir-Medium" size:14]
#define DO_LABEL_INSET      UIEdgeInsetsMake(10, 15, 10, 15)
#define DO_TITLE_INSET      UIEdgeInsetsMake(5, 15, 5, 15)
#define DO_VIEW_WIDTH       (int)(SCREEN_WIDTH-40)
#define DO_YES_TAG          100
#define DO_NO_TAG           200
#define DO_ROUND            3

typedef NS_ENUM(int, DoAlertViewTransitionStyle) {
    DoTransitionStyleTopDown = 0,
    DoTransitionStyleBottomUp,
    DoTransitionStyleFade,
    DoTransitionStylePop,
    DoTransitionStyleLine,
};

typedef NS_ENUM(int, DoAlertViewContentType) {
    DoContentNone = 0,
    DoContentImage,
    DoContentMap,
};

@class DoAlertView;
typedef void(^DoAlertViewHandler)(DoAlertView *alertView);

@interface DoAlertView : UIView <MKMapViewDelegate>
{
@private
    NSString                *_strAlertTitle;
    NSString                *_strAlertBody;
    NSString                *_strYesTitle;
    NSString                *_strNoTitle;
    
    BOOL                    _bNeedNo;

    DoAlertViewHandler      _doYes;
    DoAlertViewHandler      _doNo;
    DoAlertViewHandler      _doDone;

    UIWindow                *_alertWindow;
    UIView                  *_vAlert;
}
@property (readwrite)   int         nAnimationType;             // 动画类型
@property (readwrite)   int         nContentMode;               // 带图片，地图
@property (readwrite)   double      dRound;                     // 显示框圆角
@property (readwrite)   BOOL        bDestructive;               // 是否设置背景色
@property (readonly)    int         nTag;

@property (nonatomic, strong)   UIImage         *iImage;      // 带图片
@property (nonatomic, strong)   NSDictionary    *dLocation;   // 带经纬度

+(void)showToastMessage:(NSString *)message;
+(void)showWithNumStr:(NSString *)bcion;

+(void)showToastMessage:(NSString *)title message:(NSString *)message;
+(void)showToastMessage:(NSString *)message
               duration:(double)dDuration
                   done:(DoAlertViewHandler)done;
+(void)showToastMessage:(NSString *)title message:(NSString *)message
               duration:(double)dDuration
                   done:(DoAlertViewHandler)done;

+(void)showWithTitle:(NSString*)title
             message:(NSString*)message
              stryes:(NSString*)stryes
               strno:(NSString*)strno
                 yes:(DoAlertViewHandler)yes
                  no:(DoAlertViewHandler)no;
@end