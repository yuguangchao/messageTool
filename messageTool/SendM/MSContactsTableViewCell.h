//
//  MSContactsTableViewCell.h
//  messageTool
//
//  Created by yyy on 2018/5/10.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSAddressBookModel.h"
@interface MSContactsTableViewCell : UITableViewCell
@property (copy, nonatomic) void (^seleContacts)(BOOL isselect);
@property (nonatomic,strong) MSAddressBookModel *model; 
@end
