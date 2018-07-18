//
//  MSMAddanualViewController.m
//  messageTool
//
//  Created by yyy on 2018/5/10.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSMAddanualViewController.h"
#import "MSManualAddView.h"
#import "MSHeaderFile.h"
@interface MSMAddanualViewController ()
@property (nonatomic, strong) MSManualAddView *manView;
@end

@implementation MSMAddanualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"手动添加联系人";
    self.view = self.manView;
}
- (MSManualAddView *)manView
{
    if (!_manView) {
        _manView = ({
            MSManualAddView *view = [[MSManualAddView alloc] initWithFrame:self.view.bounds];
            __weak typeof(self) weakself=self;
            view.saveBlock = ^{
                [weakself.navigationController popViewControllerAnimated:YES];
            };
            view;
        });
    }
    return _manView;
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
