//
//  MSMainViewController.m
//  messageTool
//
//  Created by 于光超 on 2018/7/20.
//  Copyright © 2018年 于光超. All rights reserved.
//

#import "MSMainViewController.h"
#import "MSHeaderFile.h"
#import "MSMainView.h"
@interface MSMainViewController ()
@property (nonatomic, strong) MSMainView *mainView;

@end

@implementation MSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = self.mainView;
}
- (MSMainView *)mainView
{
    if (!_mainView) {
        _mainView = ({
            MSMainView *view = [[MSMainView alloc] initWithFrame:self.view.bounds];
            view;
        });
    }
    return _mainView;
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
