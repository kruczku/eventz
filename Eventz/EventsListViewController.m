//
//  EventsListViewController.m
//  Eventz
//
//  Created by Kamil Debowski on 1/8/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import "EventsListViewController.h"

@interface EventsListViewController ()

@end

@implementation EventsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *jsonAddress = @"http://json.rafalmanka.pl/proh/conferences";
    NSURL *jsonURL = [NSURL URLWithString:jsonAddress];
    NSDictionary *json = [EventsListViewController getJSONData:jsonURL];
    
    //USE THIS JSON FILE TO CREATE EVENTS LIST
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+(NSDictionary*) getJSONData:(NSURL*)jsonURL {
    NSData *jsonFile = [[NSData alloc] initWithContentsOfURL:jsonURL];
    return [NSJSONSerialization JSONObjectWithData:jsonFile options:NSJSONReadingMutableContainers error:nil];
}


@end
