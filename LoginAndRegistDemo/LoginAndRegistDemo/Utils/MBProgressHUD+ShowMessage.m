//
//  MBProgressHUD+ShowMessage.m
//  LoginAndRegistDemo
//
//  Created by FicentDev on 8/9/16.
//  Copyright © 2016 yori. All rights reserved.
//

#import "MBProgressHUD+ShowMessage.h"

@implementation MBProgressHUD (ShowMessage)

+ (void)showHUD:(UIView *)view meaasge:(NSString *)message {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud showHUD:message];
}

- (void)showHUD:(NSString *)message {
    
    self.mode = MBProgressHUDModeText;
    self.label.text = message;
    
    self.offset = CGPointMake(0.f, MBProgressMaxOffset);
    
    [self hideAnimated:YES afterDelay:2.f];
}

@end


