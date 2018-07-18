//
//  MSMoreView.h
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSMoreView : UIView
@property (copy, nonatomic) dispatch_block_t resivePassBlock;
@property (copy, nonatomic) dispatch_block_t setSignBlock;
@property (copy, nonatomic) dispatch_block_t HelpCenterBlock;
@property (copy, nonatomic) dispatch_block_t logOutBlock;
@property (copy, nonatomic) dispatch_block_t PrivacyBlock;
@end
