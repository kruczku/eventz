//
//  Lecture.m
//  Eventz
//
//  Created by rob on 27/01/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import "Lecture.h"

@implementation Lecture


-(id) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.Subject = [Lecture getEventSubject:dict];
        self.Tickets = [Lecture getEventTickets:dict];
        self.TimeStart = [Lecture getEventStart:dict];
        self.TimeEnd = [Lecture getEventEnd:dict];
        self.Location = [Lecture getEventLocation:dict];
        self.Tags = [Lecture getEventTags:dict];
        self.Description = [Lecture getEventDescription:dict];
        self.Speaker = [Lecture getEventSpeaker:dict];
        
    }
    return self;
    
    
}




+ (NSString*) getEventSubject:(NSDictionary*)lectures{
    NSString *title = [lectures valueForKey:@"temat"];
    return title;
}

+ (int) getEventTickets:(NSDictionary*)lectures{
    NSString *tmp = [lectures valueForKey:@"liczba_miejsc"];
    int tickets = tmp.integerValue;
    return tickets;
}

+ (NSString*) getEventStart:(NSDictionary*)lectures{
    NSString *title = [lectures valueForKey:@"poczatek"];
    return title;
}

+ (NSString*) getEventEnd:(NSDictionary*)lectures{
    NSString *title = [lectures valueForKey:@"koniec"];
    return title;
}

+ (NSString*) getEventLocation:(NSDictionary*)lectures{
    NSString *title = [lectures valueForKey:@"miejsce"];
    return title;
}
                         
+ (NSString*) getEventTags:(NSDictionary*)lectures{
    NSString *title = [lectures valueForKey:@"tagi"];
    return title;
}

+ (NSString*) getEventDescription:(NSDictionary*)lectures{
    NSString *title = [lectures valueForKey:@"opis"];
    return title;
}

+ (NSString*) getEventSpeaker:(NSDictionary*)lectures{
    NSString *title = [lectures valueForKey:@"prowadzacy"];
    return title;
}
@end
