//
//  MSRequestManager.h
//  messageTool
//
//  Created by yyy on 2018/5/7.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface MSRequestManager : NSObject
+ (NSURLSessionDataTask *)postXMLHTTPS:(NSString *)url params:(NSDictionary *)params operation:(void (^)(NSURLSessionTask *requestOperation))operation success:(void (^)(id responceObj))success failure:(void (^)(NSError *connectError, long responseStatusCode))failure;
+ (NSURLSessionDataTask *)postJSONHTTPS:(NSString *)url params:(NSDictionary *)params operation:(void (^)(NSURLSessionTask *requestOperation))operation success:(void (^)(id responceObj))success failure:(void (^)(NSError *connectError, long responseStatusCode))failure;
@end
