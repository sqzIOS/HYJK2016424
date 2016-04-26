//
//  NetOperation.m
//  
//
//  Created by apple on 16/1/14.
//
//

#import "UserOperation.h"
#import "AFHTTPClient.h"


@implementation UserOperation

#pragma mark - 网络请求验证码
+ (void)getVerificationCodeWithPhoneNumber:(NSString *)number
{
    NSString *path = @"/sendmsg/sendyzm";
    NSDictionary *params = @{@"mobile":number};
    [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
        [self isSucceedWithResponsDict:dict];
    } fail:^{
        
    }];
}

#pragma mark - 用户登录
+ (void)userSigninWithName:(NSString *)name andPassword:(NSString *)password succeed:(void(^)())succeed failed:(void(^)())failed
{
    if (name == nil) {
        name = @"";
    }
    if (password == nil) {
        password = @"";
    }
    NSString *path = @"/user/signin";
    NSDictionary *params = @{@"name":name,
                             @"password":password};
    [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
        if ([self isSucceedWithResponsDict:dict]) {
            [self saveUserInfomationWithInfo:dict andPassword:password];
            succeed();
        } else {
            failed();
        }
    } fail:^{
        NSNotification *noti = [[NSNotification alloc] initWithName:UserRelogin object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:noti];
        failed();
    }];
}

#pragma mark - 微信登陆
+ (void)userSignByWXWithUid:(NSString *)uid andNickname:(NSString *)nickname succeed:(void(^)())succeed failed:(void(^)())failed;
{
    NSString *path = @"/user/oath_login";
    NSDictionary *params = @{@"openapi":uid};

    
    [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([self isSucceedWithResponsDict:dict]) {
            
            // 已绑定保存信息
            [self saveUserInfomationWithInfo:dict andPassword:@""];
            
            [[NSUserDefaults standardUserDefaults] setObject:uid forKey:@"uid"];
            
            succeed();

        } else {
            // 未绑定
            failed();
        }
    } fail:^{
        failed();
    }];
    
}

#pragma mark - 微信登陆后绑定用户
+ (void)userBindAccount:(NSString *)name andPassword:(NSString *)password succeed:(void(^)())succeed failed:(void(^)())failed
{
    NSString *path = @"/user/oath_bind";
    NSString *openapi = [[NSUserDefaults standardUserDefaults] objectForKey:@"openapi"];
    NSDictionary *params = @{@"bind_type":@"1",
                             @"openapi":openapi,
                             @"name":name,
                             @"password":password};
    [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
        if ([self isSucceedWithResponsDict:dict]) {
            [self saveUserInfomationWithInfo:dict andPassword:password];
            succeed();
        } else {
            failed();
        }
    } fail:^{
        failed();
    }];

}


#pragma mark - 注册用户
+ (void)userSignupWithName:(NSString *)name password:(NSString *)password nick_name:(NSString *)nick_name avatar:(UIImage *)avatar sex:(Sex)sex email:(NSString *)email yzm:(NSString *)yzm field:(NSString *)field invitecode:(NSString *)invitecode succeed:(void(^)())succeed failed:(void(^)())failed
{
    NSString *path = @"/user/signup";
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"name":name,
                                                                                  @"password":password,
                                                                                  @"nick_name":nick_name,
                                                                                  @"sex":@(sex),
                                                                                  @"avatar":[self stringWithImageBybase64Encoding:avatar andCompress:0.1],
                                                                                  @"email":email,
                                                                                  @"yzm":yzm,
                                                                                  @"field":field}];
    
    NSString *openapi = [[NSUserDefaults standardUserDefaults] objectForKey:@"openapi"];
    if (openapi) {
        path = @"/user/oath_bind";
        params = [NSMutableDictionary dictionaryWithDictionary:@{@"bind_type":@"0",
                   @"openapi":openapi,
                  @"name":name,
                  @"password":password,
                  @"nick_name":nick_name,
                  @"sex":@(sex),
                  @"avatar":[self stringWithImageBybase64Encoding:avatar andCompress:0.1],
                  @"email":email,
                  @"yzm":yzm,
                  @"field":field}];
    }
    
    if (invitecode) {
        [params setObject:invitecode forKey:@"invitecode"];
    }
    
    [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
        
        if ([self isSucceedWithResponsDict:dict]) {
            [self saveUserInfomationWithInfo:dict andPassword:password];
            succeed();
        } else {
            failed();
        }
    } fail:^{
        failed();
    }];
}

#pragma mark - 保存用户和session
+ (void)saveUserInfomationWithInfo:(NSDictionary *)info andPassword:(NSString *)password
{
    NSDictionary *data = info[@"data"];
    NSDictionary *session = data[@"session"];
    NSDictionary *user = data[@"user"];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:session forKey:@"session"];
    [userDefault setObject:user forKey:@"user"];
    [userDefault setObject:password forKey:@"password"];

}



#pragma mark - 获取session字典
+ (void)getSession:(void(^)(NSDictionary *session))finished;
{
    NSString *uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"openapi"];
    if (uid) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSDictionary *dict = [userDefault objectForKey:@"session"];
        NSLog(@"%@",dict);
        finished(dict);
        return;
    }
    
    UserModel *user = [UserOperation getUserFromeLocal];
    [self userSigninWithName:user.name andPassword:user.password succeed:^{
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSDictionary *dict = [userDefault objectForKey:@"session"];
        finished(dict);
        NSLog(@"%@",dict);

    } failed:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:NoNet object:nil];
    }];
}

#pragma mark - 获取本地用户信息
+ (UserModel *)getUserFromeLocal
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [userDefault objectForKey:@"user"];
    UserModel *user = [UserModel uesrModelWithDict:dict];
    NSString *password = [userDefault objectForKey:@"password"];
    user.password = password;
    return user;
    
}

#pragma mark - 通过服务器获取用户信息
+ (void)getUserFromServiceSucceed:(void(^)(UserModel *user))succeed failed:(void(^)())failed
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary *sessionDict = [userDefault objectForKey:@"session"];
    NSString *path = @"/user/info";
    NSDictionary *params = @{@"session":sessionDict};
    [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
        if ([self isSucceedWithResponsDict:dict]) {
            NSDictionary *data = dict[@"data"];
            UserModel *user = [UserModel uesrModelWithDict:data];
            user.password = [userDefault objectForKey:@"password"];
            succeed(user);
        }
    } fail:^{
        failed();
    }];
}

#pragma mark - 返回图片的base64字符串编码
+ (NSString *)stringWithImageBybase64Encoding:(UIImage *)image andCompress:(float)compress
{
    NSData *imageData = UIImageJPEGRepresentation(image, compress);
    NSString *str = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return str;
}

#pragma mark - 通过base64字符串生成图片
+ (UIImage *)imageWithBase64String:(NSString *)string
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

#pragma mark - 判断请求是否成功
+ (BOOL)isSucceedWithResponsDict:(NSDictionary *)dict
{
    [ShareFunction hiddenHUD];
    
    NSDictionary *status = dict[@"status"];
    BOOL succeed = [NSString stringWithFormat:@"%@",status[@"succeed"]].intValue;
    
    if (succeed) {
        return YES;
    }
    
    NSString *error = [NSString stringWithFormat:@"%@",status[@"error_desc"]];
    if (![error containsString:@"null"] && ![error containsString:@"频繁"]) {
            [ShareFunction showMessageMiddle:error];
    }
    
    NSLog(@"%@",dict);
    NSLog(@"%@",error);
    
    // 账号密码错误或者账号过期重新登陆
    if ([error isEqualToString:@"您的帐号已过期"]) {
       NSNotification *noti = [[NSNotification alloc] initWithName:UserRelogin object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:noti];
    }
    return NO;
}

/**
 * 更新病例
 */
+ (void)updataPatientCase:(PatientCaseModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/user_case/update";
        NSMutableDictionary *user_case = [NSMutableDictionary dictionary];
        
        [user_case setObject:model.age forKey:@"age"];
        [user_case setObject:model.weight forKey:@"weight"];
        [user_case setObject:model.height forKey:@"height"];
        [user_case setObject:model.blood_type forKey:@"blood_type"];
        [user_case setObject:model.rhblood_type forKey:@"rhblood_type"];
        [user_case setObject:model.disease_desc forKey:@"disease_desc"];
        [user_case setObject:model.disease_history forKey:@"disease_history"];
        [user_case setObject:model.bmi forKey:@"bmi"];
        if (model.case_id) {
            [user_case setObject:[NSString stringWithFormat:@"%d",model.isSelected]    forKey:@"default_case"];
        } else {
            [user_case setObject:@"1" forKey:@"default_case"];
        }
        
        NSDictionary *params = @{@"session":session,
                                 @"user_case":user_case,
                                 @"case_id":model.case_id};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                succeed();
            } else {
                failed();
            }
        } fail:^{
            failed();
        }];
    }];
    

}

#pragma mark - 增加病例
+ (void)addPatientCase:(PatientCaseModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/user_case/add";
        NSMutableDictionary *user_case = [NSMutableDictionary dictionary];
        
        [user_case setObject:model.age forKey:@"age"];
        [user_case setObject:model.weight forKey:@"weight"];
        [user_case setObject:model.height forKey:@"height"];
        [user_case setObject:model.blood_type forKey:@"blood_type"];
        [user_case setObject:model.rhblood_type forKey:@"rhblood_type"];
        [user_case setObject:model.disease_desc forKey:@"disease_desc"];
        [user_case setObject:model.disease_history forKey:@"disease_history"];
        [user_case setObject:model.bmi forKey:@"bmi"];
        if (model.case_id) {
            [user_case setObject:[NSString stringWithFormat:@"%d",model.isSelected]    forKey:@"default_case"];
        } else {
            [user_case setObject:@"1" forKey:@"default_case"];
        }
        
        NSDictionary *params = @{@"session":session,
                                 @"user_case":user_case};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                succeed();
            } else {
                failed();
            }
        } fail:^{
            failed();
        }];
    }];
    
}


#pragma mark - 获取病例
+ (void)getPatientCaseSucceed:(void(^)(PatientCaseModel *model))succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/user_case/list";
        NSDictionary *params = @{@"session":session};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                NSDictionary *data = dict[@"data"];
                PatientCaseModel *model = [PatientCaseModel patientCaseModelWithDict:data];
                succeed(model);
            } else {
                failed ();
            }
        } fail:^{
            failed();
        }];

    }];
}


/**
 * 设置默认病例
 */
+ (void)setDefaultPatientCase:(NSString *)case_id Succeed:(void(^)())succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/user_case/setDefault";
        NSDictionary *params = @{@"session":session,
                                 @"case_id":case_id};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                succeed();
            } else {
                failed ();
            }
        } fail:^{
            failed();
        }];
        
    }];

}

/**
 * 是否有默认病例
 */
+ (void)hasDefaultPatientCase:(void(^)(NSString *case_id))finished {
    [self getPatientListSucceed:^(NSArray *caseList) {
        for (PatientCaseModel *model in caseList) {
                        if ( model.isSelected) {
                            finished(model.case_id);
                            return ;
                        }
                    finished(nil);
        }
    } failed:^{
        finished(nil);
    }];
}


/**
 * 删除病例
 */
+ (void)deletePatientCase:(NSString *)case_id Succeed:(void(^)())succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/user_case/delete";
        NSDictionary *params = @{@"session":session,
                                 @"case_id":case_id};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                succeed();
            } else {
                failed ();
            }
        } fail:^{
            failed();
        }];
        
    }];

}

/**
 * 获取病例信息
 */
+ (void)getPatientCaseInfo:(NSString *)case_id succeed:(void(^)(PatientCaseModel *model))succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/user_case/list";
        NSDictionary *params = @{@"session":session};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                NSDictionary *data = dict[@"data"];
                PatientCaseModel *model = [PatientCaseModel patientCaseModelWithDict:data];
                succeed(model);
            } else {
                failed ();
            }
        } fail:^{
            failed();
        }];
        
    }];

}

/**
 * 获取病例列表
 */
+ (void)getPatientListSucceed:(void(^)(NSArray *caseList))succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/user_case/list";
        NSDictionary *params = @{@"session":session};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                NSArray *dataArray = dict[@"data"];
                NSMutableArray *caseList = [NSMutableArray array];
                for (NSDictionary *dict in dataArray) {
                    [caseList addObject:[PatientCaseModel patientCaseModelWithDict:dict]];
                }
                succeed(caseList);
            } else {
                failed ();
            }
        } fail:^{
            failed();
        }];
        
    }];

}


#pragma mark - 提交服务
+ (void)submitService:(ServiceModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/custom/service_add";
        NSDictionary *params = @{@"session":session,
                                 @"custom_service":@{@"department":model.department,
                                                     @"region":model.region,
                                                     @"disease_desc":model.disease_desc,
                                                     @"mobile":model.mobile,
                                                     @"contact_name":model.contact_name}};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                succeed();
            } else {
                failed();
            }
        } fail:^{
            failed();
        }];
        
    }];
}

#pragma mark - 获取服务
+ (void)getServiceListWithPage:(NSString *)page andCount:(NSString *)count Succeed:(void(^)(NSArray *modelArry))succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/custom/service_list";
        NSDictionary *params = @{@"session":session,
                                 @"pagination":@{@"page":page,
                                                 @"count":count}};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                 NSArray *dataArry = dict[@"data"];
                NSMutableArray *modelArry = [NSMutableArray array];
                for (NSDictionary *dict in dataArry) {
                    ServiceModel *model = [ServiceModel serviceModelWithDict:dict];
                    [modelArry addObject:model];
                }
                succeed(modelArry);
            } else {
                failed();
            }
        } fail:^{
            failed();
        }];
    }];
}


#pragma mark - 体检定制
+ (void)submitExamination:(ExaminationModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/custom/examination_add";
        NSDictionary *params = @{@"session":session,
                                 @"custom_examination":@{@"id_card":model.id_card,
                                                     @"medical_institutions":model.medical_institutions,
                                                     @"mobile":model.mobile,
                                                     @"contact_name":model.contact_name,
                                                     @"region":model.region,
                                                     @"disease_desc":model.disease_desc}};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                succeed();
            }
        } fail:^{
            failed();
        }];
        
    }];

}

#pragma mark - 获取体检定制列表
+ (void)getExaminationListWithPage:(NSString *)page andCount:(NSString *)count Succeed:(void(^)(NSArray *modelArry))succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/custom/examination_list";
        NSDictionary *params = @{@"session":session,
                                 @"pagination":@{@"page":page,
                                                 @"count":count}};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                NSArray *dataArry = dict[@"data"];
                NSMutableArray *modelArry = [NSMutableArray array];
                for (NSDictionary *dict in dataArry) {
                    ExaminationModel *model = [ExaminationModel modelWithDict:dict];
                    [modelArry addObject:model];
                }
                succeed(modelArry);
            }
        } fail:^{
            failed();
        }];
        
    }];

}



#pragma mark - 增加地址
+ (void)submitAddress:(AddressModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/address/add";
        NSMutableDictionary *address = [NSMutableDictionary dictionary];
        [address setObject:@"1" forKey:@"country"];
        if (model.province) {
            [address setObject:model.province forKey:@"province"];
        }
        if (model.consignee) {
            [address setObject:model.consignee forKey:@"consignee"];
        }
        if (model.city) {
            [address setObject:model.city forKey:@"city"];
        }
        if (model.district) {
            [address setObject:model.district forKey:@"district"];
        }
        if (model.address) {
            [address setObject:model.address forKey:@"address"];
        }
        if (model.best_time) {
            [address setObject:model.best_time forKey:@"best_time"];
        }
        if (model.tel) {
            [address setObject:model.tel forKey:@"tel"];
        }
        if (model.default_address) {
            [address setObject:model.default_address forKey:@"default_address"];
        }
        NSDictionary *params = @{@"session":session,
                             @"address":address};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                succeed();
            }
        } fail:^{
            failed();
        }];
        
    }];

}

#pragma mark - 地址列表
+ (void)getAddressListSucceed:(void(^)(NSArray *modelArry))succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/address/list";
        NSDictionary *params = @{@"session":session};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                NSArray *dataArry = dict[@"data"];
                NSMutableArray *modelArry = [NSMutableArray array];
                for (NSDictionary *dict in dataArry) {
                    AddressModel *model = [AddressModel addressModelWithDict:dict];
                    [modelArry addObject:model];
                }
                succeed(modelArry);
            } else {
                failed();
            }
        } fail:^{
            NSNotification *noti = [[NSNotification alloc] initWithName:NoNet object:nil userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:noti];
            failed();
        }];
        
    }];
}

#pragma mark - 更新地址
+ (void)updateAddress:(AddressModel *)model Succeed:(void(^)())succeed failed:(void(^)())failed;
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/address/update";
        NSMutableDictionary *address = [NSMutableDictionary dictionary];
        if (model.province) {
            [address setObject:model.province forKey:@"province"];
        }
        if (model.consignee) {
            [address setObject:model.consignee forKey:@"consignee"];
        }
        if (model.city) {
            [address setObject:model.city forKey:@"city"];
        }
        if (model.district) {
            [address setObject:model.district forKey:@"district"];
        }
        if (model.address) {
            [address setObject:model.address forKey:@"address"];
        }
        if (model.best_time) {
            [address setObject:model.best_time forKey:@"best_time"];
        }
        if (model.tel) {
            [address setObject:model.tel forKey:@"tel"];
        }
        if (model.default_address) {
            [address setObject:model.default_address forKey:@"default_address"];
        }
        NSDictionary *params = @{@"session":session,
                                 @"address":address,
                                 @"address_id":model.addressID};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                succeed();
            }
        } fail:^{
            failed();
        }];
        
    }];
}

#pragma mark - 地址详情
+ (void)addressInfo:(NSString *)addressID Succeed:(void(^)(NSDictionary *addressDict))succeed failed:(void(^)())failed;
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/address/info";
        NSDictionary *params = @{@"session":session,
                                 @"address_id":addressID};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                NSDictionary *data = dict[@"data"];
                succeed(data);
            }
        } fail:^{
            failed();
        }];
        
    }];
}

#pragma mark - 删除地址
+ (void)deleteDddress:(NSString *)addressID Succeed:(void(^)())succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/address/delete";
        NSDictionary *params = @{@"session":session,
                                 @"address_id":addressID};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                succeed();
            }
        } fail:^{
            failed();
        }];
        
    }];
}

#pragma mark - 设置默认地址
+ (void)setDefauleAddress:(NSString *)addressID Succeed:(void(^)())succeed failed:(void(^)())failed
{
    [self getSession:^(NSDictionary *session) {
        NSString *path = @"/address/setDefault";
        NSDictionary *params = @{@"session":session,
                                 @"address_id":addressID};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                
                succeed();
            }
        } fail:^{
            failed();
        }];
        
    }];
}

#pragma mark - 获取地区列表
+ (void)getAreaListWithparentId:(NSString *)parentId finished:(void(^)(NSArray *areaList))finished
{
    NSString *path = @"/region";
    NSDictionary *params = @{@"parent_id":parentId};
    [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
        NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
        NSArray *areaArry = responseData[@"data"][@"regions"];
        NSMutableArray *areaList = [NSMutableArray array];
        for (NSDictionary *dict in areaArry) {
            AreaModel *model = [AreaModel areaModelWithDict:dict];
            [areaList addObject:model];
        }
        finished(areaList);
    } fail:^{
        
    }];
}

#pragma mark - 通知列表
+ (void)getMessageListfinished:(void(^)(NSArray *messageList))finished
{
    NSString *path = @"/message/list";
    [self getSession:^(NSDictionary *session) {
        NSDictionary *params = @{@"session":session};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            NSArray *messageArry = responseData[@"data"];
            NSMutableArray *messageList = [NSMutableArray array];
            for (NSDictionary *dict in messageArry) {
                MessageModel *model = [MessageModel messageModelWithDict:dict];
                [messageList addObject:model];
            }
            finished(messageList);
        } fail:^{
            
        }];

    }];
}

#pragma mark - 获取医生详情
+ (void)getDoctorInfoWithDoctorID:(NSString *)doctorID Succeed:(void(^)(NSDictionary *dict))succeed;
{
    NSString *path = @"/goods";
    [self getSession:^(NSDictionary *session) {
        NSDictionary *params = @{@"session":session,
                                 @"goods_id":doctorID};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                NSDictionary *data = dict[@"data"];
                succeed(data);
            }
        } fail:^{
            
        }];
        
    }];
}

#pragma mark - 评价
+ (void)commentWithParams:(NSMutableDictionary *)params Succeed:(void(^)())succeed failed:(void(^)())failed;
{
    NSString *path = @"/comments/add";
    [self getSession:^(NSDictionary *session) {
        [params setObject:session forKey:@"session"];
        [params setObject:@" " forKey:@"comment_rank"];
        NSLog(@"%@",params);
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                succeed();
            }
        } fail:^{
            failed();
        }];
        
    }];

}

#pragma mark - 获取评价列表
+ (void)getCommentListWithDoctorID:(NSString *)doctorID andPage:(NSString *)page andCount:(NSString *)count Succeed:(void(^)(NSArray *commentArry))succeed failed:(void(^)())failed
{
    NSString *path = @"/comments/list";
    NSDictionary *params = @{@"goods_id":doctorID,
                             @"pagination":@{@"page":page,
                                             @"count":count}};
    [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
         NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
        NSArray *dataArry = responseData[@"data"];
        NSMutableArray *commentList = [NSMutableArray array];
        for (NSDictionary *dict in dataArry) {
            CommentModel *model = [CommentModel modelWithDict:dict];
            [commentList addObject:model];
        }
        succeed(commentList);
    } fail:^{
        failed();
    }];
}


#pragma mark - 关注
+ (void)collectDoctorWithDoctorID:(NSString *)doctorID succeed:(void(^)())succeed
{
    NSString *path = @"/user/collect/create";
    [self getSession:^(NSDictionary *session) {
        NSDictionary *params = @{@"session":session,
                                 @"goods_id":doctorID};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            succeed();
        } fail:^{
            
        }];
        
    }];

}

#pragma mark - 取消关注
+ (void)deleteDoctorWithDoctorID:(NSString *)doctorID  succeed:(void(^)())succeed
{
    NSString *path = @"/user/collect/delete";
    [self getSession:^(NSDictionary *session) {
        NSDictionary *params = @{@"session":session,
                                 @"goods_id":doctorID};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            succeed();
        } fail:^{
            
        }];
        
    }];
}

#pragma mark - 关注列表
+ (void)getCollectedListWithPage:(NSString *)page andCount:(NSString *)count Succeed:(void(^)(NSArray *doctorList))succeed
{
    NSString *path = @"/user/collect/list";
    [self getSession:^(NSDictionary *session) {
        NSDictionary *params = @{@"session":session,
                                 @"pagination":@{@"page":page,
                                                 @"count":count}};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            
            NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            NSArray *arry = responseData[@"data"];
            NSMutableArray *doctorList = [NSMutableArray array];
            for (NSDictionary *dict in arry) {
                DorctorModel *model = [DorctorModel dorctorModelWithDict:dict];
                [doctorList addObject:model];
            }
            succeed(doctorList);
        } fail:^{
            
        }];
        
    }];
}

#pragma mark - 预约列表
+ (void)getOrderListWithPage:(NSString *)page andCount:(NSString *)count andType:(NSString *)type Succeed:(void(^)(NSArray *orderList))succeed
{
    NSString *path = @"/order/list";
    [self getSession:^(NSDictionary *session) {
        NSDictionary *params = @{@"session":session,
                                 @"pagination":@{@"page":page,
                                                 @"count":count},
                                 @"type":type};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
            if ([self isSucceedWithResponsDict:dict]) {
                NSArray *data = dict[@"data"];
                NSMutableArray *orderArry = [NSMutableArray array];
                for (NSDictionary *dict in data) {
                    BookingModel *model = [BookingModel modelWithDict:dict];
                    [orderArry addObject:model];
                }
                succeed(orderArry);
            }
        } fail:^{
            
        }];
        
    }];
}

#pragma mark - 取消预约
+ (void)deleteOrderWithOrderID:(NSString *)OrderID  succeed:(void(^)())succeed
{
    NSString *path = @"/order/cancel";
    [self getSession:^(NSDictionary *session) {
        NSDictionary *params = @{@"session":session,
                                 @"order_id":OrderID};
        [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
            
            succeed();
        } fail:^{
            
        }];
        
    }];

}

#pragma mark - 修改密码验证码
+ (void)getVerificationCodeWithAccount:(NSString *)account;
{
    NSString *path = @"/forgetpwd/sendcode";
    NSDictionary *params = @{@"email_or_mobie":account};
    [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
        if ([self isSucceedWithResponsDict:dict]) {
            
        }
    } fail:^{
        
    }];

}

#pragma mark - 修改密码
+ (void)updataPasswordWithCode:(NSString *)code account:(NSString *)account password:(NSString *)password succeed:(void(^)())succeed failed:(void(^)())failed
{
    NSString *path = @"/forgetpwd/resetpwd";
    NSDictionary *params = @{@"email_or_mobie":account,
                             @"code":code,
                             @"newpassword":password,
                             @"repassword":password};
    [AFHTTPClient postJSONPath:path httpHost:HOST parameters:params success:^(id json) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
        if ([self isSucceedWithResponsDict:dict]) {
            UserModel *user = [self getUserFromeLocal];
            if ([user.mobile_phone isEqualToString:account] || [user.email isEqualToString:account]) {
                [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
            }
            succeed();
        } else {
            failed();
        }
    } fail:^{
        failed();
    }];
    
}



@end
