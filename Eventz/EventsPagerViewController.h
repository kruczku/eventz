//
//  EventsListViewController.h
//  Eventz
//
//  Created by Kamil Debowski on 1/8/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Conference.h"
#import "ConferenceContentViewController.h"

@interface EventsPagerViewController : UIViewController <UIPageViewControllerDataSource>

@property (nonatomic, assign) NSDictionary* events;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSMutableArray *ConferencesList;

- (void) getJSONData:(NSURL*)jsonURL;

@end
