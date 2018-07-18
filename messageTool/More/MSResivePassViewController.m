//
//  MSResivePassViewController.m
//  messageTool
//
//  Created by yyy on 2018/5/6.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSResivePassViewController.h"
#import "MSResivePassView.h"
#import "MSHeaderFile.h"
@interface MSResivePassViewController ()
@property (nonatomic, strong) MSResivePassView *ReView;
@end

@implementation MSResivePassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"修改密码";
    self.view = self.ReView;
}
- (MSResivePassView *)ReView
{
    if (!_ReView) {
        _ReView = ({
            MSResivePassView *view = [[MSResivePassView alloc] initWithFrame:self.view.bounds];
            __weak typeof(self) weakself=self;
            view.modifyPwdBlock = ^(NSString *oldPwd, NSString *newPwd, NSString *againPwd) {
                [weakself modifyPwdWithOldPwd:oldPwd NewPwd:newPwd AgainPwd:againPwd];
            };
            view;
        });
    }
    return _ReView;
}
- (void)modifyPwdWithOldPwd:(NSString *)oldPwd NewPwd:(NSString *)newPwd AgainPwd:(NSString *)againPwd
{
    NSDictionary *remanentDict = [[NSUserDefaults standardUserDefaults] objectForKey:MSUserInfo];
    if (![remanentDict[@"password"] isEqualToString:oldPwd]) {
        [HUD showInfo:@"原密码不正确" onView:self.view];
        return;
    }
    NSDictionary *param = @{@"userid":remanentDict[@"userid"],
                            @"account":remanentDict[@"account"],
                            @"password":remanentDict[@"password"],
                            @"newpwd":newPwd,
                            @"againpwd":againPwd
                            };
    [HUD showCustomHudWithStatus:@"修改中" onView:self.view];
    [MSNetWorkManager modifyPassWord:param success:^(MSServerResultBase *result) {
        [HUD dismiss];
        [HUD showInfo:@"修改成功" onView:self.view];
        //清空本地存储
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:MSUserInfo];
        [[NSUserDefaults standardUserDefaults] synchronize];
        //重新登录
        APPWindow.rootViewController = [MSLoginViewController new];
    } failure:^(MSServerResultBase *error) {
        [HUD dismiss];
        [HUD showInfo:error.retInfo onView:self.view];
    }];
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
