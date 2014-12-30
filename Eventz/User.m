//
//  User.m
//  Eventz
//
//  Created by Rafał Mańka on 12/20/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//
 
#import "User.h"

@implementation User

- (id)initWithResponseData:(NSDictionary*) userDictionary
{
    self.name = [userDictionary valueForKey:@"name"];
    self.surname = [userDictionary valueForKey:@"surname"];
    self.id = (int)[userDictionary valueForKey:@"id"];
    return self;
}

@end