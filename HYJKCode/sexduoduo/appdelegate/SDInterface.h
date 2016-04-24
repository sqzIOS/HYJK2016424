//
//  SDInterface.h
//  sexduoduo
//
//  Created by showm on 15/10/28.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#ifndef sexduoduo_SDInterface_h
#define sexduoduo_SDInterface_h


#pragma mark 服务器ip
//#define BBS_IP @"http://test.hyyl.cc/openapi/"
#define BBS_IP @"http://www.hyyl.cc/openapi/"


#pragma mark 计算订单金额
#define SDINTERFACE_calculatePrice @"/shopxx/app/order!calculatePrice.action"

//首页banner图
#define HONGYI_DATA @"?url=/home/data"

//科室分类
#define HONGYI_category @"?url=/category"

//地区接口
#define HONGYI_region @"?url=/region"

//咨询列表接口
#define HONGYI_search @"?url=/search"

//医院单位
#define HONGYI_brand @"?url=/brand"

//医师详情
#define HONGYI_goods @"?url=/goods"

//医师详情描述
#define HONGYI_goods_desc @"?url=/goods/desc"

//医师评价列表
#define HONGYI_comments @"?url=/comments"

//收藏医师
#define HONGYI_user_collect_create @"?url=/user/collect/create"

//取消收藏医师
#define HONGYI_user_collect_delete @"?url=/user/collect/delete"

//服务单预览接口
#define HONGYI_flow_checkOrder @"?url=/flow/checkOrder"

//服务单预览接口
#define HONGYI_flow_done @"?url=/flow/done"

//在线支付接口
#define HONGYI_order_pay @"?url=/order/pay"

//订单详情
#define HONGYI_order_info @"?url=/order/info"

//取消订单
#define HONGYI_order_cancel @"?url=/order/cancel"

//确认就诊
#define HONGYI_order_affirmReceived @"?url=/order/affirmReceived"

//添加到服务单接口
#define HONGYI_cart_create @"?url=/cart/create"

//用户地址列表接口
#define HONGYI_address_list @"?url=/address/list"

#endif
