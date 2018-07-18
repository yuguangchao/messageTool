//
//  MSHUD.m
//  messageTool
//
//  Created by yyy on 2018/5/5.
//  Copyright © 2018年 yyy. All rights reserved.
//

#import "MSHUD.h"
#import "UIView+Toast.h"
#import "UIView+Frame.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "MSHeaderFile.h"
@interface MSHUD () <MBProgressHUDDelegate>
@property (nonatomic) int interval;
@property (strong, nonatomic) NSTimer *timer;
@property (copy, nonatomic) dispatch_block_t Tblock;
@property (copy, nonatomic) dispatch_block_t TimeOutBlock;
@property (strong, nonatomic) MBProgressHUD *KeyHud;
@property (strong, nonatomic) UIImageView *animationView;
@property (nonatomic) CGFloat progress;
@end
@implementation MSHUD
+ (instancetype)hud
{
    
    static MSHUD *hud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[self alloc] init];
    });
    return hud;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.interval = 0;
        self.progress = 0.0;
    }
    return self;
}
- (void)dismiss
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        self.interval = 0;
        self.progress = 0.0;
    }
    if (self.KeyHud) {
        [self.KeyHud hideAnimated:YES];
        self.KeyHud = nil;
    }
    if (self.animationView.isAnimating) {
        [self.animationView stopAnimating];
    }
}
- (void)showCustomHudWithStatus:(NSString *)status onView:(UIView *)view
{
    [self dismiss];
    self.KeyHud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    self.KeyHud.mode = MBProgressHUDModeIndeterminate;
    self.KeyHud.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.5];
    self.KeyHud.label.text = status;
    self.KeyHud.removeFromSuperViewOnHide = YES;
    self.KeyHud.delegate = self;
    [self.KeyHud showAnimated:YES];
}
- (void)showInfo:(NSString *)info onView:(UIView *)view
{
    [self dismiss];
    if (!view) {
        return;
    }
    self.KeyHud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    self.KeyHud.mode = MBProgressHUDModeText;
    self.KeyHud.removeFromSuperViewOnHide = YES;
    self.KeyHud.offset = CGPointMake(0, 20);
    self.KeyHud.detailsLabel.font = FONTSIZE(15);
    self.KeyHud.detailsLabel.text = info;
    self.KeyHud.delegate = self;
    [self.KeyHud showAnimated:YES];
    [self.KeyHud hideAnimated:YES afterDelay:2.0];
}
@end
