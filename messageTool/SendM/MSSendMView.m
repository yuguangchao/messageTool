//
//  MSSendMView.m
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSSendMView.h"
#import "MSHeaderFile.h"
#import "UIView+Frame.h"
#import "THDatePickerView.h"
#import "NSString+RegexCategory.h"
#import "NSString+UrlEncode.h"
@interface MSSendMView ()<THDatePickerViewDelegate,UITextViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UITextView *messageView;
@property (nonatomic, strong) UILabel *placeholderL;
@property (nonatomic, strong) UILabel *seleSign;
@property (nonatomic, strong) UILabel *inputLabel;
@property (nonatomic, strong) UILabel *carefulLabel;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIButton* leftBtn;
@property (nonatomic, strong) UIButton* rightBtn;
@property (nonatomic, strong) THDatePickerView *dateView;
@property (nonatomic, copy) NSString *sendTime;
@end
@implementation MSSendMView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = MSBackGroundGreyColor;
        [self addSubview:self.currentAddressNumber];
        [self addSubview:self.addressLabel];
        [self addSubview:self.addressField];
        [self addSubview:self.addButton];
        [self addSubview:self.messageView];
        [self addSubview:self.placeholderL];
        [self addSubview:self.seleSign];
        [self addSubview:self.inputLabel];
        [self addSubview:self.carefulLabel];
        [self addSubview:self.tipLabel];
        [self addSubview:self.leftBtn];
        [self addSubview:self.rightBtn];
        [self addSubview:self.dropView];
        [self addSubview:self.dateView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_currentAddressNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(SizeValueBase6Plus(10));
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.addressField.mas_top).offset(SizeValueBase6Plus(-10));
    }];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(20));
        make.right.mas_equalTo(self.addressField.mas_left).offset(SizeValueBase6Plus(-10));
        make.centerY.mas_equalTo(self.addressField);
        make.width.mas_equalTo(SizeValueBase6Plus(70));
    }];
    [_addressField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.addButton.mas_left).offset(SizeValueBase6Plus(-10));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-20));
        make.centerY.mas_equalTo(self.addressField);
        make.width.height.mas_equalTo(SizeValueBase6Plus(30));
    }];
    [_messageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(20));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-20));
        make.top.mas_equalTo(self.addressField.mas_bottom).offset(SizeValueBase6Plus(10));
        make.height.mas_equalTo(SizeValueBase6Plus(180));
    }];
    [_placeholderL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addressField.mas_bottom).offset(SizeValueBase6Plus(20));
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(25));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-25));
    }];
    [_seleSign mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(20));
        make.top.mas_equalTo(self.messageView.mas_bottom).offset(SizeValueBase6Plus(10));
        make.width.mas_equalTo(SizeValueBase6Plus(100));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_dropView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.messageView.mas_bottom).offset(SizeValueBase6Plus(10));
        make.left.mas_equalTo(self.seleSign.mas_right);
        make.height.mas_equalTo(SizeValueBase6Plus(40)+SizeValueBase6Plus(30)*5);
        make.width.mas_equalTo(SizeValueBase6Plus(280));
    }];
    [_inputLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(20));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-20));
        make.top.mas_equalTo(self.seleSign.mas_bottom).offset(SizeValueBase6Plus(10));
    }];
    [_carefulLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(20));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-20));
        make.top.mas_equalTo(self.inputLabel.mas_bottom).offset(SizeValueBase6Plus(10));
    }];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(20));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-20));
        make.top.mas_equalTo(self.carefulLabel.mas_bottom).offset(SizeValueBase6Plus(10));
    }];
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self).offset(-HR_TabbarHeight-1);
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_centerX);
        make.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self).offset(-HR_TabbarHeight-1);
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
}
- (void)setSignArray:(NSArray *)signArray
{
    _signArray = signArray;
    self.dropView.tableArray = signArray;
    NSInteger number = [_messageView.text length];
    NSInteger signnumber;
    NSInteger messageCount = 1;
    if ([self.dropView.selectLabel.text isEqualToString:@"无签名"]) {
        signnumber = 0;
    }else{
        signnumber =self.dropView.selectLabel.text.length;
        
    }
    if (4+number+signnumber<=70) {
        messageCount = 1;
    }else{
        NSInteger tmeCount = (4+number+signnumber)/67;
        if ((4+number+signnumber)%67 == 0) {
            messageCount = tmeCount;
        }else{
            messageCount = tmeCount+1;
        }
    }
    self.inputLabel.text = [NSString stringWithFormat:@"包含签名，退订回T已输入%ld个字，还剩%ld字，最多300个字，手机计费条数:%ld条。",4+number+signnumber,300-4-number-signnumber,messageCount];
    NSArray *numbers = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:self.inputLabel.text];
    for (int i = 0; i < self.inputLabel.text.length; i ++) {
        NSString *a = [self.inputLabel.text substringWithRange:NSMakeRange(i, 1)];
        if ([numbers containsObject:a]) {
            [attributeString setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:FONTSIZE(17)} range:NSMakeRange(i, 1)];
        }
    }
    self.inputLabel.attributedText = attributeString;
}
- (void)setPhoneArrays:(NSMutableArray *)phoneArrays
{
    _phoneArrays = phoneArrays;
    if (phoneArrays.count == 0) {
        self.currentAddressNumber.text = @"当前收件号码共0个";
        self.addressField.text = @"";
    }else{
        self.currentAddressNumber.text = [NSString stringWithFormat:@"当前收件号码共%lu个",(long)phoneArrays.count];
        self.addressField.text = [self getPhoneNumberWith:phoneArrays];
    }
}
- (NSString *)getPhoneNumberWith:(NSMutableArray *)phoneArr
{
    NSMutableString *muStr = [NSMutableString string];
    for (NSString *str in phoneArr) {
        [muStr appendFormat:@"%@,",str];
    }
    return [muStr substringToIndex:muStr.length-1];
}
- (THDatePickerView *)dateView
{
    if (!_dateView) {
        _dateView = ({
            THDatePickerView *dateView = [[THDatePickerView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT-HR_TabbarHeight, SCREENWIDTH, 300)];
            dateView.delegate = self;
            dateView.title = @"选择发送时间";
            dateView.minuteInterval = 1;
            dateView;
        });
    }
    return _dateView;
}
- (UILabel *)currentAddressNumber
{
    if (!_currentAddressNumber) {
        _currentAddressNumber = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"当前收件号码共0个";
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font = FONTSIZE(20);
            lable.textColor = MSBlueColor;
            lable;
        });
    }
    return _currentAddressNumber;
}
- (UILabel *)addressLabel
{
    if (!_addressLabel) {
        _addressLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"联系人：";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor grayColor];
            lable;
        });
    }
    return _addressLabel;
}
- (UITextField *)addressField
{
    if (!_addressField) {
        _addressField = ({
            UITextField *field = [[UITextField alloc] init];
            field.borderStyle = UITextBorderStyleRoundedRect;
            field.backgroundColor = [UIColor whiteColor];
            field.clearButtonMode = UITextFieldViewModeWhileEditing;
            field.delegate = self;
            //field.userInteractionEnabled = NO;
            [field addTarget:self action:@selector(passConTextChange:) forControlEvents:UIControlEventEditingChanged];
            field;
        });
    }
    return _addressField;
}
- (UIButton *)addButton
{
    if (!_addButton) {
        _addButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:@"addlianxiren"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(addAddressClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _addButton;
}
- (UITextView *)messageView
{
    if (!_messageView) {
        _messageView = ({
            UITextView *textView = [[UITextView alloc] init];
            textView.font = FONTSIZE(17);;
            textView.textColor = [UIColor blackColor];
            textView.backgroundColor = [UIColor whiteColor];
            textView.textAlignment = NSTextAlignmentLeft;
            textView.layer.cornerRadius =SizeValueBase6Plus(6);
            textView.delegate = self;
            textView;
        });
    }
    return _messageView;
}
- (UILabel *)placeholderL
{
    if (!_placeholderL) {
        _placeholderL = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"短信内容";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor lightGrayColor];
            lable;
        });
    }
    return _placeholderL;
}
- (UILabel *)seleSign
{
    if (!_seleSign) {
        _seleSign = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"签名选择：";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(18);
            lable.textColor = [UIColor grayColor];
            lable;
        });
    }
    return _seleSign;
}
- (MSDropDownView *)dropView
{
    if (!_dropView) {
        _dropView = ({
            MSDropDownView *dd1 = [[MSDropDownView alloc] init];
            __weak typeof(self) weakself=self;
            dd1.selectSignBlock = ^(NSString *selectStr) {
                //计算切换签名后的字符数
                [weakself changeSignCount:selectStr];
            };
            //dd1.tableArray = [[NSUserDefaults standardUserDefaults] objectForKey:MSSign];
            dd1;
        });
    }
    return _dropView;
}
- (UILabel *)inputLabel
{
    if (!_inputLabel) {
        _inputLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.textColor = [UIColor grayColor];
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(17);
            lable.numberOfLines = 0;
            lable.text = @"包含签名，退订回T已输入4个字，还剩296字，最多300个字，手机计费条数:1条。";
            NSArray *number = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
            NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:lable.text];
            for (int i = 0; i < lable.text.length; i ++) {
                NSString *a = [lable.text substringWithRange:NSMakeRange(i, 1)];
                if ([number containsObject:a]) {
                    [attributeString setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:FONTSIZE(17)} range:NSMakeRange(i, 1)];
                }
            }
            lable.attributedText = attributeString;
            lable;
        });
    }
    return _inputLabel;
}
- (UILabel *)carefulLabel
{
    if (!_carefulLabel) {
        _carefulLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"注意：短信发送格式为：【公司名称】+短信内容+退订回T。";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor redColor];
            lable.numberOfLines = 0;
            lable;
        });
    }
    return _carefulLabel;
}
- (UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.text = @"尊敬的用户，本APP只能发送正规的行业短信、通知短信、祝福短信等。发送违反国家法律法规的短信，将直接封号，余额不予退还。有任何问题请联系工作人员。\n王经理15822330727（同微信）";
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor grayColor];
            lable.numberOfLines = 0;
            lable;
        });
    }
    return _tipLabel;
}
- (UIButton *)leftBtn
{
    if (!_leftBtn) {
        _leftBtn = ({
            UIButton *button = [[UIButton alloc] init];
            button.backgroundColor = [UIColor whiteColor];
            [button setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
            [button setTitle:@"定时发送" forState:UIControlStateNormal];
            [button setTitleColor:MSBlueColor forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(18);
            [button addTarget:self action:@selector(tipClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _leftBtn;
}
-(UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = MSBlueColor;
            button.layer.cornerRadius = SizeValueBase6Plus(4);
            [button setTitle:@"提交" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(18);
            [button addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _rightBtn;
}
- (void)addAddressClick:(UIButton *)btn
{
    if (self.addAddressBlock) {
        self.addAddressBlock();
    }
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
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, SCREENHEIGHT - 300-HR_TabbarHeight, SCREENWIDTH, 300);
        [self.dateView show];
    }];
}
- (void)submitClick:(UIButton *)btn
{
    //拼接发送信息
    NSString *signtStr;
    if ([self.dropView.selectLabel.text isEqualToString:@"无签名"]) {
        signtStr=@"";
    }else{
        signtStr = self.dropView.selectLabel.text;
    }
    NSString *contentStr = [NSString stringWithFormat:@"%@%@退订回T",signtStr,self.messageView.text];
    NSDictionary *remanentDict = [[NSUserDefaults standardUserDefaults] objectForKey:MSUserInfo];
    NSDictionary *param = @{@"userid":remanentDict[@"userid"],
                            @"account":remanentDict[@"account"],
                            @"password":remanentDict[@"password"],
                            @"content":contentStr
                            };
    if (self.phoneArrays.count == 0) {
        [HUD showInfo:@"您还未输入手机号" onView:self];
        return;
    }
    if ([self.messageView.text isEqualToString:@""]) {
        [HUD showInfo:@"您还未输入短信内容" onView:self];
        return;
    }
    //检测短信内容
    if ([self.messageView.text containsString:@"【"]||[self.messageView.text containsString:@"】"]) {
        [HUD showInfo:@"短信内容不能带【】" onView:self];
        return;
    }
    NSDictionary *sendParam = @{@"userid":remanentDict[@"userid"],
                                @"account":remanentDict[@"account"],
                                @"password":remanentDict[@"password"],
                                @"content":contentStr,
                                @"mobile":[self getPhoneNumberWith:self.phoneArrays],
                                @"stime":self.sendTime?self.sendTime:@""
                                };
    [HUD showCustomHudWithStatus:@"正在发送" onView:APPWindow];
    [MSNetWorkManager checkSensitive:param success:^(MSServerResultBase *result) {
        //没有敏感词再发送
        [MSNetWorkManager sendMessage:sendParam success:^(MSServerResultBase *result) {
            //发送成功
            if (self.sendMessageSuccess) {
                self.sendMessageSuccess(result.retInfo);
            }
            [HUD dismiss];
            [HUD showInfo:@"发送成功" onView:self];
            //清空发送时间
            self.sendTime = nil;
            self.messageView.text = @"";
            [self getTotalInputCount];
        } failure:^(MSServerResultBase *error) {
            [HUD dismiss];
            [HUD showInfo:error.retInfo onView:self];
        }];
    } failure:^(MSServerResultBase *error) {
        [HUD dismiss];
        [HUD showInfo:error.retInfo onView:self];
    }];
    
}
-(void)passConTextChange:(id)sender{
    UITextField* target=(UITextField*)sender;
    if ([target.text isEqualToString:@""]) {
        [self.phoneArrays removeAllObjects];
    }
    for (NSString *tmpStr in _phoneArrays) {
        if (![[target.text componentsSeparatedByString:@","] containsObject:tmpStr]) {
            [self.phoneArrays removeObject:tmpStr];
        }
    }
    for (NSString *temStr in [target.text componentsSeparatedByString:@","]) {
        if (![self.phoneArrays containsObject:temStr]) {
            //手机号校验
            if ([temStr isMobileNumber]) {
                [self.phoneArrays addObject:temStr];
            }
        }
    }
    if (self.phoneArrays.count == 0) {
        self.currentAddressNumber.text = @"当前收件号码共0个";
    }else{
        self.currentAddressNumber.text = [NSString stringWithFormat:@"当前收件号码共%lu个",(long)self.phoneArrays.count];
    }
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.placeholderL.hidden = YES;
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSInteger number = [textView.text length];
    NSInteger signnumber;
    if ([self.dropView.selectLabel.text isEqualToString:@"无签名"]) {
        signnumber = 0;
    }else{
        signnumber =self.dropView.selectLabel.text.length;
    }
    if (number>=300-4-signnumber)
    {
        //控制输入文本的长度
        return  NO;
    }
    if ([text isEqualToString:@"\n"]) {
        //禁止输入换行
        return NO;
    }
    if ([[[textView textInputMode] primaryLanguage] isEqualToString:@"emoji"] || ![[textView textInputMode] primaryLanguage]) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告！" message:@"不能输入表情" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
            [alertView show];
            return NO;
        }
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView
{
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //如果在变化中是高亮部分在变，就不要计算字符了
    if (selectedRange && pos) {
        return;
    }
    NSInteger number = [textView.text length];
    NSInteger signnumber;
    NSInteger messageCount = 1;
    if ([self.dropView.selectLabel.text isEqualToString:@"无签名"]) {
        signnumber = 0;
    }else{
        signnumber =self.dropView.selectLabel.text.length;
        
    }
    if (4+number+signnumber<=70) {
        messageCount = 1;
    }else{
        NSInteger tmeCount = (4+number+signnumber)/67;
        if ((4+number+signnumber)%67 == 0) {
            messageCount = tmeCount;
        }else{
            messageCount = tmeCount+1;
        }
    }
    self.inputLabel.text = [NSString stringWithFormat:@"包含签名，退订回T已输入%ld个字，还剩%ld字，最多300个字，手机计费条数:%ld条。",4+number+signnumber,300-4-number-signnumber,messageCount];
    NSArray *numbers = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:self.inputLabel.text];
    for (int i = 0; i < self.inputLabel.text.length; i ++) {
        NSString *a = [self.inputLabel.text substringWithRange:NSMakeRange(i, 1)];
        if ([numbers containsObject:a]) {
            [attributeString setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:FONTSIZE(17)} range:NSMakeRange(i, 1)];
        }
    }
    self.inputLabel.attributedText = attributeString;
}
- (void)changeSignCount:(NSString *)sign
{
    NSInteger number = [self.messageView.text length];
    NSInteger signnumber = sign.length;
    NSInteger messageCount = 1;
    if (4+number+signnumber<=70) {
        messageCount = 1;
    }else{
        NSInteger tmeCount = (4+number+signnumber)/67;
        if ((4+number+signnumber)%67 == 0) {
            messageCount = tmeCount;
        }else{
            messageCount = tmeCount+1;
        }
    }
    self.inputLabel.text = [NSString stringWithFormat:@"包含签名，退订回T已输入%ld个字，还剩%ld字，最多300个字，手机计费条数:%ld条。",4+number+signnumber,300-4-number-signnumber,messageCount];
    NSArray *numbers = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:self.inputLabel.text];
    for (int i = 0; i < self.inputLabel.text.length; i ++) {
        NSString *a = [self.inputLabel.text substringWithRange:NSMakeRange(i, 1)];
        if ([numbers containsObject:a]) {
            [attributeString setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:FONTSIZE(17)} range:NSMakeRange(i, 1)];
        }
    }
    self.inputLabel.attributedText = attributeString;
}
- (void)getTotalInputCount
{
    NSInteger number = [self.messageView.text length];
    NSInteger signnumber;
    NSInteger messageCount = 1;
    if ([self.dropView.selectLabel.text isEqualToString:@"无签名"]) {
        signnumber = 0;
    }else{
        signnumber =self.dropView.selectLabel.text.length;
        
    }
    if (4+number+signnumber<=70) {
        messageCount = 1;
    }else{
        NSInteger tmeCount = (4+number+signnumber)/67;
        if ((4+number+signnumber)%67 == 0) {
            messageCount = tmeCount;
        }else{
            messageCount = tmeCount+1;
        }
    }
    self.inputLabel.text = [NSString stringWithFormat:@"包含签名，退订回T已输入%ld个字，还剩%ld字，最多300个字，手机计费条数:%ld条。",4+number+signnumber,300-4-number-signnumber,messageCount];
    NSArray *numbers = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:self.inputLabel.text];
    for (int i = 0; i < self.inputLabel.text.length; i ++) {
        NSString *a = [self.inputLabel.text substringWithRange:NSMakeRange(i, 1)];
        if ([numbers containsObject:a]) {
            [attributeString setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:FONTSIZE(17)} range:NSMakeRange(i, 1)];
        }
    }
    self.inputLabel.attributedText = attributeString;
}
#pragma mark - THDatePickerViewDelegate
/**
 保存按钮代理方法
 @param timer 选择的数据
 */
- (void)datePickerViewSaveBtnClickDelegate:(NSString *)timer {
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, SCREENHEIGHT-HR_TabbarHeight, SCREENWIDTH, 300);
    }];
    self.sendTime = timer;
    NSLog(@"时间%@",timer);
    self.leftBtn.selected = NO;
    [self.leftBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
}
/**
 取消按钮代理方法
 */
- (void)datePickerViewCancelBtnClickDelegate {
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, SCREENHEIGHT-HR_TabbarHeight, SCREENWIDTH, 300);
    }];
    self.leftBtn.selected = NO;
    [self.leftBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
}
@end
