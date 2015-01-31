//
//  ConferenceContentViewController.h
//  Eventz
//
//  Created by rob on 30/01/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Conference.h"

@interface ConferenceContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *Subject;
@property (weak, nonatomic) IBOutlet UILabel *DateStart;
@property (weak, nonatomic) IBOutlet UILabel *Location;
@property (strong, nonatomic) IBOutlet UITextView *tvDescription;

@property (weak, nonatomic) IBOutlet UILabel *Partners;
@property NSUInteger pageIndex;
@property Conference *DataContext;


-(id) initWithConference:(Conference*) conf;

@end
