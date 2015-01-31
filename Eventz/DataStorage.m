//
//  DataStorage.m
//  Eventz
//
//  Created by rob on 25/01/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import "DataStorage.h"

@implementation DataStorage

static NSDictionary* Storage;

+(NSDictionary*) Storage
{
    @synchronized(self) {return Storage;}
}

+(void) setValue:(NSDictionary *)val
{
    @synchronized(self) {Storage = val;}
}


@end
