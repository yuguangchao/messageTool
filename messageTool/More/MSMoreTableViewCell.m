//
//  MSMoreTableViewCell.m
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSMoreTableViewCell.h"
#import "MSHeaderFile.h"
@interface MSMoreTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageV;
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation MSMoreTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconImageV];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(SizeValueBase6Plus(20));
        make.centerY.mas_equalTo(self.contentView);
        make.width.height.mas_equalTo(SizeValueBase6Plus(30));
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageV.mas_right).offset(SizeValueBase6Plus(20));
        make.centerY.mas_equalTo(self.iconImageV);
        make.height.mas_equalTo(SizeValueBase6Plus(30));
    }];
}
- (UIImageView *)iconImageV
{
    if (!_iconImageV) {
        _iconImageV = ({
            [[UIImageView alloc] init];
        });
    }
    return _iconImageV;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.textColor = MSBlueColor;
            label.font = FONTSIZE(18);
            label.textAlignment = NSTextAlignmentLeft;
            label;
        });
    }
    return _titleLabel;
}
- (void)setModel:(MSMoreFunctionModel *)model
{
    self.iconImageV.image = [UIImage imageNamed:model.imageurl];
    self.titleLabel.text = model.title;
}
@end
