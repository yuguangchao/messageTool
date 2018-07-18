//
//  MSContactsTableViewCell.m
//  messageTool
//
//  Created by yyy on 2018/5/10.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSContactsTableViewCell.h"
#import "MSHeaderFile.h"
@interface MSContactsTableViewCell ()
@property (nonatomic, strong) UIButton *seleBtn;
@property (nonatomic, strong) UILabel *nameL;
@property (nonatomic, strong) UILabel *numberL;
@end
@implementation MSContactsTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.seleBtn];
        [self.contentView addSubview:self.nameL];
        [self.contentView addSubview:self.numberL];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_seleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(SizeValueBase6Plus(10));
        make.right.mas_equalTo(self.nameL.mas_left).offset(SizeValueBase6Plus(-10));
        make.centerY.mas_equalTo(self.contentView);
        make.height.width.mas_equalTo(SizeValueBase6Plus(30));
    }];
    [_nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.numberL.mas_left);
    }];
    [_numberL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(SizeValueBase6Plus(-20));
        make.width.mas_equalTo(SizeValueBase6Plus(120));
    }];
}
- (UIButton *)seleBtn
{
    if (!_seleBtn) {
        _seleBtn = ({
            UIButton *button = [[UIButton alloc] init];
            [button setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
            [button addTarget:self action:@selector(tipClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _seleBtn;
}
- (UILabel *)nameL
{
    if (!_nameL) {
        _nameL = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor grayColor];
            lable;
        });
    }
    return _nameL;
}
- (UILabel *)numberL
{
    if (!_numberL) {
        _numberL = ({
            UILabel *lable = [[UILabel alloc] init];
            lable.textAlignment = NSTextAlignmentRight;
            lable.font = FONTSIZE(17);
            lable.textColor = [UIColor grayColor];
            lable;
        });
    }
    return _numberL;
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
    if (self.seleContacts) {
        self.seleContacts(btn.selected);
    }
}
- (void)setModel:(MSAddressBookModel *)model
{
    _model = model;
    self.nameL.text = model.nameModel;
    self.numberL.text = model.phoneModel;
    self.seleBtn.selected = model.isSelected;
    if (self.seleBtn.selected) {
        [self.seleBtn setImage:[UIImage imageNamed:@"Agreemenselect"] forState:UIControlStateNormal];
        [self.seleBtn setImage:[UIImage imageNamed:@"Agreemenselect"] forState:UIControlStateHighlighted];
    }
    else {
        [self.seleBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
        [self.seleBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
    }
}
@end
