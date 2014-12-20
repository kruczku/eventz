//
//  UserService.m
//  Eventz
//
//  Created by Rafał Mańka on 12/20/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserService.h"
#import "StringUtils.h"

@implementation UserService

+ (BOOL) isValidLogin:(NSString *)checkString {
    BOOL isValidEmail = [StringUtils isValidEmail:checkString];
    return isValidEmail;
}

+ (BOOL) isValidPassword:(NSString *)checkString {
    BOOL isValidPassword = checkString.length > 5;
    return isValidPassword;
}

@end