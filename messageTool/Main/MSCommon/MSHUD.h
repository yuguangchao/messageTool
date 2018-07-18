//
//  MSHUD.h
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define HUD [MSHUD hud]
@interface MSHUD : NSObject
+ (instancetype)hud;
- (void)dismiss;
- (void)showCustomHudWithStatus:(NSString *)status onView:(UIView *)view;
- (void)showInfo:(NSString *)info onView:(UIView *)view;
@end
