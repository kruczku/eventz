//
//  Conference.m
//  Eventz
//
//  Created by rob on 27/01/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import "Conference.h"
#import "Lecture.h"
@implementation Conference


- (id) initWithDictionary:(NSDictionary*) dict{
    self = [super init];
    if (self)
    {
        self.DateStart = [Conference getEventStartDate:dict];
        self.DateEnd = [Conference getEventEndDate:dict];
        self.Description = [Conference getEventDescription:dict];
        self.Location = [Conference getEventLocation:dict];
        self.Partners = [Conference getEventPartners:dict];
        self.Subject = [Conference getEventSubject:dict];
        self.ImageURI = [Conference getEventImage:dict];
        if ([Conference HasLectures:dict])
        {
            self.Lectures = [[NSMutableArray alloc] init];
            for (int i = 0; i < [[dict valueForKey:@"zajecia"]count]; i++)
            {
                [self.Lectures addObject:[[Lecture alloc] initWithDictionary:[[dict valueForKey:@"zajecia"] objectAtIndex:i]]];
            }
        }
        
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

+ (NSString*) getEventStartDate:(NSDictionary*)conferences {
    NSString *description = [conferences valueForKey:@"data_rozpoczecia"];
    return description;
}

+ (NSString*) getEventEndDate:(NSDictionary*)conferences {
    NSString *description = [conferences valueForKey:@"data_zakonczenia"];
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

+ (NSString*) getEventImage:(NSDictionary*)conferences{
    NSString *description = [conferences valueForKey:@"obrazek"];
    return description;
}

+ (BOOL) HasLectures:(NSDictionary*) dict
{
    if ( [dict objectForKey:@"zajecia"] == nil){
        return false;
    }
    else{
        return true;
    }
}

@end
