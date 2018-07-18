//
//  MSManualAddView.m
//  messageTool
//
//  Created by yyy on 2018/5/10.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSManualAddView.h"
#import "MSHeaderFile.h"
#import "NSString+RegexCategory.h"
@interface MSManualAddView ()<UITextViewDelegate>
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIButton *confimBtn;
@property (nonatomic, strong) UILabel *placeholderL;
@end
@implementation MSManualAddView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = MSBackGroundGreyColor;
        [self addSubview:self.textView];
        [self addSubview:self.placeholderL];
        [self addSubview:self.tipLabel];
        [self addSubview:self.confimBtn];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(SizeValueBase6Plus(10));
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(10));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-10));
        make.bottom.mas_equalTo(self.tipLabel.mas_top).offset(SizeValueBase6Plus(-10));
        make.height.mas_equalTo(SizeValueBase6Plus(200));
    }];
    [_placeholderL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(SizeValueBase6Plus(20));
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(15));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-15));
    }];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(10));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-10));
        make.bottom.mas_equalTo(self.confimBtn.mas_top).offset(SizeValueBase6Plus(-20));
    }];
    [_confimBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SizeValueBase6Plus(200));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
}
- (UITextView *)textView
{
    if (!_textView) {
        _textView = ({
            UITextView *textView = [[UITextView alloc] init];
            textView.font = FONTSIZE(17);;
            textView.textColor = [UIColor blackColor];
            textView.backgroundColor = [UIColor whiteColor];
            textView.textAlignment = NSTextAlignmentLeft;
            textView.layer.cornerRadius =SizeValueBase6Plus(6);
            textView.delegate = self;
            textView.text = [[NSUserDefaults standardUserDefaults] objectForKey:MSShouDongAddPhone];
            if (![textView.text isEqualToString:@""]) {
                self.placeholderL.hidden = YES;
            }
            textView;
        });
    }
    return _textView;
}
- (UILabel *)placeholderL
{
    if (!_placeholderL) {
        _placeholderL = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"手动输入号码一行一个";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor lightGrayColor];
            lable;
        });
    }
    return _placeholderL;
}
- (UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"注：建议号码直接保存至手机通讯录再群发，可以防止以后重复输入";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(20);
            lable.numberOfLines = 0;
            lable.textColor = [UIColor redColor];
            lable;
        });
    }
    return _tipLabel;
}
- (UIButton *)confimBtn
{
    if (!_confimBtn) {
        _confimBtn = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = MSBlueColor;
            button.layer.cornerRadius = SizeValueBase6Plus(8);
            [button setTitle:@"确定" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(22);
            [button addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _confimBtn;
}
/**
 将要开始编辑
 @param textView textView
 @return BOOL
 */
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.placeholderL.hidden = YES;
    return YES;
}
- (void)saveClick
{
    if ([self.textView.text isEqualToString:@""]) {
        [[NSUserDefaults standardUserDefaults] setObject:self.textView.text forKey:MSShouDongAddPhone];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [HUD showInfo:@"没有添加任何手机号" onView:APPWindow];
        if (self.saveBlock) {
            self.saveBlock();
        }
        return;
    }
    NSMutableString *muStr = [NSMutableString string];
    NSMutableArray *phoneArr = [NSMutableArray array];
    NSArray *signArr = [self.textView.text componentsSeparatedByString:@"\n"];
    for (NSString *str in signArr) {
        if ([str containsString:@","]) {
            NSArray *temarr = [str componentsSeparatedByString:@","];
            for (NSString *temStr in temarr) {
                [phoneArr addObject:temStr];
            }
        }else{
            [phoneArr addObject:str];
        }
    }
    for (NSString *str in phoneArr) {
            //手机号校验
            if (![str isMobileNumber]) {
                [HUD showInfo:@"手机号格式不正确" onView:self];
                return;
            }else{
                [muStr appendFormat:@"%@,",str];
            }
    }
    //去掉最后一个逗号
    [[NSUserDefaults standardUserDefaults] setObject:[muStr substringToIndex:muStr.length - 1] forKey:MSShouDongAddPhone];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [HUD showInfo:@"手动添加成功" onView:APPWindow];
    if (self.saveBlock) {
        self.saveBlock();
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
