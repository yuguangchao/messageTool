//
//  MSMoreFunctionModel.h
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSMoreFunctionModel : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *imageurl;
+ (instancetype)revisePassModel;
+ (instancetype)helpModel;
+ (instancetype)setSignModel;
+ (instancetype)privacyModel;
@end
