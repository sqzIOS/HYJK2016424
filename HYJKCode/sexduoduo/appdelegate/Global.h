//
//  Global.h
//  sexduoduo
//
//  Created by Showm on 14-6-27.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//

#ifndef sexduoduo_Global_h
#define sexduoduo_Global_h

//!!!: 打包需要修改的
#define Flag @""

#define IS_APPSTORE  0   //是否appStore 1为是 0为否

#define IS_SexDuoDuo 1  //是性多多应用吗 0性健康 1性多多

//============荡荡的分割线============
#pragma mark - ==============

//!!!:  换应用需要修改

//========泡泡========
#define ITUNES_APP_ID  @"1055577843"//性健康id： 1062774117  泡泡Id:1055577843
//友盟key
#define UMENG_APPKEY   @"55fd3c9e67e58e9237001d1a"
//支付宝Scheme
#define AlipayAppScheme  @"HongYi" //性多多使用XingDuoDuo 泡泡使用PaoPao 性健康使用sexhealth

//========性健康========
//#define ITUNES_APP_ID  @"1062774117"//性健康id： 1062774117  泡泡Id:1055577843
//#define UMENG_APPKEY   @"564d6c39e0f55a2cb3004438"//两性健康管家umengkey:564d6c39e0f55a2cb3004438     paopao umeng key:5639c0e6e0f55aeb13000e8e
//#define AlipayAppScheme  @"sexhealth" //性多多使用XingDuoDuo 泡泡使用PaoPao 性健康使用sexhealth


//!!!:  注意替换typeUrl中的scheme 并必须删除typeUrl中的另外的scheme 不然虽然新项目不会跳转到旧的 但是旧的会跳转到新的

//============荡荡的分割线============

//支付宝公钥
#define AlipayPubKey   @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB"  //性多多系列应用都用这个


#pragma mark - ==============


#endif
