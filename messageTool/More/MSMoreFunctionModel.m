//
//  MSMoreFunctionModel.m
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSMoreFunctionModel.h"

@implementation MSMoreFunctionModel
+ (instancetype)helpModel
{
    MSMoreFunctionModel *model = [[MSMoreFunctionModel alloc] init];
    model.title = @"帮助中心";
    model.imageurl = @"wenhao";
    return model;
}
+ (instancetype)revisePassModel
{
    MSMoreFunctionModel *model = [[MSMoreFunctionModel alloc] init];
    model.title = @"修改密码";
    model.imageurl = @"xiaosuo";
    return model;
}
+ (instancetype)setSignModel
{
    MSMoreFunctionModel *model = [[MSMoreFunctionModel alloc] init];
    model.title = @"设置签名";
    model.imageurl = @"setting";
    return model;
}
+ (instancetype)privacyModel
{
    MSMoreFunctionModel *model = [[MSMoreFunctionModel alloc] init];
    model.title = @"隐私政策";
    model.imageurl = @"Privacy";
    return model;
}
@end
