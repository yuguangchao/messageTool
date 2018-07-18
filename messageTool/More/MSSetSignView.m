//
//  MSSetSignView.m
//  messageTool
//
//  Created by yyy on 2018/5/6.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSSetSignView.h"
#import "MSHeaderFile.h"
@interface MSSetSignView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *textSigeView;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIButton *saveBtn;
@end
@implementation MSSetSignView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = MSBackGroundGreyColor;
        [self addSubview:self.titleLabel];
        [self addSubview:self.textSigeView];
        [self addSubview:self.tipLabel];
        [self addSubview:self.saveBtn];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).offset(SizeValueBase6Plus(10));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-10));
        make.bottom.mas_equalTo(self.textSigeView.mas_top).offset(SizeValueBase6Plus(-10));
    }];
    [_textSigeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(10));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-10));
        make.bottom.mas_equalTo(self.tipLabel.mas_top).offset(SizeValueBase6Plus(-10));
        make.height.mas_equalTo(SizeValueBase6Plus(160));
    }];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(10));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-10));
        make.bottom.mas_equalTo(self.saveBtn.mas_top).offset(SizeValueBase6Plus(-20));
    }];
    [_saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SizeValueBase6Plus(200));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"签名内容";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(20);
            lable.textColor = [UIColor darkGrayColor];
            lable;
        });
    }
    return _titleLabel;
}
- (UITextView *)textSigeView
{
    if (!_textSigeView) {
        _textSigeView = ({
            UITextView *textView = [[UITextView alloc] init];
            textView.font = FONTSIZE(17);;
            textView.textColor = [UIColor blackColor];
            textView.backgroundColor = [UIColor whiteColor];
            textView.textAlignment = NSTextAlignmentLeft;
            textView.layer.cornerRadius =SizeValueBase6Plus(6);
            textView.text = [[NSUserDefaults standardUserDefaults] objectForKey:MSSignNOComminute];
            textView;
        });
    }
    return _textSigeView;
}
- (UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"短信中必须使用签名，签名内容放置在【】中，可设置最多5个签名内容，一行一个";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(20);
            lable.numberOfLines = 0;
            lable.textColor = [UIColor darkGrayColor];
            lable;
        });
    }
    return _tipLabel;
}
- (UIButton *)saveBtn
{
    if (!_saveBtn) {
        _saveBtn = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = MSBlueColor;
            button.layer.cornerRadius = SizeValueBase6Plus(8);
            [button setTitle:@"保存" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(22);
            [button addTarget:self action:@selector(saveClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _saveBtn;
}
- (void)saveClick:(UIButton *)btn
{
    NSArray *signArr = [self.textSigeView.text componentsSeparatedByString:@"\n"];
    if ([self.textSigeView.text isEqualToString:@""]) {
        [HUD showInfo:@"您还未输入任何内容" onView:self];
        return;
    }
    if (signArr.count>5) {
        [HUD showInfo:@"最多可设置5个签名" onView:self];
        return;
    }
    for (NSString *str in signArr) {
        NSString *first = [str substringToIndex:1];//字符串开始
        NSString *last = [str substringFromIndex:str.length-1];//字符串结尾
        if (![first isEqualToString:@"【"]||![last isEqualToString:@"】"]||str.length<=2) {
            [HUD showInfo:@"签名格式错误" onView:self];
            return;
        }
    }
    //本地存储用于显示在输入框内
    [[NSUserDefaults standardUserDefaults] setObject:self.textSigeView.text forKey:MSSignNOComminute];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //本地存储用于显示在选择签名处
    [[NSUserDefaults standardUserDefaults] setObject:signArr forKey:MSSign];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (self.saveSign) {
        self.saveSign();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
