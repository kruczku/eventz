//
//  ResponseLogin.h
//  Eventz
//
//  Created by Rafał Mańka on 12/27/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//

#ifndef Eventz_ResponseLogin_h
#define Eventz_ResponseLogin_h 
#endif

#import "ResponseBase.h"
#import "User.h"

@interface ResponseLogin : ResponseBase

@property (nonatomic, assign) User* user;

@end