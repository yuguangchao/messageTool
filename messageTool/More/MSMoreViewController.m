//
//  MSMoreViewController.m
//  messageTool
//
//  Created by yyy on 2018/5/4.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSMoreViewController.h"
#import "MSMoreView.h"
#import "MSHelpCenterViewController.h"
#import "MSResivePassViewController.h"
#import "MSSetSignViewController.h"
#import "MSPrivacyAgreementViewController.h"
#import "MSHeaderFile.h"
@interface MSMoreViewController ()
@property (nonatomic, strong) MSMoreView *moreview;
@end

@implementation MSMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = self.moreview;
}
- (MSMoreView *)moreview
{
    if (!_moreview) {
        _moreview = ({
            MSMoreView *view = [[MSMoreView alloc] initWithFrame:self.view.bounds];
            __weak typeof(self) weakself=self;
            view.resivePassBlock = ^{
                [weakself gotoResivePass];
            };
            view.setSignBlock = ^{
                [weakself gotoSetSignView];
            };
            view.HelpCenterBlock = ^{
                [weakself gotoHelpView];
            };
            view.logOutBlock = ^{
                [weakself logOutAction];
            };
            view.PrivacyBlock = ^{
                [weakself gotoPrivacyAgreementView];
            };
            view;
        });
    }
    return _moreview;
}
- (void)gotoResivePass
{
    [self.navigationController pushViewController:[MSResivePassViewController new] animated:YES];
}
- (void)gotoSetSignView
{
    [self.navigationController pushViewController:[MSSetSignViewController new] animated:YES];
}
- (void)gotoHelpView
{
    [self.navigationController pushViewController:[MSHelpCenterViewController new] animated:YES];
}
- (void)gotoPrivacyAgreementView
{
    [self.navigationController pushViewController:[MSPrivacyAgreementViewController new] animated:YES];
}
- (void)logOutAction
{
    UIAlertView *WXinstall=[[UIAlertView alloc]initWithTitle:@"提示" message:@"确定要退出登录" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [WXinstall show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
     NSString *btnTitle = [alertView buttonTitleAtIndex:buttonIndex];
     if ([btnTitle isEqualToString:@"取消"]) {
         }else if ([btnTitle isEqualToString:@"确定"] ) {
             //清空本地存储
             [[NSUserDefaults standardUserDefaults] removeObjectForKey:MSUserInfo];
             [[NSUserDefaults standardUserDefaults] removeObjectForKey:MSAddressList];
             [[NSUserDefaults standardUserDefaults] removeObjectForKey:MSShouDongAddPhone];
             [[NSUserDefaults standardUserDefaults] synchronize];
             APPWindow.rootViewController = [MSLoginViewController new];
             }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
