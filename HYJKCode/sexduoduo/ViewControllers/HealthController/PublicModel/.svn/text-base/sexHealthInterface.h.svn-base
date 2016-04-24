//
//  sexHealthInterface.h
//  sexduoduo
//
//  Created by showm on 15/8/28.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#ifndef sexduoduo_sexHealthInterface_h
#define sexduoduo_sexHealthInterface_h

//#define sexHealthIP @"http://192.168.16.163:8080"
#define sexHealthIP @"http://www.xingduoduo.com"
#define sexHealthTestIP @"http://192.168.16.99:9090"

/*
 测试ip：192.168.16.163:8080
 性健康医师端IP//192.168.16.99:9090
 */
#define sexHealthDoctorIP @"http://192.168.16.99:9090/"

//1科普知识列表
// /shopxx/app/jk_article!knowledgeList.action
//  传入参数：pageApp，pageSizeApp
#define SHINTERFACE_knowledgeList @"/shopxx/app/jk_article!knowledgeList.action"


//2科普知识详情
//  /shopxx/app/jk_article!knowledgeDetail.action
//   传入参数：id
#define SHINTERFACE_knowledgeDetail @"/shopxx/app/jk_article!knowledgeDetail.action"

//3获取热门搜索
#define SHINTERFACE_knowledgeSearchPage @"/shopxx/app/jk_article!knowledgeSearchPage.action"

//4搜索科普知识
//  传入参数：key,pageApp,pageSizeApp
#define SHINTERFACE_knowledgeSearch @"/shopxx/app/jk_article!knowledgeSearch.action"

//5根据区域查找医生
//  传入参数：pageApp、pageSizeApp、lng、lat
#define SHINTERFACE_selectDoctorArea @"/shopxx/app/jk_doctor!selectDoctorArea.action"

//6查找心理医生
//  传入参数：pageApp、pageSizeApp、lng、lat
#define SHINTERFACE_getCounselingList @"/shopxx/app/jk_doctor!getCounselingList.action"

//7医生详情
//  传入参数：doctorId
#define SHINTERFACE_getDoctorDetail @"/shopxx/app/jk_doctor!getDoctorDetail.action"
//8免费咨询列表
#define SHINTERFACE_getConsultingList @"/shopxx/app/jk_cases!getQuestionList.action"
/*
 * 8根据城市名称获取医生列表
 * shopxx/app/jk_doctor!getDoctorArea.action
 * 传入参数：pageApp、pageSizeApp、areaName
 * 
 */
//9根据城市名称获取心理医生列表
//传入参数：pageApp、pageSizeApp、areaName
#define SHINTERFACE_getPsychologistArea @"/shopxx/app/jk_doctor!getPsychologistArea.action"

/*
 10获取推荐医生列表
 shopxx/app/jk_doctor!recommendedDoctor.action
 */
#define SHINTERFACE_recommendedDoctor @"/shopxx/app/jk_doctor!recommendedDoctor.action"

//11获取推荐心理医生列表
#define SHINTERFACE_recommendedCounseling @"/shopxx/app/jk_doctor!recommendedCounseling.action"

//12根据坐标获取医院列表
//传入参数：pageApp、pageSizeApp、lng、lat
#define SHINTERFACE_getNearbyHospitalList @"/shopxx/app/jk_hospital!getNearbyHospitalList.action"

//13根据城市名称获取医院列表
//传入参数：pageApp、pageSizeApp、areaName
#define SHINTERFACE_getHospitalList @"/shopxx/app/jk_hospital!getHospitalList.action"

/*
 14获取推荐医院列表
 shopxx/app/jk_hospital!recommendedHospital.action
 传入参数：pageApp、pageSizeApp
 */
#define SHINTERFACE_recommendedHospital @"/shopxx/app/jk_hospital!recommendedHospital.action"


/*
 15获取疾病类型列表
 shopxx/app/jk_cases!selfDiagnoseList.action
 */
#define SHINTERFACE_selfDiagnoseList @"/shopxx/app/jk_cases!selfDiagnoseList.action"

/*
 16获取疾病详情
 shopxx/app/jk_cases!getDiseaseDetail.action
 传入参数：diseaseCategoryId
 */
#define SHINTERFACE_getDuseaseDetail @"/shopxx/app/jk_cases!getDiseaseDetail.action"


//17免费咨询
//传入参数：userId、isAnonymous（是否匿名，0:是，1:否）、patientSex（性别，0:男，1:女）、patientAge（年龄）、patientQuest（咨询内容）
#define SHINTERFACE_freeConsult @"/shopxx/app/jk_cases!freeConsult.action"


//18获取医院详情
//传入参数：hospitalId
#define SHINTERFACE_getHospitalDetail  @"/shopxx/app/jk_hospital!getHospitalDetail.action"

//19免费咨询列表
#define SHINTERFACE_getQuestionList  @"/shopxx/app/jk_cases!getQuestionList.action"

//20免费咨询回复
//传入参数：userId、casesId、doctorId、isAnonymous、content
#define SHINTERFACE_doctorReplyConsult  @"/shopxx/app/jk_cases!doctorReplyConsult.action"

//21获取免费咨询详情
//传入参数：casesId
#define SHINTERFACE_getQuestionDetail  @"/shopxx/app/jk_cases!getQuestionDetail.action"


/*
 22.首页广告
 shopxx/app/jk_article!getAdvertising.action
 */
#define SHINTERFACE_getAdvertising @"/shopxx/app/jk_article!getAdvertising.action"


//==================医师端接口


//3.我的钱包 get /shopxx/app/jk_doctor!myWallet.action
//参数 doctorId  医师ID

#define SHINTERFACE_myWallet @"/shopxx/app/jk_doctor!myWallet.action"

//4.诊所-出诊时间
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

//5.诊所出诊价格
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


/*
 我的病人－图文咨询
 请求方式：get
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
 status	         Integer	状态：0-待回答，1-回答中，2-已完成，3-待抢答

  */
#define SHINTERFACE_getimaConsultation @"shopxx/app/jk_vip_consulting!getPicTextCounsel.action"
/*
我的病人-电话咨询
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
#define SHINTERFACE_getphoConsultation @"shopxx/app/jk_tel_counsel!getTelCounsel.action"

/*
 我的病人-电话咨询详情
 请求方式：Get
 请求地址：http://192.168.16.99:9090/shopxx/app/jk_tel_counsel!getTelCounselDetail.action?doctorId=402890194f77f348014f78c8709e003f&pageApp=1&pageSizeApp=10
 请求参数：
 参数名称	类型	注释
 counselId	String	咨询ID（402890234fcf1f1d014fcf9f71460000）
 */
#define SHINTERFACE_getteldetailConsultation @"shopxx/app/jk_tel_counsel!getTelCounselDetail.action"
/*
 我的病人-电话咨询-修改预约时间
 请求方式：Post
 请求地址：shopxx/app/jk_tel_counsel!updateTelCounsel.action
 请求参数：
 参数名称	        类型	     注释
 counselId	    String	 咨询ID（402890234fcf1f1d014fcf9f71460000）
 status	        Integer	 状态ID（可选0-待确定，1-已确定，2-已取消，3-已退回）
 doctorTime	    String	 医师修改的预约时间（可选）
 
 */
#define SHINTERFACE_gettelTimeConsultation @"shopxx/app/jk_tel_counsel!updateTelCounsel.action"
/*
 我的病人-电话咨询-退回预约
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
#define SHINTERFACE_gettelBackConsultation @"shopxx/app/jk_tel_counsel!rejectTelCounsel.action"
/*
 15.医师抢答
 请求方式：Post
 请求地址：shopxx/app/jk_vip_reply!replyVipCounsel.action
 请求参数：
 参数名称	    类型	    注释
 counselId	String	咨询ID（402890234fcf1f1d014fcf9f71460000）
 doctorId	String	医师ID（402890084f73150b014f734524250015）
 content	String	回复内容
 
 */
#define SHINTERFACE_getDocQiaConsultation @"shopxx/app/jk_vip_reply!replyVipCounsel.action"
/*
 16.图文咨询回复详情
 请求方式：Get
 请求地址：shopxx/app/jk_vip_reply!getReplyies.action
 请求参数：
 参数名称	      类型	    注释
 counselId	  String	咨询ID
 pageApp	  String	页码
 pageSizeApp  String	每页数量（可选）
 */
#define SHINTERFACE_getImaConConsultation @"shopxx/app/jk_vip_reply!getReplyies.action"
/*
 17.医师查看客诉
 请求方式：Get
 请求地址：http://192.168.16.99:9090/shopxx/app/jk_doctor_comment!getComplaints.action?doctorId=402890194f77f348014f78c8709e003f&pageApp=1&pageSizeApp=10
 请求参数：
 参数名称	    类型	    注释
 doctorId	String	医师ID（402890084f73150b014f73667811002b）
 pageApp	    String	页码
 pageSizeApp	String	每页数量（可选）
 
 */
#define SHINTERFACE_getLookConsultation @"shopxx/app/jk_doctor_comment!getComplaints.action"
/*
 18、医师提交申诉
 请求方式：Post
 请求地址：shopxx/app/jk_doctor_comment!addDoctorAppeal.action
 请求参数：
 参数名称	        类型	    注释
 doctorId	    String	医师ID
 complaintId	String	客诉ID（402890234fd4f0a5014fd4f589a30001）
 content	    String	申诉内容
 */
#define SHINTERFACE_getSubmittion @"shopxx/app/jk_doctor_comment!addDoctorAppeal.action"

#endif
