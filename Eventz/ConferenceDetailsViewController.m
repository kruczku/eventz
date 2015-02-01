//
//  ConferenceDetailsViewController.m
//  Eventz
//
//  Created by Rafał Mańka on 1/31/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import "ConferenceDetailsViewController.h"

@interface ConferenceDetailsViewController ()

@end

@implementation ConferenceDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lbConferenceTitle.text = self.DataContext.Subject;
    self.tfPlace.text = self.DataContext.Location;
    NSString * duration = self.DataContext.DateStart;
    if (![self.DataContext.DateEnd isEqualToString: self.DataContext.DateStart]){
        duration = [duration stringByAppendingString:@" - "];
        duration = [duration stringByAppendingString:self.DataContext.DateEnd ];
    }
    self.tfTime.text = duration;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
