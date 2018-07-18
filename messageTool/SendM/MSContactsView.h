//
//  MSContactsView.h
//  messageTool
//
//  Created by yyy on 2018/5/10.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSContactsView : UIView
@property (nonatomic, strong) NSArray *addBookList;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) void (^confrimBlock)();
@end
