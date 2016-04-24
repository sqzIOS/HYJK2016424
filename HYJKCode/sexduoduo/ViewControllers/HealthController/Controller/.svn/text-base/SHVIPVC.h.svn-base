//
//  SHVIPVC.h
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//  免费咨询和vip咨询

#import <UIKit/UIKit.h>
#import "SHMydoctorModel.h"
typedef enum {
    SHExternalTypeFree = 0,
    SHExternalTypeVip,
    SHExternalTypeDoctor
}SHExternalType;

@interface SHVIPVC : UIViewController<UITextViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,strong)NSString* filePath;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic,strong)NSString *userIdStr;
@property (nonatomic,strong)NSString *isAnonymousNum;//是否匿名 0：是 1：否
@property (nonatomic,strong)NSString *patientSexNum;//性别 0：男 1：女
@property (nonatomic,strong)NSString *patientAgeNum;//年龄
@property (nonatomic,strong)NSString *patientQuestStr;//咨询内容

@property (nonatomic,strong)SHMydoctorInfo *selectDoctor;

/**
 *  1: 免费咨询   2：VIP服务   3： 选择医师
 *
 */
@property (nonatomic) SHExternalType type;
+(void)gotoMySelf:(id)pvc withType:(SHExternalType)type;

@end
