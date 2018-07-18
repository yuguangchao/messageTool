//
//  MSRecommentView.m
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSRecommentView.h"
#import "TTTAttributedLabel.h"
#import "MSHeaderFile.h"
@interface MSRecommentView ()<TTTAttributedLabelDelegate>
@property (nonatomic, strong) UIImageView *erweimaImageV;
@property (nonatomic, strong) TTTAttributedLabel *ttLabel;
@end
@implementation MSRecommentView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.erweimaImageV];
        [self addSubview:self.ttLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_erweimaImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.width.height.mas_equalTo(SizeValueBase6Plus(200));
    }];
    [_ttLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.erweimaImageV.mas_bottom).offset(SizeValueBase6Plus(30));
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(SizeValueBase6Plus(200));
    }];
    
}
- (UIImageView *)erweimaImageV
{
    if (!_erweimaImageV) {
        _erweimaImageV = ({
            [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"erweima"]];
        });
    }
    return _erweimaImageV;
}
-(TTTAttributedLabel *)ttLabel
{
    if (!_ttLabel) {
        _ttLabel = ({
            TTTAttributedLabel *detailL = [[TTTAttributedLabel alloc] initWithFrame:CGRectNull];
            detailL.textAlignment = NSTextAlignmentCenter;
            detailL.numberOfLines = 3;
            detailL.font = FONTSIZE(16);
            detailL.textColor = [UIColor grayColor];
            detailL.delegate = self;
            detailL.enabledTextCheckingTypes = NSTextCheckingTypeLink;
            detailL.text = @"支持iOS9.0及以上系统\nwww.dxqf188.cn";
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
@end
