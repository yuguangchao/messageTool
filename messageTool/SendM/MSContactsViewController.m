//
//  MSContactsViewController.m
//  messageTool
//
//  Created by yyy on 2018/5/10.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSContactsViewController.h"
#import "MSContactsView.h"
#import "MSMAddanualViewController.h"
#import "MSHeaderFile.h"
#import "MSAddressBookModel.h"
#import "PPGetAddressBook.h"
#import "PinYin4Objc.h"
@interface MSContactsViewController ()
@property (nonatomic, strong) MSContactsView *conView;
@property (nonatomic, strong) UIButton *rightBtn;
@end

@implementation MSContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加联系人";
    self.view = self.conView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    NSMutableArray *listArr = [NSMutableArray array];
    [HUD showCustomHudWithStatus:@"正在获取" onView:APPWindow];
    [PPGetAddressBook getOrderAddressBook:^(NSDictionary<NSString *,NSArray *> *addressBookDict, NSArray *nameKeys) {
        //装着所有联系人的字典
        [HUD dismiss];
        [HUD showInfo:@"获取成功" onView:self.view];
        for (NSString *namekey in nameKeys) {
            for (PPPersonModel *peopel in addressBookDict[namekey]) {
                for (NSString *phone in peopel.mobileArray) {
                    MSAddressBookModel *model = [[MSAddressBookModel alloc] init];
                    model.nameModel = peopel.name;
                    model.phoneModel = phone;
                    [listArr addObject:model];
                }
            }
        }
        HanyuPinyinOutputFormat *outputFormat=[[HanyuPinyinOutputFormat alloc] init];
        [outputFormat setToneType:ToneTypeWithoutTone];
        [outputFormat setVCharType:VCharTypeWithV];
        [outputFormat setCaseType:CaseTypeUppercase];
        [listArr enumerateObjectsUsingBlock:^(MSAddressBookModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *pinyin = [[PinyinHelper toHanyuPinyinStringWithNSString:obj.nameModel withHanyuPinyinOutputFormat:outputFormat withNSString:@""] uppercaseString];
            obj.pinyinName = pinyin;
        }];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"pinyinName" ascending:YES];
        NSArray *array = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [listArr sortUsingDescriptors:array];
        self.conView.addBookList = listArr;
    } authorizationFailure:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请在iPhone的“设置-隐私-通讯录”选项中，允许APP访问您的通讯录"
                                                       delegate:nil
                                              cancelButtonTitle:@"知道了"
                                              otherButtonTitles:nil];
        [alert show];
    }];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (MSContactsView *)conView
{
    if (!_conView) {
        _conView = ({
            MSContactsView *view = [[MSContactsView alloc] initWithFrame:self.view.bounds];
            __weak typeof(self) weakself=self;
            view.confrimBlock = ^{
                [weakself.navigationController popViewControllerAnimated:YES];
            };
            view;
        });
    }
    return _conView;
}
- (UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = ({
            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [backButton setTitle:@"手动添加" forState:UIControlStateNormal];
            backButton.titleLabel.font = FONTSIZE(20);
            [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [backButton sizeToFit];
            backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            [backButton addTarget:self action:@selector(shoudongAdd) forControlEvents:UIControlEventTouchUpInside];
            backButton;
        });
    }
    return _rightBtn;
}
- (void)shoudongAdd
{
    [self.navigationController pushViewController:[MSMAddanualViewController new] animated:YES];
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
