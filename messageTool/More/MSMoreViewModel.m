//
//  MSMoreViewModel.m
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSMoreViewModel.h"

@implementation MSMoreViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupFunctionSetting];
    }
    return self;
}
- (void)setupFunctionSetting
{
    MSMoreFunctionModel *helpModel = [MSMoreFunctionModel helpModel];
    MSMoreFunctionModel *reviseModel = [MSMoreFunctionModel revisePassModel];
    MSMoreFunctionModel *setSignModel = [MSMoreFunctionModel setSignModel];
    MSMoreFunctionModel *privacyModel = [MSMoreFunctionModel privacyModel];
    self.functionArray = @[reviseModel,setSignModel,helpModel,privacyModel];
}
@end
