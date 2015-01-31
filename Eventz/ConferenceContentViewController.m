//
//  ConferenceContentViewController.m
//  Eventz
//
//  Created by rob on 30/01/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import "ConferenceContentViewController.h"

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
    // Do any additional setup after loading the view.
    
    self.Subject.text = self.DataContext.Subject;
    self.DateStart.text = self.DataContext.DateStart;
    self.Description.text = self.DataContext.Description;
    self.Location.text = self.DataContext.Location;
    
    self.Partners.text = self.DataContext.Partners;
    
    
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
