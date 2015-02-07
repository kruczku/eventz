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
    
    [self setupDetailsButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"show-conf-details"]) {
        ConferenceDetailsViewController *senderEntry = (ConferenceDetailsViewController*)segue.destinationViewController;
        senderEntry.DataContext = self.DataContext;
        
//        [segue destinationViewController].delegate = self;
//        [segue destinationViewController].entry = entry;
        return;

    }
}

- (void) setupDetailsButton{
    UIButton* btn = [self btnDetails];
    btn.frame = CGRectMake(100, 100, 100,50);
    btn.frame = CGRectMake(100.0, 100.0, 120.0, 50.0);
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 7;
    btn.layer.borderWidth=1.0f;
    btn.layer.borderColor=[UIColor colorWithRed:18.0/255.0f green:77.0/255.0f  blue:18.0/255.0f alpha:0.7].CGColor;
}

@end
