//
//  MSSendMViewController.m
//  messageTool
//
//  Created by yyy on 2018/5/4.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSSendMViewController.h"
#import "MSSendMView.h"
#import "MSHeaderFile.h"
#import "MSContactsViewController.h"
@interface MSSendMViewController ()
@property (nonatomic, strong) MSSendMView *sendView;
@property (nonatomic, strong) UIButton *rightBtn;
@end

@implementation MSSendMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *remanentDict = [[NSUserDefaults standardUserDefaults] objectForKey:MSUserInfo];
    
    [MSNetWorkManager queryAccountBnalance:remanentDict success:^(MSServerResultBase *result) {
        [self.rightBtn setTitle:[NSString stringWithFormat:@"剩余%@条",result.retInfo] forState:UIControlStateNormal];
    } failure:^(MSServerResultBase *error) {
    }];
    self.view = self.sendView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    self.sendView.signArray = [[NSUserDefaults standardUserDefaults] objectForKey:MSSign];
    NSString *shoudongsrr = [[NSUserDefaults standardUserDefaults] objectForKey:MSShouDongAddPhone];
    NSArray *shoudongarr;
    NSString *addList = [[NSUserDefaults standardUserDefaults] objectForKey:MSAddressList];
    NSArray *addArr;
    NSMutableArray *totalArr = [NSMutableArray array];
    if (![shoudongsrr isEqualToString:@""]) {
        shoudongarr = [shoudongsrr componentsSeparatedByString:@","];
        //去重复
        for (NSString *str in shoudongarr) {
            if (![totalArr containsObject:str]) {
                [totalArr addObject:str];
            }
        }
    }
    if (![addList isEqualToString:@""]) {
        addArr = [addList componentsSeparatedByString:@","];
        //去重复
        for (NSString *str in addArr) {
            if (![totalArr containsObject:str]) {
                [totalArr addObject:str];
            }
        }
    }
    self.sendView.phoneArrays = totalArr;
}
- (MSSendMView *)sendView
{
    if (!_sendView) {
        _sendView = ({
            MSSendMView *view = [[MSSendMView alloc] initWithFrame:self.view.bounds];
            __weak typeof(self) weakself=self;
            view.addAddressBlock = ^{
                [weakself addAddress];
            };
            view.sendMessageSuccess = ^(NSString *yuer) {
                [weakself.rightBtn setTitle:[NSString stringWithFormat:@"剩余%@条",yuer] forState:UIControlStateNormal];
            };
            view;
        });
    }
    return _sendView;
}
- (UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = ({
            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [backButton setTitle:@"获取短信余额失败" forState:UIControlStateNormal];
            backButton.titleLabel.font = FONTSIZE(16);
            [backButton sizeToFit];
            backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            backButton;
        });
    }
    return _rightBtn;
}
- (void)addAddress
{
    [self.navigationController pushViewController:[MSContactsViewController new] animated:YES];
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
