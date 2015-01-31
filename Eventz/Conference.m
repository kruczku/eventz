//
//  Conference.m
//  Eventz
//
//  Created by rob on 27/01/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import "Conference.h"

@implementation Conference


- (id) initWithDictionary:(NSDictionary*) dict{
    self = [super init];
    if (self)
    {
        self.DateStart = [Conference getEventDate:dict];
        self.Description = [Conference getEventDescription:dict];
        self.Location = [Conference getEventLocation:dict];
        self.Partners = [Conference getEventPartners:dict];
        self.Subject = [Conference getEventSubject:dict];
    }
    return self;
}

+ (NSString*) getEventSubject:(NSDictionary*)conferences{
    NSString *title = [conferences valueForKey:@"temat"];
    return title;
}

+ (NSString*) getEventDescription:(NSDictionary*)conferences{
    NSString *description = [conferences valueForKey:@"opis"];
    return description;
}

+ (NSString*) getEventDate:(NSDictionary*)conferences {
    NSString *description = [conferences valueForKey:@"data"];
    return description;
}


+ (NSString*) getEventLocation:(NSDictionary*)conferences{
    NSString *description = [conferences valueForKey:@"miejsce"];
    return description;
}


+ (NSString*) getEventPartners:(NSDictionary*)conferences{
    NSString *description = [conferences valueForKey:@"partnerzy"];
    return description;
}

@end
