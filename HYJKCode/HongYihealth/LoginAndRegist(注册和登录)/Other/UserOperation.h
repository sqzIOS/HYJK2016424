//
//  NetOperation.h
//  
//
//  Created by apple on 16/1/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UserModel.h"
#import "PatientCaseModel.h"
#import "ServiceModel.h"
#import "AddressModel.h"
#import "AreaModel.h"
#import "MessageModel.h"
#import "DorctorModel.h"
#import "BookingModel.h"
#import "ExaminationModel.h"
#import "ShareData.h"
#import "CommentModel.h"

typedef enum {
    SexSecrecy = 0,
    SexMale,
    SexFemale,
} Sex;

#define HOST [NSString stringWithFormat:@"%@?url=",BBS_IP]





@interface UserOperation : NSObject


/**
 * 判断请求是否成功（如果失败则打印请求结果和失败原因）
 */
+ (BOOL)isSucceedWithResponsDict:(NSDictionary *)dict;

/**
 * 获取注册验证码
 */
+ (void)getVerificationCodeWithPhoneNumber:(NSString *)number;

/**
 * 获取修改密码验证
 */
+ (void)getVerificationCodeWithAccount:(NSString *)account;

/**
 * 重置密码
 */
+ (void)updataPasswordWithCode:(NSString *)code account:(NSString *)account password:(NSString *)password succeed:(void(^)())succeed failed:(void(^)())failed
;
/**
 * 用户登陆
 */
+ (void)userSigninWithName:(NSString *)name andPassword:(NSString *)password succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 微信登陆后绑定用户
 */
+ (void)userBindAccount:(NSString *)name andPassword:(NSString *)password succeed:(void(^)())succeed failed:(void(^)())failed;


/**
 * 微信登陆
 */
+ (void)userSignByWXWithUid:(NSString *)uid andNickname:(NSString *)nickname succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 用户注册
 */
+ (void)userSignupWithName:(NSString *)name password:(NSString *)password nick_name:(NSString *)nick_name avatar:(UIImage *)avatar sex:(Sex)sex email:(NSString *)email yzm:(NSString *)yzm field:(NSString *)field invitecode:(NSString *)invitecode succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 获取当前session字典
 */
+ (void)getSession:(void(^)(NSDictionary *session))finished;

/**
 * 获取本地用户信息
 */
+ (UserModel *)getUserFromeLocal;

/**
 * 获取服务器用户信息
 */
+ (void)getUserFromServiceSucceed:(void(^)(UserModel *user))succeed failed:(void(^)())failed;


/**
 * 图片和base64字符串的转换 compress:图片压缩质量
 */
+ (UIImage *)imageWithBase64String:(NSString *)string;
+ (NSString *)stringWithImageBybase64Encoding:(UIImage *)image andCompress:(float)compress;

/**
 * 更新病例
 */
+ (void)updataPatientCase:(PatientCaseModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 增加病例
 */
+ (void)addPatientCase:(PatientCaseModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 设置默认病例
 */
+ (void)setDefaultPatientCase:(NSString *)case_id Succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 是否默认病例
 */
+ (void)hasDefaultPatientCase:(void(^)(NSString *case_id))finished;

/**
 * 删除病例
 */
+ (void)deletePatientCase:(NSString *)case_id Succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 获取病例信息
 */
+ (void)getPatientCaseInfo:(NSString *)case_id succeed:(void(^)(PatientCaseModel *model))succeed failed:(void(^)())failed;

/**
 * 获取病例列表
 */
+ (void)getPatientListSucceed:(void(^)(NSArray *caseList))succeed failed:(void(^)())failed;



/**
 * 提交服务定制
 */
+ (void)submitService:(ServiceModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 获取服务列表
 */
+ (void)getServiceListWithPage:(NSString *)page andCount:(NSString *)count Succeed:(void(^)(NSArray *modelArry))succeed failed:(void(^)())failed;

/**
 * 提交体检定制
 */
+ (void)submitExamination:(ExaminationModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 获取体检定制列表
 */
+ (void)getExaminationListWithPage:(NSString *)page andCount:(NSString *)count Succeed:(void(^)(NSArray *modelArry))succeed failed:(void(^)())failed;

/**
 * 提交新地址
 */
+ (void)submitAddress:(AddressModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 获取地址列表
 */
+ (void)getAddressListSucceed:(void(^)(NSArray *modelArry))succeed failed:(void(^)())failed;

/**
 * 更新地址
 */
+ (void)updateAddress:(AddressModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 地址详情
 */
+ (void)addressInfo:(NSString *)addressID Succeed:(void(^)(NSDictionary *addressDict))succeed failed:(void(^)())failed;

/**
 * 删除地址
 */
+ (void)deleteDddress:(NSString *)addressID Succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 设置默认地址
 */
+ (void)setDefauleAddress:(NSString *)addressID Succeed:(void(^)())succeed failed:(void(^)())failed;


/**
 * 获取地区列表
 */
+ (void)getAreaListWithparentId:(NSString *)parentId finished:(void(^)(NSArray *areaList))finished;

/**
 * 获取消息列表
 */
+ (void)getMessageListfinished:(void(^)(NSArray *messageList))finished;

/**
 * 医生详情
 */
+ (void)getDoctorInfoWithDoctorID:(NSString *)doctorID Succeed:(void(^)(NSDictionary *dict))succeed;

/**
 * 评价
 */
+ (void)commentWithParams:(NSMutableDictionary *)params Succeed:(void(^)())succeed failed:(void(^)())failed;

/**
 * 评价列表
 */
+ (void)getCommentListWithDoctorID:(NSString *)doctorID andPage:(NSString *)page andCount:(NSString *)count Succeed:(void(^)(NSArray *commentArry))succeed failed:(void(^)())failed;



/**
 * 关注
 */
+ (void)collectDoctorWithDoctorID:(NSString *)doctorID  succeed:(void(^)())succeed;

/**
 * 取消关注
 */
+ (void)deleteDoctorWithDoctorID:(NSString *)doctorID  succeed:(void(^)())succeed;

/**
 * 获取关注列表
 */
+ (void)getCollectedListWithPage:(NSString *)page andCount:(NSString *)count Succeed:(void(^)(NSArray *doctorList))succeed;

/**
 * 预约列表
 */
+ (void)getOrderListWithPage:(NSString *)page andCount:(NSString *)count andType:(NSString *)type Succeed:(void(^)(NSArray *orderList))succeed;

/**
 * 取消预约
 */
+ (void)deleteOrderWithOrderID:(NSString *)OrderID  succeed:(void(^)())succeed;



@end
