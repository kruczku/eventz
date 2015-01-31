//
//  Lecture.h
//  Eventz
//
//  Created by rob on 27/01/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lecture : NSObject


@property NSString* Subject;
@property int Tickets;
@property NSDate* DateStart;
@property NSDate* DateEnd;
@property NSString* Location;
@property NSArray* Tags;
@property NSString* Description;
@property NSString* Speaker;




@end
