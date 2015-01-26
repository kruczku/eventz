//
//  EventsListViewController.h
//  Eventz
//
//  Created by Kamil Debowski on 1/8/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsListViewController : UIViewController

+(NSDictionary*) getJSONData:(NSURL*)jsonURL;

@end
