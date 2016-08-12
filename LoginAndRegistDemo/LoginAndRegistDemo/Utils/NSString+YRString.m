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
        return YES;
    }
    
    return NO;
}

+ (BOOL)isExistSpaceCharacterWithString:(NSString *)str {
    
    if ([str rangeOfString:@" "].location != NSNotFound) {
        return YES;
    }
    
    return NO;
}

+ (NSString *)removeAllSpaceCharacterWithString:(NSString *)str {
    
    NSString *newString = [str stringByReplacingOccurrencesOfString:@" " withString:@""];//去掉字符串中所有的空格符
    
//    NSString *whiteSpace = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];//去掉字符串首尾空格符
    
    return newString;
}

@end
