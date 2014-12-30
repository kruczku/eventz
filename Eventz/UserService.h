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

#import <UIKit/UIKit.h>
#import "ResponseLogin.h"
#import "User.h"


@interface UserService : NSObject

- (id) init:(id) delegate;
- (BOOL) isValidLogin:(NSString *)checkString;
- (BOOL) isValidPassword:(NSString *)checkString;
- (void) startRequestLogin:(NSString*)login
              withPassword:(NSString*)password;
+ (NSDictionary*) getUserDataDictionary:(ResponseLogin *) responseData;

@property (nonatomic, retain) id delegate;

@end