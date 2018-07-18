//
//  MSSetSignView.h
//  messageTool
//
//  Created by yyy on 2018/5/6.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSSetSignView : UIView
@property (nonatomic, copy) void (^saveSign)();
@end
