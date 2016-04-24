/************************************************************
  *  * EaseMob CONFIDENTIAL 
  * __________________ 
  * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of EaseMob Technologies.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from EaseMob Technologies.
  */

#ifndef ChatDemo_UI2_0_ChatDemoUIDefine_h
#define ChatDemo_UI2_0_ChatDemoUIDefine_h

//#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

//#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"

#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]


//透传消息的action 定义
//透传消息action定义
//用户向医生发送透传消息（vip咨询）
#define ACTION_USER_VIP  @"user_send_vip"
//用户向医生发送头传消息
#define ACTION_USER_PHONE  @"user_send_phone"
//医生向用户发送透传消息(vip评价)
#define  ACTION_DOCTOR_VIP  @"doctor_send_vip"
//医生向用户发送透传消息(电话评价)未使用
#define ACTION_DOCTOR_PHONE  @"doctor_send_phone"



#endif
