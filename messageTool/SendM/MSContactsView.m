//
//  MSContactsView.m
//  messageTool
//
//  Created by yyy on 2018/5/10.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSContactsView.h"
#import "MSHeaderFile.h"
#import "MSContactsTableViewCell.h"
#import "NSString+RegexCategory.h"
@interface MSContactsView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIButton *confimBtn;
@property (nonatomic, strong) UIButton *zhengxuanBtn;
@property (nonatomic, strong) UIButton *fanxuanBtn;
@end
@implementation MSContactsView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.tableView];
        [self addSubview:self.confimBtn];
        [self addSubview:self.zhengxuanBtn];
        [self addSubview:self.fanxuanBtn];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.confimBtn.mas_top);
    }];
    [_confimBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(self);
        make.width.mas_equalTo(SizeValueBase6Plus(160));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_zhengxuanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SizeValueBase6Plus(30));
        make.bottom.mas_equalTo(self);
        make.width.mas_equalTo(SizeValueBase6Plus(90));
        make.height.mas_equalTo(SizeValueBase6Plus(40));
        
    }];
    [_fanxuanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.confimBtn.mas_left).offset(SizeValueBase6Plus(-30));
        make.bottom.mas_equalTo(self);
        make.width.mas_equalTo(SizeValueBase6Plus(90));
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
            tableV;
        });
    }
    return _tableView;
}
- (UIButton *)confimBtn
{
    if (!_confimBtn) {
        _confimBtn = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = MSBlueColor;
            button.layer.cornerRadius = SizeValueBase6Plus(6);
            [button setTitle:@"确定" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(22);
            [button addTarget:self action:@selector(logoutClick) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _confimBtn;
}
- (UIButton *)zhengxuanBtn
{
    if (!_zhengxuanBtn) {
        _zhengxuanBtn = ({
            UIButton *button = [[UIButton alloc] init];
            button.backgroundColor = [UIColor whiteColor];
            [button setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
            [button setTitle:@"全选" forState:UIControlStateNormal];
            [button setTitleColor:MSBlueColor forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(18);
            [button addTarget:self action:@selector(ZtipClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _zhengxuanBtn;
}
- (UIButton *)fanxuanBtn
{
    if (!_fanxuanBtn) {
        _fanxuanBtn = ({
            UIButton *button = [[UIButton alloc] init];
            button.backgroundColor = [UIColor whiteColor];
            [button setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
            [button setTitle:@"反选" forState:UIControlStateNormal];
            [button setTitleColor:MSBlueColor forState:UIControlStateNormal];
            button.titleLabel.font = FONTSIZE(18);
            [button addTarget:self action:@selector(FtipClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _fanxuanBtn;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.addBookList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SizeValueBase6Plus(50);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"contactsViewCell";
    MSContactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[MSContactsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    MSAddressBookModel * temmodel = self.addBookList[indexPath.row];
    __weak typeof(self) weakself=self;
    cell.seleContacts = ^(BOOL isselect) {
        temmodel.isSelected = isselect;
        //一旦单选,全选和反选就都置空
        weakself.fanxuanBtn.selected = NO;
        [weakself.fanxuanBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
        [weakself.fanxuanBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
        
        weakself.zhengxuanBtn.selected = NO;
        [weakself.zhengxuanBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
        [weakself.zhengxuanBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
        NSMutableArray *seleArr = [NSMutableArray array];
        for (MSAddressBookModel *model in weakself.addBookList) {
            [seleArr addObject:@(model.isSelected)];
        }
        if ([seleArr containsObject:@(NO)]) {
        }else{
            //一直到全部单选 就等于全选
            weakself.zhengxuanBtn.selected = YES;
            [weakself.zhengxuanBtn setImage:[UIImage imageNamed:@"Agreemenselect"] forState:UIControlStateNormal];
            [weakself.zhengxuanBtn setImage:[UIImage imageNamed:@"Agreemenselect"] forState:UIControlStateHighlighted];
        }
    };
    cell.model = temmodel;
    return cell;
}
- (void)logoutClick
{
    //选中手机号
    NSMutableString *muStr = [NSMutableString string];
    for (MSAddressBookModel *model in self.addBookList) {
        if (model.isSelected) {
                //手机号校验
                if ([model.phoneModel isMobileNumber]) {
                    [muStr appendFormat:@"%@,",model.phoneModel];
                }
        }
    }
    if ([muStr isEqualToString:@""]) {
        [[NSUserDefaults standardUserDefaults] setObject:muStr forKey:MSAddressList];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [HUD showInfo:@"没有选取通讯录的手机号" onView:APPWindow];
    }else{
        //去掉最后一个逗号
        [[NSUserDefaults standardUserDefaults] setObject:[muStr substringToIndex:muStr.length - 1] forKey:MSAddressList];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    if (self.confrimBlock) {
        self.confrimBlock();
    }
}
- (void)ZtipClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [btn setImage:[UIImage imageNamed:@"Agreemenselect"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"Agreemenselect"] forState:UIControlStateHighlighted];
        //全选与单选不能同时存在
        if (self.fanxuanBtn.selected) {
            self.fanxuanBtn.selected = !self.fanxuanBtn.selected;
            [self.fanxuanBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
            [self.fanxuanBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
        }
        //全选就是全部选中
        for (MSAddressBookModel *model in self.addBookList) {
            model.isSelected  = YES;
            [self.tableView reloadData];
        }
    }
    else {
        //取消全选就是全部不选
        [btn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
        for (MSAddressBookModel *model in self.addBookList) {
            model.isSelected  = NO;
            [self.tableView reloadData];
        }
    }
}
- (void)FtipClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [btn setImage:[UIImage imageNamed:@"Agreemenselect"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"Agreemenselect"] forState:UIControlStateHighlighted];
        //全选与单选不能同时存在
        if (self.zhengxuanBtn.selected) {
            self.zhengxuanBtn.selected = !self.zhengxuanBtn.selected;
            [self.zhengxuanBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
            [self.zhengxuanBtn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
        }
    }
    else {
        [btn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"Agreemennor"] forState:UIControlStateHighlighted];
    }
    //反选就是状态置反，取消反选就是置回原来状态
    for (MSAddressBookModel *model in self.addBookList) {
        model.isSelected  = !model.isSelected;
        [self.tableView reloadData];
    }
}
- (void)setAddBookList:(NSArray *)addBookList
{
    _addBookList = addBookList;
    NSString *addList = [[NSUserDefaults standardUserDefaults] objectForKey:MSAddressList];
    NSMutableArray *totalArr = [NSMutableArray array];
    if (![addList isEqualToString:@""]) {
        NSArray *addArr = [addList componentsSeparatedByString:@","];
        //去重复
        for (NSString *str in addArr) {
            if (![totalArr containsObject:str]) {
                [totalArr addObject:str];
            }
        }
    }
    for (MSAddressBookModel *model in addBookList) {
        if ([totalArr containsObject:model.phoneModel]) {
            model.isSelected = YES;
        }
    }
    [self.tableView reloadData];
}
@end
