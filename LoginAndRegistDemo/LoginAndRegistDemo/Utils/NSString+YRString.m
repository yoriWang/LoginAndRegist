//
//  NSString+YRString.m
//  LoginAndRegistDemo
//
//  Created by FicentDev on 8/11/16.
//  Copyright © 2016 yori. All rights reserved.
//

#import "NSString+YRString.h"

@implementation NSString (YRString)

+ (BOOL)isEmptyOrNullWithString:(NSString *)str {
    
    if (str == NULL || str.length == 0) {
        return NO;
    }
    
    return YES;
}

+ (BOOL)isExistSpaceCharacterWithString:(NSString *)str {
    
    if ([str rangeOfString:@" "].location != NSNotFound) {
        return YES;
    }
    
    return NO;
}

+ (NSString *)removeAllSpaceCharacterWithString:(NSString *)str {
    return nil;
}

@end
