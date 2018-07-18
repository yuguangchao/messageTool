//
//  MSResivePassView.m
//  messageTool
//
//  Created by yyy on 2018/5/6.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSResivePassView.h"
#import "MSHeaderFile.h"
@interface MSResivePassView ()
@property (nonatomic, strong) UILabel *oldpassLabel;
@property (nonatomic, strong) UILabel *newpassLabel;
@property (nonatomic, strong) UILabel *confirmpassLabel;
@property (nonatomic, strong) UITextField *oldpassField;
@property (nonatomic, strong) UITextField *newpassField;
@property (nonatomic, strong) UITextField *confirmpassField;
@property (nonatomic, strong) UIButton *confirmBtn;
@end
@implementation MSResivePassView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.oldpassLabel];
        [self addSubview:self.oldpassField];
        [self addSubview:self.newpassLabel];
        [self addSubview:self.newpassField];
        [self addSubview:self.confirmpassLabel];
        [self addSubview:self.confirmpassField];
        [self addSubview:self.confirmBtn];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_oldpassLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self).offset(SizeValueBase6Plus(20));
        make.right.mas_equalTo(self.oldpassField.mas_left).offset(SizeValueBase6Plus(-10));
        make.bottom.mas_equalTo(self.newpassLabel.mas_top).offset(SizeValueBase6Plus(-20));
        make.width.mas_equalTo(SizeValueBase6Plus(70));
    }];
    [_oldpassField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.oldpassLabel);
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-20));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_newpassLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.oldpassLabel);
        make.right.mas_equalTo(self.newpassField.mas_left).offset(SizeValueBase6Plus(-10));
        make.bottom.mas_equalTo(self.confirmpassLabel.mas_top).offset(SizeValueBase6Plus(-20));
        make.width.mas_equalTo(SizeValueBase6Plus(70));
     }];
    [_newpassField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.newpassLabel);
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-20));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_confirmpassLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.oldpassLabel);
        make.right.mas_equalTo(self.confirmpassField.mas_left).offset(SizeValueBase6Plus(-10));
        make.width.mas_equalTo(SizeValueBase6Plus(70));
    }];
    [_confirmpassField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.confirmpassLabel);
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-20));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self).offset(SizeValueBase6Plus(-100));
        make.width.mas_equalTo(SizeValueBase6Plus(200));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
}
- (UILabel *)oldpassLabel
{
    if (!_oldpassLabel) {
        _oldpassLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"原密码";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor darkGrayColor];
            lable;
        });
    }
    return _oldpassLabel;
}
- (UITextField *)oldpassField
{
    if (!_oldpassField) {
        _oldpassField = ({
            UITextField *field = [[UITextField alloc] init];
            field.borderStyle = UITextBorderStyleNone;
            field.backgroundColor = [UIColor whiteColor];
            field.placeholder = @"请输入原密码";
            field.clearButtonMode = UITextFieldViewModeWhileEditing;
            field;
        });
    }
    return _oldpassField;
}
- (UILabel *)newpassLabel
{
    if (!_newpassLabel) {
        _newpassLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"新密码";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor darkGrayColor];
            lable;
        });
    }
    return _newpassLabel;
}
- (UITextField *)newpassField
{
    if (!_newpassField) {
        _newpassField = ({
            UITextField *field = [[UITextField alloc] init];
            field.borderStyle = UITextBorderStyleNone;
            field.backgroundColor = [UIColor whiteColor];
            field.placeholder = @"请输入新密码";
            field.clearButtonMode = UITextFieldViewModeWhileEditing;
            field;
        });
    }
    return _newpassField;
}
- (UILabel *)confirmpassLabel
{
    if (!_confirmpassLabel) {
        _confirmpassLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"确认密码";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor darkGrayColor];
            lable;
        });
    }
    return _confirmpassLabel;
}
- (UITextField *)confirmpassField
{
    if (!_confirmpassField) {
        _confirmpassField = ({
            UITextField *field = [[UITextField alloc] init];
            field.borderStyle = UITextBorderStyleNone;
            field.backgroundColor = [UIColor whiteColor];
            field.placeholder = @"请再次输入新密码";
            field.clearButtonMode = UITextFieldViewModeWhileEditing;
            field;
        });
    }
    return _confirmpassField;
}
- (UIButton *)confirmBtn
{
    if (!_confirmBtn) {
        _confirmBtn = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = MSBlueColor;
            button.layer.cornerRadius = SizeValueBase6Plus(8);
            [button setTitle:@"确认" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(22);
            [button addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _confirmBtn;
}
- (void)confirmClick:(UIButton *)btn
{
    if (![self.oldpassField.text isEqualToString:@""]) {
        if (![self.newpassField.text isEqualToString:@""]) {
            if (![self.confirmpassField.text isEqualToString:@""]) {
                if ([self.newpassField.text isEqualToString:self.confirmpassField.text]) {
                    if (self.modifyPwdBlock) {
                        self.modifyPwdBlock(self.oldpassField.text, self.newpassField.text, self.confirmpassField.text);
                    }
                }else{
                    [HUD showInfo:@"新密码两次输入不一致" onView:LastWindow];
                }
            }else{
                [HUD showInfo:@"请再次输入新密码" onView:LastWindow];
            }
        }else{
            [HUD showInfo:@"请输入新密码" onView:LastWindow];
        }
    }else{
        [HUD showInfo:@"请输入原密码" onView:LastWindow];
    }
}
@end
