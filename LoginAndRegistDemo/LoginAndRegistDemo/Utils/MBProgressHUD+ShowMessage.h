//
//  MBProgressHUD+ShowMessage.h
//  LoginAndRegistDemo
//
//  Created by FicentDev on 8/9/16.
//  Copyright © 2016 yori. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (ShowMessage)

+ (void)showHUD:(UIView *)view meaasge:(NSString *)message;
//- (void)showHUD:(NSString *)message;
//- (void)loadHUD:(NSString *)message;
//+ (void)loadHUD:(UIView *)view meaasge:(NSString *)message;

@end
