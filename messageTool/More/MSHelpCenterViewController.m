//
//  MSHelpCenterViewController.m
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSHelpCenterViewController.h"
#import "MSHelpCenterView.h"
@interface MSHelpCenterViewController ()
@property (nonatomic, strong) MSHelpCenterView *helpView;
@end

@implementation MSHelpCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"帮助中心";
    self.view = self.helpView;
}
- (MSHelpCenterView *)helpView
{
    if (!_helpView) {
        _helpView = ({
            [[MSHelpCenterView alloc] initWithFrame:self.view.bounds];
        });
    }
    return _helpView;
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
