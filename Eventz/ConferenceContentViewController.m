//
//  ConferenceContentViewController.m
//  Eventz
//
//  Created by rob on 30/01/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import "ConferenceContentViewController.h"
#import "ConferenceDetailsViewController.h"

@interface ConferenceContentViewController ()

@end

@implementation ConferenceContentViewController

- (IBAction)onLabelClicked:(id)sender {
    NSLog(@"label clicked");
}

-(id) initWithConference:(Conference*) conf
{
    self = [super init];
    if (self){
        self.DataContext = conf;
    }
    return self;
}

 
- (void)viewDidLoad {
    [super viewDidLoad]; 
    
    self.Subject.text = self.DataContext.Subject;
    self.DateStart.text = self.DataContext.DateStart;
    self.tvDescription.text = self.DataContext.Description;
    [self.tvDescription setFont:[UIFont boldSystemFontOfSize:18]];
    self.Location.text = self.DataContext.Location;
    self.Partners.text = self.DataContext.Partners;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"show-conf-details"]) {
        ConferenceDetailsViewController *senderEntry = (ConferenceDetailsViewController*)sender;
        senderEntry.DataContext = self.DataContext;
        
//        [segue destinationViewController].delegate = self;
//        [segue destinationViewController].entry = entry;
        return;

    }
}

@end
