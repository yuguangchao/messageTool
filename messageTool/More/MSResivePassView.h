//
//  MSResivePassView.h
//  messageTool
//
//  Created by yyy on 2018/5/6.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSResivePassView : UIView
@property (copy, nonatomic) void (^modifyPwdBlock)(NSString *oldPwd,NSString *newPwd,NSString *againPwd);
@end
