//
//  DataStorage.h
//  Eventz
//
//  Created by rob on 25/01/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStorage : NSObject


+ (NSDictionary*) Storage;
+ (void) setValue:(NSDictionary*)val;


@end
