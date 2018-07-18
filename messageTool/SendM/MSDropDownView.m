//
//  MSDropDownView.m
//  messageTool
//
//  Created by yyy on 2018/5/8.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSDropDownView.h"
#import "MSHeaderFile.h"
#import "MSDropTableViewCell.h"
@interface MSDropDownView ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL showList;//是否弹出下拉列表
}
@end
@implementation MSDropDownView
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        showList = NO;
        self.tv.hidden = YES;
        [self addSubview:self.tv];
        [self addSubview:self.selectLabel];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_selectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.height.mas_equalTo(SizeValueBase6Plus(40));
    }];
    [_tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.selectLabel.mas_bottom);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(SizeValueBase6Plus(30)*5);
    }];
}
- (UITableView *)tv
{
    if (!_tv) {
        _tv = ({
           UITableView *tvv = [[UITableView alloc] init];
            tvv.delegate = self;
            tvv.dataSource = self;
            tvv.backgroundColor = [UIColor whiteColor];
            tvv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
            tvv;
        });
    }
    return _tv;
}
- (UILabel *)selectLabel
{
    if (!_selectLabel) {
        _selectLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.text = @"无签名";
            label.font = FONTSIZE(18);
            label.textAlignment = NSTextAlignmentLeft;
            label.adjustsFontSizeToFitWidth = YES;
            UITapGestureRecognizer *tapGestureno = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dropdown)];
            [label addGestureRecognizer:tapGestureno];
            label.userInteractionEnabled = YES;
            label;
        });
    }
    return _selectLabel;
}
-(void)dropdown{
    if (self.tableArray.count==0) {
        [HUD showInfo:@"暂无可用签名" onView:APPWindow];
        showList = NO;
        return;
    }
    if (showList) {//如果下拉框已显示，什么都不做
        return;
    }else {//如果下拉框尚未显示，则进行显示
        [self.superview bringSubviewToFront:self.tv];
        self.tv.hidden = NO;
        showList = YES;//显示下拉框
        [self.tv reloadData];
        [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView commitAnimations];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    MSDropTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MSDropTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.titleSign = [self.tableArray objectAtIndex:[indexPath row]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SizeValueBase6Plus(30);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectLabel.text = [self.tableArray objectAtIndex:[indexPath row]];
    showList = NO;
    self.tv.hidden = YES;
    if (self.selectSignBlock) {
        self.selectSignBlock(self.selectLabel.text);
    }
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)setTableArray:(NSArray *)tableArray
{
    _tableArray = tableArray;
    [_tv reloadData];
    if (tableArray.count!=0) {
        if (![tableArray containsObject:self.selectLabel.text]) {
            self.selectLabel.text = tableArray.firstObject;
        }else{
            
        }
    }else{
        self.selectLabel.text = @"无签名";
    }
}
@end
