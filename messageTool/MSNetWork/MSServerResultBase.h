//
//  MSServerResultBase.h
//  messageTool
//
//  Created by yyy on 2018/5/7.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSServerResultBase : NSObject
/** 返回结果代码，0为成功 */
@property (nonatomic, copy) NSString *retCode;
/** 结果描述 */
@property (nonatomic, copy) NSString *retInfo;
+ (MSServerResultBase *)netException;
@end
