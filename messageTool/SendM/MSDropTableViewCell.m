//
//  MSDropTableViewCell.m
//  messageTool
//
//  Created by yyy on 2018/5/9.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSDropTableViewCell.h"
#import "MSHeaderFile.h"
@interface MSDropTableViewCell ()
@property (nonatomic, strong) UILabel *titleLa;
@end
@implementation MSDropTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLa];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_titleLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.contentView);
    }];
}
- (UILabel *)titleLa
{
    if (!_titleLa) {
        _titleLa = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = FONTSIZE(18);
            label.textAlignment = NSTextAlignmentCenter;
            label.adjustsFontSizeToFitWidth = YES;
            label;
        });
    }
    return _titleLa;
}
- (void)setTitleSign:(NSString *)titleSign
{
    _titleSign = titleSign;
    self.titleLa.text = titleSign;
}
@end
