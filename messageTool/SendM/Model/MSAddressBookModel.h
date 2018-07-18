//
//  MSAddressBookModel.h
//  messageTool
//
//  Created by yyy on 2018/5/11.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSAddressBookModel : NSObject
@property (nonatomic, copy) NSString *nameModel;
@property (nonatomic, copy) NSString *phoneModel;
@property (nonatomic, copy) NSString *pinyinName;
@property (nonatomic) BOOL isSelected;
@end
