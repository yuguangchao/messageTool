//
//  MSLoginView.m
//  messageTool
//
//  Created by yyy on 2018/5/4.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSLoginView.h"
#import "MSHeaderFile.h"
#import "MSLoginSubView.h"
#import "TTTAttributedLabel.h"
@interface MSLoginView () <TTTAttributedLabelDelegate>
@property (strong, nonatomic) UILabel *tipLabel;
@property (strong, nonatomic) MSLoginSubView *containerView;
@property (strong, nonatomic) TTTAttributedLabel *phoneLabel;
@property (strong, nonatomic) UIButton *registerBtn;
@property (strong, nonatomic) UILabel *adverLabel;
@end
@implementation MSLoginView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = MSBlueColor;
        [self addSubview:self.tipLabel];
        [self addSubview:self.containerView];
        [self addSubview:self.registerBtn];
        [self addSubview:self.adverLabel];
        [self addSubview:self.phoneLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.containerView.mas_top).offset(SizeValueBase6Plus(-40));
    }];
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).offset(SizeValueBase6Plus(-60));
        make.height.mas_equalTo(SizeValueBase6Plus(320));
        make.width.mas_equalTo(SizeValueBase6Plus(320));
    }];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.containerView.mas_bottom).offset(SizeValueBase6Plus(10));
        make.right.mas_equalTo(self.containerView.mas_right);
        make.width.mas_equalTo(SizeValueBase6Plus(80));
        make.height.mas_equalTo(SizeValueBase6Plus(30));
    }];
    [_adverLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self.phoneLabel.mas_top).offset(SizeValueBase6Plus(-40));
        make.left.right.mas_equalTo(self);
    }];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self).offset(SizeValueBase6Plus(-20));
    }];
}
- (UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font = FONTSIZE(20);
            lable.textColor = [UIColor whiteColor];
            lable.text = @"短信云助手";
            lable;
        });
    }
    return _tipLabel;
}
- (MSLoginSubView *)containerView
{
    if (!_containerView) {
        _containerView = ({
            MSLoginSubView *view = [[MSLoginSubView alloc] init];
            view.layer.cornerRadius = SizeValueBase6Plus(8);
            __weak typeof(self) weakself=self;
            view.loginBlock = ^(NSString *account, NSString *password) {
                if (weakself.loginViewBlock) {
                    weakself.loginViewBlock(account, password);
                }
            };
            view.AgreemenBlock = ^{
                if (weakself.learnAgreementBlock) {
                    weakself.learnAgreementBlock();
                }
            };
            view;
        });
    }
    return _containerView;
}
- (UIButton *)registerBtn
{
    if (!_registerBtn) {
        _registerBtn = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor clearColor];
            [button setTitle:@"立即注册" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(16);
            [button addTarget:self action:@selector(regisetClick) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _registerBtn;
}
- (UILabel *)adverLabel
{
    if (!_adverLabel) {
        _adverLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font = FONTSIZE(20);
            lable.textColor = [UIColor whiteColor];
            lable.text = @"打造品牌 赢在未来";
            lable;
        });
    }
    return _adverLabel;
}
- (TTTAttributedLabel *)phoneLabel
{
    if (!_phoneLabel) {
        _phoneLabel = ({
            TTTAttributedLabel *detailL = [[TTTAttributedLabel alloc] initWithFrame:CGRectNull];
            detailL.textAlignment = NSTextAlignmentCenter;
            detailL.font = FONTSIZE(16);
            detailL.textColor = [UIColor whiteColor];
            detailL.delegate = self;
            detailL.enabledTextCheckingTypes = NSTextCheckingTypePhoneNumber;
            detailL.text = @"7*24小时客服电话：15822330727 王经理（同微信）";
            detailL;
        });
    }
    return _phoneLabel;
}
- (void)regisetClick
{
    if (self.registerBlock) {
        self.registerBlock();
    }
}
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithPhoneNumber:(NSString *)phoneNumber
{
    if (SYSTEM_VERSION >= 10.0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phoneNumber]] options:@{} completionHandler:nil];
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phoneNumber]]];
    }
    
}
@end
