//
//  UserService.h
//  Eventz
//
//  Created by Rafał Mańka on 12/20/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//

#ifndef Eventz_UserService_h
#define Eventz_UserService_h


#endif

@interface UserService : NSObject

+ (BOOL) isValidLogin:(NSString *)checkString;
+ (BOOL) isValidPassword:(NSString *)checkString;

@end