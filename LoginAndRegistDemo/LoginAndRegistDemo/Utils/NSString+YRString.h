//
//  NSString+YRString.h
//  LoginAndRegistDemo
//
//  Created by FicentDev on 8/11/16.
//  Copyright © 2016 yori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YRString)
/**
 *  判断输入是否为空
 */
+ (BOOL)isEmptyOrNullWithString:(NSString *)str;
/**
*  判断输入是否存在空格
*/
+ (BOOL)isExistSpaceCharacterWithString:(NSString *)str;
/**
 *  去除字符串中所有空格
 */
+ (NSString *)removeAllSpaceCharacterWithString:(NSString *)str;
@end
