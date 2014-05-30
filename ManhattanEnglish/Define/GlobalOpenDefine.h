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

#endif
