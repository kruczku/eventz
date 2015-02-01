//
//  ConferenceDetailsViewController.h
//  Eventz
//
//  Created by Rafał Mańka on 1/31/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Conference.h"


@interface ConferenceDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lbConferenceTitle;
@property (nonatomic, retain)Conference *DataContext;
@property (weak, nonatomic) IBOutlet UITableViewCell *tabLectures;
@property (weak, nonatomic) IBOutlet UITextField *tfPlace;
@property (weak, nonatomic) IBOutlet UITextField *tfTime;
@property (weak, nonatomic) IBOutlet UIImageView *imgImage;

@end
