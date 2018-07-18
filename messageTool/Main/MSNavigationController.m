//
//  MSNavigationController.m
//  messageTool
//
//  Created by yyy on 2018/5/4.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSNavigationController.h"
#import "MSHeaderFile.h"
#import "UIImage+Color.h"
@interface MSNavigationController ()

@end

@implementation MSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
+(void)initialize{
    //重写初始化方法
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:MSBlueColor] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,FONTSIZE(20), NSFontAttributeName,nil]];
}
//重写Push方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"pop_button"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"pop_button"] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
-(void)back{
    [self popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
