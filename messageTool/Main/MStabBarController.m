//
//  MStabBarController.m
//  messageTool
//
//  Created by yyy on 2018/5/4.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MStabBarController.h"
#import "MSNavigationController.h"
#import "MSMoreViewController.h"
#import "MSRecommenViewController.h"
#import "MSSendMViewController.h"
#import "MSHeaderFile.h"
@interface MStabBarController ()

@end

@implementation MStabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupItem];
    [self setupChildVC];
}
- (void)setupChildVC{
    [self setupChildVc:[MSSendMViewController new] title:@"发短信" image:@"Sendimagenor" selectedImage:@"Sendimagesel"];
    [self setupChildVc:[MSRecommenViewController new] title:@"推荐好友" image:@"Recommenimagenor" selectedImage:@"Recommenimagesel"];
    [self setupChildVc:[MSMoreViewController new] title:@"更多" image:@"Moreimagenor" selectedImage:@"Moreimagesel"];
}
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)normalImage selectedImage:(NSString *)selectedImage{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:normalImage];
    // 声明：这张图片按照原始的样子显示出来，不要渲染成其他的颜色（比如说默认的蓝色）
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:[[MSNavigationController alloc] initWithRootViewController:vc]];
}
- (void)setupItem{
    //改变Tabbar字体大小和颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, FONTSIZE(15),NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MSBlueColor, NSForegroundColorAttributeName, FONTSIZE(15),NSFontAttributeName,nil] forState:UIControlStateSelected];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
