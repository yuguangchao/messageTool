//
//  MSDropDownView.h
//  messageTool
//
//  Created by yyy on 2018/5/8.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSDropDownView : UIView
@property (nonatomic,strong) UITableView *tv;
@property (nonatomic,strong) UILabel *selectLabel;
@property (nonatomic,strong) NSArray *tableArray;
@property (nonatomic, copy) void (^selectSignBlock)(NSString *selectStr);
@end
