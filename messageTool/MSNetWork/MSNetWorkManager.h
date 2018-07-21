//
//  MSNetWorkManager.h
//  messageTool
//
//  Created by yyy on 2018/5/7.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSHeaderFile.h"
#import "MSRequestManager.h"
#import "MSServerResultBase.h"
@interface MSNetWorkManager : NSObject
//查询账号余额（登录）
+ (NSURLSessionTask *)queryAccountBnalance:(NSDictionary *)param success:(void (^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure;
//发送短信
+ (NSURLSessionTask *)sendMessage:(NSDictionary *)param success:(void (^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure;
//检查敏感词
+ (NSURLSessionTask *)checkSensitive:(NSDictionary *)param success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure;
//修改密码
+ (NSURLSessionTask *)modifyPassWord:(NSDictionary *)param success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure;
//获取短信发送状态
+ (NSURLSessionTask *)getSendStatus:(NSDictionary *)param success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure;
//注册
+ (NSURLSessionTask *)registerAccount:(NSDictionary *)param success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure;
//登录
+ (NSURLSessionTask *)loginAccount:(NSString *)account Password:(NSString *)password success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure;
//查询强制签名
+ (NSURLSessionTask *)getForceSign:(NSDictionary *)param success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure;
//查询回复短信

@end
