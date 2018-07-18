//
//  MSHelpCenterView.m
//  messageTool
//
//  Created by yyy on 2018/5/6.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSHelpCenterView.h"
#import "TTTAttributedLabel.h"
#import "MSHeaderFile.h"
@interface MSHelpCenterView ()<TTTAttributedLabelDelegate>
@property (nonatomic, strong) TTTAttributedLabel *ttLabel;
@end
@implementation MSHelpCenterView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.ttLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_ttLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).offset(SizeValueBase6Plus(10));
        make.right.mas_equalTo(self).offset(SizeValueBase6Plus(-10));
    }];
}
-(TTTAttributedLabel *)ttLabel
{
    if (!_ttLabel) {
        _ttLabel = ({
            TTTAttributedLabel *detailL = [[TTTAttributedLabel alloc] initWithFrame:CGRectNull];
            detailL.textAlignment = NSTextAlignmentLeft;
            detailL.numberOfLines = 0;
            detailL.font = FONTSIZE(16);
            detailL.textColor = [UIColor grayColor];
            detailL.delegate = self;
            detailL.enabledTextCheckingTypes = NSTextCheckingTypeLink|NSTextCheckingTypePhoneNumber;
            detailL.text = @"1、我手机里已经有发短信功能，为什么要用APP发送短信呢？\n答：现在运营商对手机群发短信有限制，如果经常群发的话，容易锁卡。\n2、现在微信发信息很方便，我为什么还要用APP发送短信呢？\n答: 微信主要用于熟人，即“朋友圈”里面的沟通工具。对于正式的通知、祝福、提醒、以及正规的营销信息还是用短信群发器APP更加方便。 另外此APP还有微信所不具有的大批量群发功能（没有200条的限制），以及定时发送功能。\n3、我想试用一下这个APP，可以吗？\n答：新用户可以与客服人员联系免费测试短信。\n4、第一次登入APP时，我看到“读取联系人”的提示，但选择了禁止，现在我想打开这个权限，应该怎么处理？\n答：可以在手机“设置”-“隐私”-“通讯录”中打开相应权限\n5、如果我想大批量群发正规的营销信息，但这些联系人号码又不在我的手机上，我应该怎么处理？\n答：您可以使用我们网址进行群发，具体操作。电脑端登陆网址：http://www.dxqf188.cn\n直接输入你的账号密码即可直接使用。\n有任何其他疑问，请随时联系我们的客服：\nQQ：1291606789\n电话：15822330727王经理（同微信）。";
            detailL;
        });
    }
    return _ttLabel;
}
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    if (SYSTEM_VERSION >= 10.0) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }else{
        [[UIApplication sharedApplication] openURL:url];
    }
}
- (void)attributedLabel:(TTTAttributedLabel *)label
didSelectLinkWithPhoneNumber:(NSString *)phoneNumber
{
    if (SYSTEM_VERSION >= 10.0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]] options:@{} completionHandler:nil];
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];
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
