//
//  MSServerResultBase.m
//  messageTool
//
//  Created by yyy on 2018/5/7.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSServerResultBase.h"
NSString *const netExceptionRetInfo = @"网络状态差，请检查网络状况";
NSString *const netExceptionRetCode = @"netError";
@implementation MSServerResultBase
+ (MSServerResultBase *)netException
{
    MSServerResultBase *netException = [[MSServerResultBase alloc] init];
    netException.retCode = netExceptionRetCode;
    netException.retInfo = netExceptionRetInfo;
    return netException;
}
@end
