//
//  MSHaveSendViewController.m
//  messageTool
//
//  Created by 于光超 on 2018/7/20.
//  Copyright © 2018年 于光超. All rights reserved.
//

#import "MSHaveSendViewController.h"
#import "MSHaveSendView.h"
@interface MSHaveSendViewController ()
@property (nonatomic, strong) MSHaveSendView *haveView;
@end

@implementation MSHaveSendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的已发送";
    self.view = self.haveView;
}
- (MSHaveSendView *)haveView
{
    if (!_haveView) {
        _haveView = ({
            MSHaveSendView *view = [[MSHaveSendView alloc] initWithFrame:self.view.bounds];
            view;
        });
    }
    return _haveView;
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
