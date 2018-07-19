//
//  MSLoginViewController.m
//  messageTool
//
//  Created by yyy on 2018/5/4.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSLoginViewController.h"
#import "MSLoginView.h"
#import "MSAgreementViewController.h"
#import "MSNavigationController.h"
#import "MSHeaderFile.h"
@interface MSLoginViewController ()
@property (strong, nonatomic) MSLoginView *loginView;
@end

@implementation MSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = self.loginView;
}
- (MSLoginView *)loginView
{
    if (!_loginView) {
        _loginView = ({
            MSLoginView *view = [[MSLoginView alloc] initWithFrame:self.view.bounds];
            __weak typeof(self) weakself=self;
            view.loginViewBlock = ^(NSString *account, NSString *password) {
                [weakself gotoLoginWithAccount:account PassWord:password];
            };
            view.learnAgreementBlock = ^{
                [weakself gotoAgreement];
            };
            view;
        });
    }
    return _loginView;
}
- (void)gotoLoginWithAccount:(NSString *)account PassWord:(NSString *)password
{
    [HUD showCustomHudWithStatus:@"正在登录" onView:self.view];
    [MSNetWorkManager loginAccount:account Password:password success:^(MSServerResultBase *result) {
        [HUD dismiss];
        [HUD showInfo:@"登录成功" onView:self.view];
        //本地存储
        NSDictionary *param = @{@"userid":result.retInfo,
                                @"account":account,
                                @"password":password
                                };
        [[NSUserDefaults standardUserDefaults] setObject:param forKey:MSUserInfo];
        [[NSUserDefaults standardUserDefaults] synchronize];
        APPWindow.rootViewController = [MStabBarController new];
    } failure:^(MSServerResultBase *error) {
        [HUD dismiss];
        [HUD showInfo:error.retInfo onView:self.view];
    }];
}
- (void)gotoAgreement
{
    MSNavigationController *navigationVC = [[MSNavigationController alloc] initWithRootViewController:[MSAgreementViewController new]];
    [self presentViewController:navigationVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
