//
//  GlobalOpenDefine.h
//  WorkFlow
//
//  Created by liujiafei on 14-1-15.
//  Copyright (c) 2014年 liujiafei. All rights reserved.
//

#ifndef WorkFlow_GlobalOpenDefine_h
#define WorkFlow_GlobalOpenDefine_h

#pragma mark OpenLoginService
#define OpenLoginService_login                          @"/user/login"
#define OpenLoginService_register                       @"/user/register"
#define OpenLoginService_authCode                       @"/user/getAuthCode"
#define OpenLoginService_resetPW                        @"/user/resetPassword"

#pragma mark OpenUserService
#define OpenUserService_getUser                         @"/user/getUser"
#define OpenUserService_updateUser                      @"/user/updateUser"

#pragma mark OpenWalletService
#define OpenWalletService_getBalances                   @"/wallet/getBalances"

#pragma mark OpenTeacherService                        
#define OpenTeacherSerice_getAuthData                   @"/teacher/getAuthData"
#define OpenTeacherService_listPage                     @"/teacher/listPage"
#define OpenTeacherService_listByName                   @"/teacher/listByName"
#define OpenTeacherService_collect                      @"/user/collect"
#define OpenTeacherService_cancelCollect                @"/user/cancelCollect"

#pragma mark OpenQuestionService
#define OpenQuestionService_askQuestion                 @"/question/askQuestion"
#define OpenQuestionService_answerQuestion              @"/question/answerQuestion"
#define OpenQuestionService_deleteQuestion              @"/question/deleteQuestion"
#define OpenQuestionService_myQuestions                 @"/question/myQuestions"
#define OpenQuestionService_needAnswerList              @"/question/needAnswerList"

#pragma mark OpenCourseService
#define OpenCourseService_getWorthCourses               @"/course/getWorthCourses"
#define OpenCourseService_getCourseDetail               @"/course/getCourseDetail"
#define OpenCourseService_postCourses               @"/course/postCourses"
#define OpenCourseService_getOrderCourses               @"/course/getOrderCourses"
#define OpenCourseService_getSchedule               @"/course/getSchedule"
#define OpenCourseService_getOrderCoursesByUserId               @"/course/getOrderCoursesByUserId"
#define OpenCourseService_getListenCoursesByUserId               @"/course/getListenCoursesByUserId"
#define OpenCourseService_getCollectCoursesByUserId               @"/course/getCollectCoursesByUserId"
#define OpenCourseService_addAppointment               @"/course/addAppointment"
#define OpenCourseService_addListen               @"/course/addListen"
#define OpenCourseService_addCollect               @"/course/addCollect"
#define OpenCourseService_getOrderCoursesByTeacher               @"/course/getOrderCoursesByTeacher"
#define OpenCourseService_getListenCoursesByTeacher               @"/course/getListenCoursesByTeacher"
#define OpenCourseService_getInformations               @"/course/getInformations"

#endif
