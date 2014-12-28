//
//  User.h
//  Eventz
//
//  Created by Rafał Mańka on 12/20/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//

#ifndef Eventz_User_h
#define Eventz_User_h
#endif

#import <UIKit/UIKit.h>
#import "JSONModel.h"

@class User;

@protocol UserDelegate

- (void)didLoginUser:(User*)user; 

@end

@interface User : JSONModel

    @property (nonatomic, assign) int id;
    @property (nonatomic, assign) NSString* name;
    @property (nonatomic, assign) NSString* surname; 

@end