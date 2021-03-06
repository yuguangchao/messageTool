//
//  MSPrivacyAgreementViewController.m
//  messageTool
//
//  Created by yyy on 2018/5/23.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSPrivacyAgreementViewController.h"
#import "MSHeaderFile.h"
@interface MSPrivacyAgreementViewController ()
@property (strong, nonatomic) UITextView *textView;
@end

@implementation MSPrivacyAgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"隐私政策";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.textView];
    self.textView.text = [self agreementFromFile];
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [_textView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
#pragma mark - getter
- (UITextView *)textView
{
    if (!_textView) {
        _textView = ({
            UITextView *text = [[UITextView alloc] init];
            text.editable = NO;
            text.font = FONTSIZE(16);
            text;
        });
    }
    return _textView;
}
- (NSString *)agreementFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"PrivacyAgreement" ofType:@"txt"];
    return [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
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
