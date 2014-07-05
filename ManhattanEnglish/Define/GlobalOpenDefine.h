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
#define OpenUserService_getStudentList                  @"/user/getStudentList"
#define OpenUserService_getOrderStudentList             @"/user/getOrderStudentList"
#define OpenUserService_getListenStudentList            @"/user/getListenStudentList"

#pragma mark OpenWalletService
#define OpenWalletService_getBalances                   @"/wallet/getBalances"

#pragma mark OpenTeacherService                        
#define OpenTeacherSerice_getAuthData                   @"/teacher/getAuthData"
#define OpenTeacherService_listPage                     @"/teacher/listPage"
#define OpenTeacherService_collect                      @"/user/collect"
#define OpenTeacherService_cancelCollect                @"/user/cancelCollect"
#define OpenTeacherService_getCollectTeachersByUserId   @"/teacher/getCollectTeachersByUserId"
#define OpenTeacherService_getTeacherDetailById         @"/teacher/getTeacherDetailById"

#pragma mark OpenQuestionService
#define OpenQuestionService_askQuestion                 @"/question/askQuestion"
#define OpenQuestionService_answerQuestion              @"/question/answerQuestion"
#define OpenQuestionService_deleteQuestion              @"/question/deleteQuestion"
#define OpenQuestionService_myQuestions                 @"/question/myQuestions"
#define OpenQuestionService_needAnswerList              @"/question/needAnswerList"

#pragma mark HomeWorkService
#define HomeWorkService_getHomeworksByUser              @"/homeWork/getHomeworksByUser"
#define HomeWorkService_getHomeworksByTeacher           @"/homeWork/getHomeworksByTeacher"
#define HomeWorkService_postHomeWork                    @"/homeWork/postHomeWork"
#define HomeWorkService_submitHomeWork                  @"/homeWork/submitHomeWork"

#endif
