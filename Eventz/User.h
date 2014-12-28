//
//  User.h
//  Eventz
//
//  Created by Rafał Mańka on 12/20/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//

#import "JSONModel.h"

@interface User : JSONModel

    @property (nonatomic, assign) int id;
    @property (nonatomic, assign) NSString* name;
    @property (nonatomic, assign) NSString* surname; 

@end

@protocol UserDelegate

- (void)didLoginUser:(User*)user;
- (void)didLoginRefused;

@end