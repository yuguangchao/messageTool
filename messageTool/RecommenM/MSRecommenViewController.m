//
//  MSRecommenViewController.m
//  messageTool
//
//  Created by yyy on 2018/5/4.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSRecommenViewController.h"
#import "MSRecommentView.h"
@interface MSRecommenViewController ()
@property (nonatomic, strong) MSRecommentView *reCommentView;
@end

@implementation MSRecommenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = self.reCommentView;
}
- (MSRecommentView *)reCommentView
{
    if (!_reCommentView) {
        _reCommentView = ({
            MSRecommentView *view = [[MSRecommentView alloc] initWithFrame:self.view.bounds];
            view;
        });
    }
    return _reCommentView;
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
