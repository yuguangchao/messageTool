//
//  MSSetSignViewController.m
//  messageTool
//
//  Created by yyy on 2018/5/6.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSSetSignViewController.h"
#import "MSSetSignView.h"
#import "MSHeaderFile.h"
@interface MSSetSignViewController ()
@property (nonatomic, strong) MSSetSignView *setView;
@end

@implementation MSSetSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置签名";
    self.view = self.setView;
}
- (MSSetSignView *)setView
{
    if (!_setView) {
        _setView = ({
            MSSetSignView *view = [[MSSetSignView alloc] initWithFrame:self.view.bounds];
            __weak typeof(self) weakself=self;
            view.saveSign = ^{
                [HUD showInfo:@"保存成功" onView:APPWindow];
                [weakself backToMoreView];
            };
            view;
        });
    }
    return _setView;
}
- (void)backToMoreView
{
    [self.navigationController popViewControllerAnimated:YES];
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
