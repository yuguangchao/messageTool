//
//  MSHeaderFile.h
//  messageTool
//
//  Created by yyy on 2018/5/4.
//  Copyright © 2018年 yyy. All rights reserved.
//

#ifndef MSHeaderFile_h
#define MSHeaderFile_h
// Common Headers
#import <Masonry/Masonry.h>
#import "MSHUD.h"
#import "MSNetWorkManager.h"
#import "MStabBarController.h"
#import "MSLoginViewController.h"
// 屏幕适配
#define APPWindow [UIApplication sharedApplication].delegate.window
#define LastWindow [[UIApplication sharedApplication].windows lastObject]
#define SizeValueBase6Plus(value) ((value) / 414.0f * [UIScreen mainScreen].bounds.size.width)
#define FONTSIZE(size) [UIFont systemFontOfSize:SizeValueBase6Plus(size)]
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define iPhoneX (SCREENWIDTH == 375.f && SCREENHEIGHT == 812.f ? YES : NO)
// 适配iPhone X 状态栏高度
#define HR_StatusBarHeight (iPhoneX ? 44.f : 20.f)
// 适配iPhone X 导航栏高度
#define HR_NavHeight (iPhoneX ? 88.f : 64.f)
// 适配iPhone X Tabbar距离底部的距离
#define HR_TabbarSafeBottomMargin (iPhoneX ? 34.f : 0.f)
// 适配iPhone X Tabbar高度
#define HR_TabbarHeight (iPhoneX ? (49.f + 34.f) : 49.f)
//系统版本
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//颜色
#define MSColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
#define MSBlueColor MSColor(79, 161, 227)
#define MSGreyColor MSColor(215, 233, 249)
#define MSBackGroundGreyColor MSColor(239, 239, 239)
//接口
#define MS_BaseUrl @"http://www.dxqf188.cn/sms.aspx"
//二期接口
#define MS_BaseUrlV2 @"http://59.110.217.96:8090"
#define MS_Register_Url @"/httplogin/reg.html"
#define MS_Login_Url @"/httplogin/ckLogin.html"
#define MS_GetSign_Url @"/httplogin/getSign.html"
//数据本地持久化
#define MSUserInfo @"UserInfo"
#define MSSign @"sign"
#define MSSignNOComminute @"nocomminute"
#define MSShouDongAddPhone @"shoudongnumber"
#define MSAddressList @"AddressList"
#endif /* MSHeaderFile_h */
