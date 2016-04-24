//
//  sexHealthInterface.h
//  sexduoduo
//
//  Created by showm on 15/8/28.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#ifndef sexduoduo_sexHealthInterface_h
#define sexduoduo_sexHealthInterface_h



#pragma mark 1科普知识列表
// /shopxx/app/jk_article!knowledgeList.action
//  传入参数：pageApp，pageSizeApp
#define SHINTERFACE_knowledgeList @"/shopxx/app/jk_article!knowledgeList.action"

#pragma mark 1.2 科普头部标签的获取
//  传入参数：type=ps_artical
//#define SHINTERFACE_searchJkDictList @"/shopxx/app/jk_dict!searchJkDictList.action"
#define SHINTERFACE_searchJkDictList @"/shopxx/app/jk_article!getArticleCategory.action"

#pragma mark 1.3 新的科普知识列表
//  传入参数：type=ps_artical
#define SHINTERFACE_knowledgeListByCategory @"/shopxx/app/jk_article!knowledgeListByCategory.action"

#pragma mark 2科普知识详情
//  /shopxx/app/jk_article!knowledgeDetail.action
//   传入参数：id
#define SHINTERFACE_knowledgeDetail @"/shopxx/app/jk_article!knowledgeDetail.action"

#pragma mark 2.1 科普知识详情点赞
//   传入参数：articleId、memberId、praiseId
#define SHINTERFACE_praise @"/shopxx/app/jk_article_praise!praise.action"

#pragma mark 2.2 科普知识详情评论列表
//   传入参数：articleId、memberId、pageApp、pageSizeApp、type、flag
#define SHINTERFACE_getCommentAction @"/shopxx/app/jk_article_comment!getCommentAction.action"

#pragma mark 2.3 科普知识详情评论接口
//   传入参数：articleId(文章id)、memberId（用户论坛id）、content（内容）、parentId（父级id）、
#define SHINTERFACE_comment @"/shopxx/app/jk_article_comment!comment.action"

#pragma mark 3获取热门搜索
#define SHINTERFACE_knowledgeSearchPage @"/shopxx/app/jk_article!knowledgeSearchPage.action"

#pragma mark 4搜索科普知识
//  传入参数：key,pageApp,pageSizeApp
#define SHINTERFACE_knowledgeSearch @"/shopxx/app/jk_article!knowledgeSearch.action"

#pragma mark 5根据坐标查找医生
//  传入参数：pageApp、pageSizeApp、lng、lat
#define SHINTERFACE_selectDoctorArea @"/shopxx/app/jk_doctor!selectDoctorArea.action"

#pragma mark 5.1 根据区域查找医生
//  传入参数：pageApp、pageSizeApp、areaName
#define SHINTERFACE_getDoctorArea @"/shopxx/app/jk_doctor!getDoctorArea.action"

#pragma mark 6查找心理医生
//  传入参数：pageApp、pageSizeApp、lng、lat
#define SHINTERFACE_getCounselingList @"/shopxx/app/jk_doctor!getCounselingList.action"

#pragma mark 7医生详情
//  传入参数：doctorId
#define SHINTERFACE_getDoctorDetail @"/shopxx/app/jk_doctor!getDoctorDetail.action"

#pragma mark 8 获取推荐医生列表
//  传入参数：doctorId
#define SHINTERFACE_recommendeDoctorDetail @"/shopxx/app/jk_doctor!recommendeDoctor.action"

#pragma mark 9根据城市名称获取心理医生列表
//传入参数：pageApp、pageSizeApp、areaName
#define SHINTERFACE_getPsychologistArea @"/shopxx/app/jk_doctor!getPsychologistArea.action"

#pragma mark  10获取推荐医生列表
/*
 shopxx/app/jk_doctor!recommendedDoctor.action
 */
#define SHINTERFACE_recommendedDoctor @"/shopxx/app/jk_doctor!recommendedDoctor.action"

#pragma mark 11获取推荐心理医生列表
#define SHINTERFACE_recommendedCounseling @"/shopxx/app/jk_doctor!recommendedCounseling.action"

#pragma mark 11.2 获取心理医生列表
//参数：lat, lng, sort=1, pageApp, pageSizeApp
#define SHINTERFACE_getPsychologists @"/shopxx/app/jk_doctor!getPsychologists.action"

#pragma mark 11.2.1 新的获取心理医生列表
//参数：lat, lng, sort=1, pageApp, pageSizeApp
#define SHINTERFACE_psychologicalCounselingRoom @"/shopxx/app/jk_doctor!psychologicalCounselingRoom.action"

#pragma mark 11.3 获取心理医师等级
#define SHINTERFACE_getDegree @"/shopxx/app/jk_doctor!getDegree.action"

#pragma mark 12根据坐标获取医院列表
//传入参数：pageApp、pageSizeApp、lng、lat
#define SHINTERFACE_getNearbyHospitalList @"/shopxx/app/jk_hospital!getNearbyHospitalList.action"

#pragma mark 13根据城市名称获取医院列表
//传入参数：pageApp、pageSizeApp、areaName
#define SHINTERFACE_getHospitalList @"/shopxx/app/jk_hospital!getHospitalList.action"

#pragma mark  14获取推荐医院列表
/*
 shopxx/app/jk_hospital!recommendedHospital.action
 传入参数：pageApp、pageSizeApp
 */
#define SHINTERFACE_recommendedHospital @"/shopxx/app/jk_hospital!recommendedHospital.action"

#pragma mark  15获取疾病类型列表
/*
 shopxx/app/jk_cases!selfDiagnoseList.action
 传入参数:id name  diseaseCategory
 */
#define SHINTERFACE_selfDiagnoseList @"/shopxx/app/jk_cases!selfDiagnoseList.action"

#pragma mark  16.1获取疾病详情
/*
 shopxx/app/jk_cases!getDiseaseDetail.action
 传入参数：diseaseCategoryId
 */
#define SHINTERFACE_getDuseaseDetail @"/shopxx/app/jk_cases!getDiseaseDetail.action"

#pragma mark  16.2获取疾病详情 的案例详情
#define SHINTERFACE_getConsultingList @"/shopxx/app/jk_vip_consulting!getConsultingList.action"

#pragma mark 17免费咨询
//传入参数：userId、isAnonymous（是否匿名，0:是，1:否）、patientSex（性别，0:男，1:女）、patientAge（年龄）、patientQuest（咨询内容）
#define SHINTERFACE_freeConsult @"/shopxx/app/jk_cases!freeConsult.action"

#pragma mark 17.5 新的免费咨询接口 （2015.12.18）
//请求方式: post
//传入参数：userId、isAnonymous（是否匿名，0:是，1:否）、patientSex（性别，0:男，1:女）、patientAge（年龄）、patientQuest（咨询内容）、 department 选择的科室，值限【获取科室列表】接口datasource字段下的id值
#define SHINTERFACE_newFreeConsult @"/shopxx/app/jk_free_consult!freeConsult.action"

#pragma mark 17.1免费咨询用户数
#define SHINTERFACE_getCasesCount @"/shopxx/app/jk_cases!getCasesCount.action"

#pragma mark 17.2VIP咨询用户数
#define SHINTERFACE_getFinishCount @"/shopxx/app/jk_vip_consulting!getFinishCount.action"

#pragma mark 18获取医院详情
//传入参数：hospitalId
#define SHINTERFACE_getHospitalDetail  @"/shopxx/app/jk_hospital!getHospitalDetail.action"

#pragma mark 19免费咨询列表
#define SHINTERFACE_getQuestionList  @"/shopxx/app/jk_cases!getQuestionList.action"

#pragma mark 19.1 新的免费咨询列表
//请求方式 : get
//传入参数:pageApp 页码、pageSizeApp 每页数量、departmentApp 科室ID、sortTypeApp 排序、keywordsApp 关键字搜索
#define SHINTERFACE_newGetQuestionList  @"/shopxx/app/jk_free_consult!getQuestionList.action"

#pragma mark 20免费咨询回复
//传入参数：userId、casesId、doctorId、isAnonymous、content
#define SHINTERFACE_doctorReplyConsult  @"/shopxx/app/jk_cases!doctorReplyConsult.action"

#pragma mark 21获取免费咨询详情
//传入参数：casesId
#define SHINTERFACE_getQuestionDetail  @"/shopxx/app/jk_cases!getQuestionDetail.action"

#pragma mark 22医生回复列表
//传入参数：casesId（string）、pageApp(int)、pageSizeApp(int)
#define SHINTERFACE_doctorAnswerList @"/shopxx/app/jk_cases!getDoctorReply.action"

#pragma mark 23用户回复列表
//传入参数：casesId（string）、pageApp(int)、pageSizeApp(int)
#define SHINTERFACE_userAnswerList @"/shopxx/app/jk_cases!getMemberReply.action"

#pragma mark 24我的医师列表
//传入参数：userId（string）、pageApp(int)、pageSizeApp(int)
#define SHINTERFACE_myDoctorList @"/shopxx/app/jk_doctor!getMyDoctor.action"

#pragma mark 25我的提问历史
//传入参数：userId（string）、pageApp(int)、pageSizeApp(int)
#define SHINTERFACE_counselHistoryList @"/shopxx/app/jk_cases!getCounselHistory.action"

#pragma mark 26 案例详情 VIP咨询详情
//传入参数：userId（string）、pageApp(int)、pageSizeApp(int)
#define SHINTERFACE_caseDetailsList @"/shopxx/app/jk_vip_consulting!getCounselDetail.action"

#pragma mark 27个人信息修改
//传入参数：@{@"usernameId":USERID, @"gender":sexLab.text, @"phone":phone.text, @"nickname":nickName.text};
#define SHINTERFACE_updateProfile @"/shopxx/shop/member!updateProfile.action"

#pragma mark 28 秘密修改
//传入参数：@{@"updateusernameapp" @"oldpassw" @"newpassw"};
#define SHINTERFACE_updateUser @"/shopxx/shop/member!updateUser.action"

#pragma mark 29 取消订单
//传入参数：consultingId
#define SHINTERFACE_cancel @"/shopxx/app/jk_vip_consulting!cancel.action"

#pragma mark 30 发表评价
//传入参数：userId、doctorId、opinionId、satisfactionId、counselId、commentType、isAnswerCall、content、isRefund
#define SHINTERFACE_releaseComment @"/shopxx/app/jk_doctor!releaseComment.action"


#pragma mark 31 找医生
//传入参数：pageApp、pageSizeApp、lat、lng、area、sequence、sections、keyWord、docService
#define SHINTERFACE_searchDoctor @"/shopxx/app/jk_doctor!searchDoctor.action"

#pragma mark 32 获取区域
//传入参数：parentId
#define SHINTERFACE_areaList @"/shopxx/app/area!areaList.action"

#pragma mark 33 获取科室
//传入参数：parentId
#define SHINTERFACE_departmentList @"/shopxx/app/jk_department!departmentList.action"

#pragma mark 33.1 新的获取科室
//传入参数：pageApp 页码、 pageSizeApp 每页数量
#define SHINTERFACE_newDepartmentList @"/shopxx/app/jk_free_consult!getDepartmentList.action"

/*
 22.首页广告
 shopxx/app/jk_article!getAdvertising.action
 */
#define SHINTERFACE_getAdvertising @"/shopxx/app/jk_article!getAdvertising.action"

#pragma mark VIP咨询

#pragma mark VIP咨询提交

//获取vip咨询列表
#define SHINTERFACE_jk_vip_getFinishList @"/shopxx/app/jk_vip_consulting!getFinishList.action"

#define SHINTERFACE_jk_vip_consulting @"/shopxx/app/jk_vip_consulting!vipConsult.action"


//获取支付宝支付签名
#define SHINTERFACE_getAlipaySign @"/shopxx/app/jk_order!getAlipaySign.action"

/*
 consultingId	String	咨询Id
 doctorId   	String	医生Id
 */
#pragma mark VIP咨询完成 
#define SHINTERFACE_consultingFinish @"/shopxx/app/jk_vip_consulting!finish.action"

/*
 userId  	String	用户Id
 doctorId	String	医生Id
 consultingId	String	咨询Id
 isDoctor	int	是否医生回复（0：否，1：是）
 content	String	回复内容
 */
#pragma mark VIP咨询回复
#define SHINTERFACE_vipReply @"/shopxx/app/jk_vip_consulting!vipReply.action"

/*
 consultingId	String	咨询Id
 doctorId   	String	医生Id
 */
#pragma mark VIP咨询完成
#define SHINTERFACE_vipFinish @"/shopxx/app/jk_vip_consulting!finish.action"

#pragma mark ---电话问诊
//	获取医生出诊时间及价格
//参数：doctorId
#define SHINTERFACE_getTelOrderDetail @"/shopxx/app/jk_tel_counsel!getTelOrderDetail.action"

#pragma mark - 医师端接口
//==================医师端接口


#pragma mark 3.我的钱包 
//get /shopxx/app/jk_doctor!myWallet.action
//参数 doctorId  医师ID

#define SHINTERFACE_myWallet @"/shopxx/app/jk_doctor!myWallet.action"

#pragma mark 4.诊所-出诊时间
/**
 4-1.编辑出诊时间
 /shopxx/app/jk_call_time!updateCallTime.action
 请求参数：（每天最多添加三个时间段：timePart）
 参数名称	    类型	    注释
 doctorId	String	医师ID
 weekFlag	int	    0: 特别设定，1-7: 周一至周日
 timePart	Int	    1-时间段1，2-时间段2，3-时间段3
 beginTime	String	开始时间
 endTime	String	结束时间
 
 */
#define SHINTERFACE_updateCallTime @"/shopxx/app/jk_call_time!updateCallTime.action"

/**
 4-2 出诊时间列表
 请求方式：get
 请求地址：/shopxx/app/jk_call_time!getCallTime.action
 请求参数：
 参数名称	类型	注释
 doctorId	String	医师ID
 
 返回参数：
 参数名称	    类型	    注释
 callTime          （出诊时间）
 doctorId	String	医师ID
 especial	String	特别设定ID
 week1-week7	String	周一至周日ID
 details（出诊时间段详情）
 id	        String	等于出诊时间中的especial以及wee1-7
 part1-part3	String	出诊时间段
 */
#define SHINTERFACE_getCallTime @"/shopxx/app/jk_call_time!getCallTime.action"

#pragma mark 5.诊所出诊价格
/**
 5.1.  编辑出诊价格
 请求方式：post
 请求地址：/shopxx/app/jk_doctor!editCallPrice.action
 请求参数：（每天最多添加三个时间段：timePart）
 参数名称	    类型	    注释
 doctorId	String	医师ID
 priceFlag	int	    0: 图文咨询价格，1-电话咨询价格1，2-电话咨询价格2
 price	    String	价格
 
 */
#define SHINTERFACE_editCallPrice @"/shopxx/app/jk_doctor!editCallPrice.action"

/**
 5.2.  查询出诊价格
 请求方式：get
 请求地址：/shopxx/app/jk_doctor!getCallPrice.action
 请求参数：（每天最多添加三个时间段：timePart）
 参数名称 	类型	    注释
 doctorId	String	医师ID
 
 返回参数：
 参数名称	   类型	   注释
 doctorId	String	医师ID
 consultPrice	Double	图文咨询价格
 telConsultPrice1	Double	电话咨询价格1
 telConsultPrice2	Double	电话咨询价格2
 telConsultPrice3	Double	电话咨询价格3（预留）
 */
#define SHINTERFACE_getCallPrice @"/shopxx/app/jk_doctor!getCallPrice.action"


 #pragma mark 我的病人－图文咨询 （抢答）
 /*
 请求方式：post
 请求地址：
 shopxx/app/jk_vip_consulting!getPicTextCounsel.action
 请求参数：
 参数名称      	类型	    注释
 pageApp	    String	页码
 pageSizeApp	String	每页数量（可选）
 doctorId	    String	医师ID（402890084f73150b014f734524250015）
  返回参数：
 参数名称	         类型	注释
 id	             String	ID
 sex	         Boolean	true: 男， false-女
 age	         Integer	年龄
 avatar	         String	头像URL
 content	     String	问题内容
 createDate	     String	时间
 status	         Integer	状态：0-待回答，1-回答中，2-已完成，3-待抢答, 4－待评价，5-待支付，6-已取消

  */
#define SHINTERFACE_getimaConsultation @"/shopxx/app/jk_vip_consulting!getPicTextCounsel.action"

 
#pragma mark 我的病人-电话咨询
 /*
请求方式：Get
请求地址：
shopxx/app/jk_tel_counsel!getTelCounsel.action
请求参数：
参数名称	     类型	注释
pageApp	     String	页码
pageSizeApp	 String	每页数量（可选）
doctorId	 String	医师ID（402890084f73150b014f736056930027）

返回参数：
参数名称	       类型	注释
id	           String	咨询ID
avatar	       String	头像URL
createDate	   String	时间
phone	       String	预约电话
sex	           Boolean	true: 男， false-女
age	           Integer	年龄
durationLabel  String	预约时长
status	       Integer	状态：0-待确定，1-已确定，2-已取消，3-已退回
 
*/
#define SHINTERFACE_getphoConsultation @"/shopxx/app/jk_tel_counsel!getTelCounsel.action"

#pragma mark 我的病人-电话咨询详情
/* 请求方式：Get
 请求地址：http://192.168.16.99:9090/shopxx/app/jk_tel_counsel!getTelCounselDetail.action?doctorId=402890194f77f348014f78c8709e003f&pageApp=1&pageSizeApp=10
 请求参数：
 参数名称	类型	注释
 counselId	String	咨询ID（402890234fcf1f1d014fcf9f71460000）
 */
#define SHINTERFACE_getteldetailConsultation @"/shopxx/app/jk_tel_counsel!getTelCounselDetail.action"

#pragma mark 我的病人-电话咨询-修改预约时间
 /*
  请求方式：Post
 请求地址：shopxx/app/jk_tel_counsel!updateTelCounsel.action
 请求参数：
 参数名称	        类型	     注释
 counselId	    String	 咨询ID（402890234fcf1f1d014fcf9f71460000）
 status	        Integer	 状态ID（可选0-待确定，1-已确定，2-已取消，3-已退回）
 doctorTime	    String	 医师修改的预约时间（可选）
 
 */
#define SHINTERFACE_gettelTimeConsultation @"/shopxx/app/jk_tel_counsel!updateTelCounsel.action"

#pragma mark 我的病人-电话咨询-退回预约
/*
 请求方式：Post
 请求地址：shopxx/app/jk_tel_counsel!rejectTelCounsel.action
 请求参数：
 参数名称	        类型	    注释
 counselId	    String	咨询ID（402890234fcf1f1d014fcf9f71460000）
 causeItem	    Integer	1-不是我的科室范围
 2-难度太大，无法解决
 3-客户问题奇怪，没接触过
 causeContent	String	退回原因
 departmentId	String	医师建议科室ID
 
 */
#define SHINTERFACE_gettelBackConsultation @"/shopxx/app/jk_tel_counsel!rejectTelCounsel.action"

#pragma mark 15.医师抢答
/*
 请求方式：Post
 请求地址：shopxx/app/jk_vip_reply!replyVipCounsel.action
 请求参数：
 参数名称	    类型	    注释
 counselId	String	咨询ID（402890234fcf1f1d014fcf9f71460000）
 doctorId	String	医师ID（402890084f73150b014f734524250015）
 content	String	回复内容
 
 */
#define SHINTERFACE_getDocQiaConsultation @"/shopxx/app/jk_vip_reply!replyVipCounsel.action"

#pragma mark  16.图文咨询回复详情 及 案例详情回复
/*

 请求方式：Get
 请求地址：shopxx/app/jk_vip_reply!getReplyies.action
 请求参数：
 参数名称	      类型	    注释
 counselId	  String	咨询ID
 pageApp	  String	页码
 pageSizeApp  String	每页数量（可选）
 */
#define SHINTERFACE_getImaConConsultation @"/shopxx/app/jk_vip_reply!getReplyies.action"

#pragma mark  17.医师查看客诉

/*

 请求方式：Get
 请求地址：http://192.168.16.99:9090/shopxx/app/jk_doctor_comment!getComplaints.action?doctorId=402890194f77f348014f78c8709e003f&pageApp=1&pageSizeApp=10
 请求参数：
 参数名称	    类型	    注释
 doctorId	String	医师ID（402890084f73150b014f73667811002b）
 pageApp	    String	页码
 pageSizeApp	String	每页数量（可选）
 
 */
#define SHINTERFACE_getLookConsultation @"/shopxx/app/jk_doctor_comment!getComplaints.action"

#pragma mark  18、医师提交申诉
/*
 请求方式：Post
 请求地址：shopxx/app/jk_doctor_comment!addDoctorAppeal.action
 请求参数：
 参数名称	        类型	    注释
 doctorId	    String	医师ID
 complaintId	String	客诉ID（402890234fd4f0a5014fd4f589a30001）
 content	    String	申诉内容
 */
#define SHINTERFACE_getSubmittion @"/shopxx/app/jk_doctor_comment!addDoctorAppeal.action"

#pragma mark 19、免费咨询患者列表
//传入参数:pageApp(int)、pageSizeApp(int)
#define SHINTERFACE_getPatientsList @"/shopxx/app/jk_cases!getQuestionList.action"

#pragma mark 20、抢答
//传入参数:pageApp(int)、pageSizeApp(int)
#define SHINTERFACE_getRobAnsewerList @"/shopxx/app/jk_vip_consulting!getPicTextCounsel.action"

#pragma mark 21、立即抢答
//传入参数:counselId, doctorId
#define SHINTERFACE_getRightNowAnsewerList @"/shopxx/app/jk_vip_consulting!viesAnswer.action"


#pragma mark --- 关注－获取医生或医院接口
//传入参数:type (1:医师 ， 2:医院), pageSize, page, memberId
#define SHINTERFACE_getFollowList @"/shopxx/app/jk_follow!getFollowList.action"

#pragma mark --- 关注接口
//传入参数:type (1:医师 ， 2:医院), jkId(关注对象id), memberId
#define SHINTERFACE_saveFollow @"/shopxx/app/jk_follow!saveFollow.action"

#endif
