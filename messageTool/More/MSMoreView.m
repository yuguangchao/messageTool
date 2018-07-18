//
//  MSMoreView.m
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSMoreView.h"
#import "MSHeaderFile.h"
#import "MSMoreTableViewCell.h"
#import "MSMoreViewModel.h"
@interface MSMoreView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) MSMoreViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *logoutBtn;
@end
@implementation MSMoreView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.viewModel = [[MSMoreViewModel alloc] init];
        [self addSubview:self.tableView];
        [self addSubview:self.logoutBtn];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.logoutBtn);
    }];
    [_logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self).offset(SizeValueBase6Plus(-100));
        make.width.mas_equalTo(SizeValueBase6Plus(200));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
                    UITableView *tableV = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
                    tableV.delegate = self;
                    tableV.dataSource = self;
                    tableV.tableFooterView = [[UIView alloc] initWithFrame:CGRectNull];
                    tableV.scrollEnabled = NO;
                    tableV;
        });
    }
    return _tableView;
}
- (UIButton *)logoutBtn
{
    if (!_logoutBtn) {
        _logoutBtn = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = MSBlueColor;
            button.layer.cornerRadius = SizeValueBase6Plus(8);
            [button setTitle:@"退出登录" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(22);
            [button addTarget:self action:@selector(logoutClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _logoutBtn;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.functionArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SizeValueBase6Plus(50);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"moreViewCell";
    MSMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[MSMoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;  
    }
    cell.model = self.viewModel.functionArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && self.resivePassBlock) {
        self.resivePassBlock();
    }
    if (indexPath.row == 1 && self.setSignBlock) {
        self.setSignBlock();
    }
    if (indexPath.row ==2 && self.HelpCenterBlock) {
        self.HelpCenterBlock();
    }
    if (indexPath.row ==3 && self.PrivacyBlock) {
        self.PrivacyBlock();
    }
}
- (void)logoutClick:(UIButton *)btn
{
    if (self.logoutBtn) {
        self.logOutBlock();
    }
}
@end
