//
//  Conference.h
//  Eventz
//
//  Created by rob on 27/01/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Conference : NSObject

@property NSString* Subject;
@property NSString* DateStart;
@property NSString* DateEnd;
@property NSString* Location;
@property NSString* Partners;
@property NSString* Description;
@property NSString* ImageURI;
@property NSMutableArray* Lectures;

- (id) initWithDictionary:(NSDictionary*) dict;
@end
