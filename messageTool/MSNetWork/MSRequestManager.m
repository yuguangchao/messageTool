//
//  MSRequestManager.m
//  messageTool
//
//  Created by yyy on 2018/5/7.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSRequestManager.h"

@implementation MSRequestManager
+ (NSURLSessionDataTask *)postXMLHTTPS:(NSString *)url params:(NSDictionary *)params operation:(void (^)(NSURLSessionTask *requestOperation))operation success:(void (^)(id responceObj))success failure:(void (^)(NSError *connectError, long responseStatusCode))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15;
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    manager.securityPolicy = securityPolicy;
    return [manager POST:url
              parameters:params
                progress:nil
                 success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                     if (operation) {
                         operation((NSURLSessionTask *)task);
                     }
                     success(responseObject);
                 }
                 failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                     if (operation) {
                         operation((NSURLSessionTask *)task);
                     }
                     failure(error, ((NSHTTPURLResponse *)task.response).statusCode);
                 }];
}
+ (NSURLSessionDataTask *)postJSONHTTPS:(NSString *)url params:(NSDictionary *)params operation:(void (^)(NSURLSessionTask *requestOperation))operation success:(void (^)(id responceObj))success failure:(void (^)(NSError *connectError, long responseStatusCode))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15;
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    manager.securityPolicy = securityPolicy;
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/javascript",
                                                         @"application/json",
                                                         @"text/json",
                                                         @"text/plain",
                                                         @"text/html",nil];
    return [manager POST:url
              parameters:params
                progress:nil
                 success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                     if (operation) {
                         operation((NSURLSessionTask *)task);
                     }
                     success(responseObject);
                 }
                 failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                     if (operation) {
                         operation((NSURLSessionTask *)task);
                     }
                     failure(error, ((NSHTTPURLResponse *)task.response).statusCode);
                 }];
}
@end
