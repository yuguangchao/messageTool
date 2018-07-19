//
//  MSNetWorkManager.m
//  messageTool
//
//  Created by yyy on 2018/5/7.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSNetWorkManager.h"
#import "XMLDictionary.h"
#import "AFNetworking.h"
@interface MSNetWorkManager ()<NSXMLParserDelegate>
@end
@implementation MSNetWorkManager
+ (NSURLSessionTask *)queryAccountBnalance:(NSDictionary *)param
                                   success:(void (^)(MSServerResultBase *result))success
                                   failure:(void (^)(MSServerResultBase *error))failure
{
    NSDictionary *pardic = @{@"userid":param[@"userid"],
                          @"account":param[@"account"],
                          @"password":param[@"password"],
                          @"action":@"overage"
                          };
    return [MSRequestManager postXMLHTTPS:MS_BaseUrl params:pardic operation:^(NSURLSessionTask *requestOperation) {
    } success:^(id responceObj) {
        NSXMLParser *parser = (NSXMLParser *)responceObj;
        NSDictionary *dic = [NSDictionary dictionaryWithXMLParser:parser];
        MSServerResultBase *result = [[MSServerResultBase alloc] init];
        if ([dic[@"returnstatus"] isEqualToString:@"Sucess"]) {
            result.retInfo = dic[@"overage"];
            success(result);
        }else if (failure){
            result.retInfo = dic[@"message"];
            failure(result);
        }
    } failure:^(NSError *connectError, long responseStatusCode) {
        if (failure) {
            failure([MSServerResultBase netException]);
        }
    }];
}
+ (NSURLSessionTask *)sendMessage:(NSDictionary *)param success:(void (^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure
{
    NSDictionary *pardic = @{@"userid":param[@"userid"],
                             @"account":param[@"account"],
                             @"password":param[@"password"],
                             @"action":@"send",
                             @"mobile":param[@"mobile"],
                             @"content":param[@"content"],
                             @"sendTime":param[@"stime"]
                             };
    return [MSRequestManager postXMLHTTPS:MS_BaseUrl params:pardic operation:^(NSURLSessionTask *requestOperation) {

    } success:^(id responceObj) {
        NSXMLParser *parser = (NSXMLParser *)responceObj;
        NSDictionary *dic = [NSDictionary dictionaryWithXMLParser:parser];
        MSServerResultBase *result = [[MSServerResultBase alloc] init];
        if ([dic[@"returnstatus"] isEqualToString:@"Success"]) {
            if ([dic[@"message"] isEqualToString:@"ok"]) {
                result.retInfo = dic[@"remainpoint"];
                success(result);
            }
        }else if (failure){
            result.retInfo = dic[@"message"];
            failure(result);
        }
    } failure:^(NSError *connectError, long responseStatusCode) {
        if (failure) {
            failure([MSServerResultBase netException]);
        }
    }];
}
+ (NSURLSessionTask *)checkSensitive:(NSDictionary *)param success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure
{
    NSDictionary *pardic = @{@"userid":param[@"userid"],
                             @"account":param[@"account"],
                             @"password":param[@"password"],
                             @"action":@"checkkeyword",
                             @"content":param[@"content"]
                             };
    return [MSRequestManager postXMLHTTPS:MS_BaseUrl params:pardic operation:^(NSURLSessionTask *requestOperation) {
    } success:^(id responceObj) {
        NSXMLParser *parser = (NSXMLParser *)responceObj;
        NSDictionary *dic = [NSDictionary dictionaryWithXMLParser:parser];
        MSServerResultBase *result = [[MSServerResultBase alloc] init];
        if ([dic[@"returnstatus"] isEqualToString:@"Success"]) {
            if ([dic[@"message"] isEqualToString:@"没有包含屏蔽词"]) {
                result.retInfo = dic[@"message"];
                success(result);
            }else if (failure){
                result.retInfo = dic[@"message"];
                failure(result);
            }
        }else if (failure){
            result.retInfo = dic[@"message"];
            failure(result);
        }
    } failure:^(NSError *connectError, long responseStatusCode) {
        if (failure) {
            failure([MSServerResultBase netException]);
        }
    }];
}
+ (NSURLSessionTask *)modifyPassWord:(NSDictionary *)param success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure
{
    NSDictionary *pardic = @{@"userid":param[@"userid"],
                             @"account":param[@"account"],
                             @"password":param[@"password"],
                             @"action":@"changespwd",
                             @"newpwd":param[@"newpwd"],
                             @"renewpwd":param[@"againpwd"]
                             };
    return [MSRequestManager postXMLHTTPS:MS_BaseUrl params:pardic operation:^(NSURLSessionTask *requestOperation) {
    } success:^(id responceObj) {
        NSXMLParser *parser = (NSXMLParser *)responceObj;
        NSDictionary *dic = [NSDictionary dictionaryWithXMLParser:parser];
        MSServerResultBase *result = [[MSServerResultBase alloc] init];
        if ([dic[@"returnstatus"] isEqualToString:@"Success"]) {
            success(result);
        }else if (failure){
            result.retInfo = dic[@"message"];
            failure(result);
        }
    } failure:^(NSError *connectError, long responseStatusCode) {
        if (failure) {
            failure([MSServerResultBase netException]);
        }
    }];
}
+ (NSURLSessionTask *)getSendStatus:(NSDictionary *)param success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure
{
    NSDictionary *pardic = @{@"userid":param[@"userid"],
                             @"account":param[@"account"],
                             @"password":param[@"password"],
                             @"action":@"query"
                             };
    return [MSRequestManager postXMLHTTPS:@"http://www.dxqf188.cn/statusApi.aspx" params:pardic operation:^(NSURLSessionTask *requestOperation) {
    } success:^(id responceObj) {
        NSXMLParser *parser = (NSXMLParser *)responceObj;
        NSDictionary *dic = [NSDictionary dictionaryWithXMLParser:parser];
        MSServerResultBase *result = [[MSServerResultBase alloc] init];
        if ([dic[@"returnstatus"] isEqualToString:@"Success"]) {
            success(result);
        }else if (failure){
            result.retInfo = dic[@"message"];
            failure(result);
        }
    } failure:^(NSError *connectError, long responseStatusCode) {
        if (failure) {
            failure([MSServerResultBase netException]);
        }
    }];
}
+ (NSURLSessionTask *)registerAccount:(NSDictionary *)param success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure
{
    NSDictionary *pardic = @{@"account":@"88100278",
                             @"password":@"88100278",
                             @"company":@"",
                             @"realname":@"",
                             @"mobile":@"",
                             @"qq":@"",
                             @"email":@""
                             };
    return [MSRequestManager postJSONHTTPS:[NSString stringWithFormat:@"%@%@",MS_BaseUrlV2,MS_Register_Url] params:pardic operation:^(NSURLSessionTask *requestOperation) {
    } success:^(id responceObj) {
        MSServerResultBase *result = [[MSServerResultBase alloc] init];
        result.retInfo = responceObj[@"retInfo"];
        if ([responceObj[@"retCode"] isEqualToString:@"S"]) {
            success(result);
        }else if (failure){
            failure(result);
        }
    } failure:^(NSError *connectError, long responseStatusCode) {
        if (failure) {
            failure([MSServerResultBase netException]);
        }
    }];
}
+ (NSURLSessionTask *)loginAccount:(NSString *)account Password:(NSString *)password success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure
{
    NSDictionary *pardic = @{@"account":account,
                             @"password":password
                             };
    return [MSRequestManager postJSONHTTPS:[NSString stringWithFormat:@"%@%@",MS_BaseUrlV2,MS_Login_Url] params:pardic operation:^(NSURLSessionTask *requestOperation) {
    } success:^(id responceObj) {
        MSServerResultBase *result = [[MSServerResultBase alloc] init];
        if ([responceObj[@"retCode"] isEqualToString:@"S"]) {
            result.retInfo = responceObj[@"comId"];
            success(result);
        }else if (failure){
            result.retInfo = responceObj[@"retInfo"];
            failure(result);
        }
    } failure:^(NSError *connectError, long responseStatusCode) {
        if (failure) {
            failure([MSServerResultBase netException]);
        }
    }];
}
+ (NSURLSessionTask *)getForceSign:(NSDictionary *)param success:(void(^)(MSServerResultBase *result))success failure:(void (^)(MSServerResultBase *error))failure
{
    NSDictionary *pardic = @{@"account":@"88100278",
                             @"password":@"88100278"
                             };
    return [MSRequestManager postJSONHTTPS:[NSString stringWithFormat:@"%@%@",MS_BaseUrlV2,MS_GetSign_Url] params:pardic operation:^(NSURLSessionTask *requestOperation) {
    } success:^(id responceObj) {
        MSServerResultBase *result = [[MSServerResultBase alloc] init];
        result.retInfo = responceObj[@"retInfo"];
        if ([responceObj[@"retCode"] isEqualToString:@"S"]) {
            success(result);
        }else if (failure){
            failure(result);
        }
    } failure:^(NSError *connectError, long responseStatusCode) {
        if (failure) {
            failure([MSServerResultBase netException]);
        }
    }];
}
@end
