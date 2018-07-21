//
//  MSLoginView.h
//  messageTool
//
//  Created by yyy on 2018/5/4.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSLoginView : UIView
@property (copy, nonatomic) void (^loginViewBlock)(NSString *account,NSString *password);
@property (copy, nonatomic) dispatch_block_t learnAgreementBlock;
@property (nonatomic, copy) void (^registerBlock)();
@end
