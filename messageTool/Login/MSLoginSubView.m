//
//  MSLoginSubView.m
//  messageTool
//
//  Created by yyy on 2018/5/4.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSLoginSubView.h"
#import "MSHeaderFile.h"
#import "MQVerCodeImageView.h"
@interface MSLoginSubView ()
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *passWordLabel;
@property (nonatomic, strong) UILabel *businessIdLabel;
@property (nonatomic, strong) UITextField *userNameField;
@property (nonatomic, strong) UITextField *passWordField;
@property (nonatomic, strong) UITextField *businessIdField;
@property (nonatomic, strong) MQVerCodeImageView *yanzhengImage;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *AgreementSelectBtn;
@property (nonatomic, strong) UIButton *AgreementBtn;
@property (nonatomic, strong) NSString *varCodeStr;
@end
@implementation MSLoginSubView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = MSGreyColor;
        [self addSubview:self.userNameLabel];
        [self addSubview:self.businessIdLabel];
        [self addSubview:self.passWordLabel];
        [self addSubview:self.userNameField];
        [self addSubview:self.passWordField];
        [self addSubview:self.businessIdField];
        [self addSubview:self.yanzhengImage];
        [self addSubview:self.loginBtn];
        [self addSubview:self.AgreementSelectBtn];
        [self addSubview:self.AgreementBtn];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.userNameField.mas_centerY);
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(5));
        make.width.mas_equalTo(SizeValueBase6Plus(60));
    }];
    [_userNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(SizeValueBase6Plus(15));
        make.left.mas_equalTo(self.userNameLabel.mas_right).offset(SizeValueBase6Plus(5));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-5));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_passWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.passWordField.mas_centerY);
        make.left.mas_equalTo(self.userNameLabel);
        make.width.mas_equalTo(SizeValueBase6Plus(60));
    }];
    [_passWordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userNameField.mas_bottom).offset(SizeValueBase6Plus(15));
        make.left.mas_equalTo(self.passWordLabel.mas_right).offset(SizeValueBase6Plus(5));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-5));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_businessIdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.businessIdField.mas_centerY);
        make.left.mas_equalTo(self.userNameLabel);
        make.width.mas_equalTo(SizeValueBase6Plus(60));
    }];
    [_businessIdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passWordField.mas_bottom).offset(SizeValueBase6Plus(15));
        make.left.mas_equalTo(self.businessIdLabel.mas_right).offset(SizeValueBase6Plus(5));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-90));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(30));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-30));
        make.top.mas_equalTo(self.businessIdField.mas_bottom).offset(SizeValueBase6Plus(30));
        make.height.mas_equalTo(SizeValueBase6Plus(50));
    }];
    [_AgreementSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.loginBtn.mas_left).offset(SizeValueBase6Plus(15));
        make.right.mas_equalTo(self.AgreementBtn.mas_left).offset(SizeValueBase6Plus(-10));
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(SizeValueBase6Plus(20));
        make.width.height.mas_equalTo(SizeValueBase6Plus(20));
    }];
    [_AgreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.AgreementSelectBtn.mas_centerY);
        make.width.mas_equalTo(SizeValueBase6Plus(200));
        make.height.mas_equalTo(SizeValueBase6Plus(30));
    }];
}
- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor darkGrayColor];
            lable.text = @"用户名";
            lable;
        });
    }
    return _userNameLabel;
}
- (UITextField *)userNameField
{
    if (!_userNameField) {
        _userNameField = ({
            UITextField *field = [[UITextField alloc] init];
            field.borderStyle = UITextBorderStyleRoundedRect;
            field.backgroundColor = [UIColor whiteColor];
            field.placeholder = @"请输入用户名";
            field.clearButtonMode = UITextFieldViewModeWhileEditing;
            field;
        });
    }
    return _userNameField;
}
- (UILabel *)passWordLabel
{
    if (!_passWordLabel) {
        _passWordLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor darkGrayColor];
            lable.text = @"密码";
            lable;
        });
    }
    return _passWordLabel;
}
- (UITextField *)passWordField
{
    if (!_passWordField) {
        _passWordField = ({
            UITextField *field = [[UITextField alloc] init];
            field.borderStyle = UITextBorderStyleRoundedRect;
            field.backgroundColor = [UIColor whiteColor];
            field.placeholder = @"请输入密码";
            field.clearButtonMode = UITextFieldViewModeWhileEditing;
            field;
        });
    }
    return _passWordField;
}
- (UILabel *)businessIdLabel
{
    if (!_businessIdLabel) {
        _businessIdLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor darkGrayColor];
            lable.text = @"验证码";
            lable;
        });
    }
    return _businessIdLabel;
}
- (UITextField *)businessIdField
{
    if (!_businessIdField) {
        _businessIdField = ({
            UITextField *field = [[UITextField alloc] init];
            field.borderStyle = UITextBorderStyleRoundedRect;
            field.backgroundColor = [UIColor whiteColor];
            field.placeholder = @"请输入验证码";
            field.clearButtonMode = UITextFieldViewModeWhileEditing;
            field;
        });
    }
    return _businessIdField;
}
- (MQVerCodeImageView *)yanzhengImage
{
    if (!_yanzhengImage) {
        _yanzhengImage = ({
            MQVerCodeImageView *view = [[MQVerCodeImageView alloc] initWithFrame:CGRectMake(SizeValueBase6Plus(235), SizeValueBase6Plus(125), SizeValueBase6Plus(80), SizeValueBase6Plus(40))];
            view.bolck = ^(NSString *imageCodeStr){
                self.varCodeStr = imageCodeStr;
            };
            view.isRotation = NO;
            [view freshVerCode];
            //点击刷新
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
            [view addGestureRecognizer:tap];
            view;
        });
    }
    return _yanzhengImage;
}
- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = MSBlueColor;
            button.layer.cornerRadius = SizeValueBase6Plus(8);
            [button setTitle:@"登录系统" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(20);
            [button addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _loginBtn;
}
- (UIButton *)AgreementSelectBtn
{
    if (!_AgreementSelectBtn) {
        _AgreementSelectBtn = ({
            UIButton *button = [[UIButton alloc] init];
            [button setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
            [button addTarget:self action:@selector(tipClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _AgreementSelectBtn;
}
- (UIButton *)AgreementBtn
{
    if (!_AgreementBtn) {
        _AgreementBtn = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor clearColor];
            [button setTitle:@"《软件许可及服务协议》" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(17);
            [button addTarget:self action:@selector(AgreeClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _AgreementBtn;
}
- (void)tipClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [btn setImage:[UIImage imageNamed:@"Agreemenselect"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"Agreemenselect"] forState:UIControlStateHighlighted];
    }
    else {
        [btn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
    }
}
- (void)AgreeClick:(UIButton *)btn
{
    if (self.AgreemenBlock) {
        self.AgreemenBlock();
    }
}
-(void)loginClick:(UIButton *)btn
{
    if (![self.userNameField.text isEqualToString:@""]) {
        if (![self.passWordField.text isEqualToString:@""]) {
            if (![self.businessIdField.text isEqualToString:@""]&&[self.businessIdField.text.lowercaseString isEqualToString:self.varCodeStr.lowercaseString]) {
                if (self.AgreementSelectBtn.selected) {
                    if (self.loginBlock) {
                        self.loginBlock(self.userNameField.text, self.passWordField.text);
                    }
                }else{
                    [HUD showInfo:@"请阅读并勾选软件许可及服务协议" onView:LastWindow];
                }
            }else{
                [HUD showInfo:@"请输入正确的验证码" onView:LastWindow];
            }
        }else{
            [HUD showInfo:@"请输入密码" onView:LastWindow];
        }
    }else{
        [HUD showInfo:@"请输入用户名" onView:LastWindow];
    }
}
- (void)tapClick:(UITapGestureRecognizer*)tap
{
    [_yanzhengImage freshVerCode];
}
@end
