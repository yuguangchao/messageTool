//
//  MSSendMView.h
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSDropDownView.h"
@interface MSSendMView : UIView
@property (nonatomic, strong) MSDropDownView *dropView;
@property (nonatomic, strong) UILabel *currentAddressNumber;
@property (nonatomic, strong) UITextField *addressField;
@property (nonatomic, strong) NSArray *signArray;
@property (nonatomic,strong) NSMutableArray *phoneArrays;
@property (nonatomic, copy) void (^addAddressBlock)(void);
@property (nonatomic, copy) void (^sendMessageSuccess)(NSString *yuer);
@end
